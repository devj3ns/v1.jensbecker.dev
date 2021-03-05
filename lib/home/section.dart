import 'package:flutter/material.dart';

import '../shared/extensions.dart';

class Section extends StatelessWidget {
  const Section({
    @required this.title,
    @required this.child,
    this.subtitle,
    this.applyHorizontalMargin = true,
    this.doubleTopMargin = false,
    this.doubleBottomMargin = false,
  });
  final String title;
  final Widget child;
  final String subtitle;
  final bool applyHorizontalMargin;
  final bool doubleTopMargin;
  final bool doubleBottomMargin;

  @override
  Widget build(BuildContext context) {
    final horizontalMargin = applyHorizontalMargin
        ? context.responsiveNumber(
            onMobile: 15,
            onTablet: 50,
            onDesktop: context.screenWidth / 8,
          )
        : 0.0;
    var marginTop =
        context.responsiveNumber(onMobile: 20, onTablet: 40, onDesktop: 60);
    var marginBottom = marginTop;

    marginTop = doubleTopMargin ? marginTop * 2 : marginTop;
    marginBottom = doubleBottomMargin ? marginBottom * 2 : marginBottom;

    final titleFontSize =
        context.responsiveNumber(onMobile: 25, onTablet: 28, onDesktop: 30);

    return Padding(
      padding: EdgeInsets.only(
        right: horizontalMargin,
        left: horizontalMargin,
        top: marginTop,
        bottom: marginBottom,
      ),
      child: Column(
        children: [
          SelectableText(
            title,
            style:
                TextStyle(fontSize: titleFontSize, fontWeight: FontWeight.w400),
            textAlign: TextAlign.center,
          ),
          if (subtitle.isNotBlank) ...[
            SelectableText(
              subtitle,
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w200,
                color: Colors.black45,
              ),
              textAlign: TextAlign.center,
            ),
          ],
          const SizedBox(height: 25),
          child,
        ],
      ),
    );
  }
}
