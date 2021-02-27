import 'package:flutter/material.dart';

import '../shared/extensions.dart';

class Section extends StatelessWidget {
  Section({
    @required this.title,
    this.subtitle,
    this.applyHorizontalMargin = true,
    this.doubleTopMargin = false,
    this.doubleBottomMargin = false,
    @required this.child,
  });
  final String title;
  final String subtitle;
  final bool applyHorizontalMargin;
  final bool doubleTopMargin;
  final bool doubleBottomMargin;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    final horizontalMargin = applyHorizontalMargin
        ? context.isMobile
            ? 15.0
            : context.screenWidth / 7.5
        : 0.0;
    var marginTop = context.isMobile ? 20.0 : 60.0;
    var marginBottom = marginTop;

    marginTop = doubleTopMargin ? marginTop * 2 : marginTop;
    marginBottom = doubleBottomMargin ? marginBottom * 2 : marginBottom;

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
            style: const TextStyle(fontSize: 30, fontWeight: FontWeight.w400),
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
