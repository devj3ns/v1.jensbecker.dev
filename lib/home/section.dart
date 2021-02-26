import 'package:flutter/material.dart';

import '../extensions.dart';

class Section extends StatelessWidget {
  Section({
    @required this.title,
    this.subtitle,
    this.applyHorizontalMargin = true,
    this.doubleTopMargin = false,
    @required this.child,
  });
  final String title;
  final String subtitle;
  final bool applyHorizontalMargin;
  final bool doubleTopMargin;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    final horizontalMargin =
        context.isMobile ? 15.0 : context.screenWidth / 6.0;
    var verticalMargin = context.isMobile ? 20.0 : 50.0;
    verticalMargin = doubleTopMargin ? verticalMargin * 2 : verticalMargin;

    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: applyHorizontalMargin ? horizontalMargin : 0.0,
        vertical: verticalMargin,
      ),
      child: Column(
        children: [
          SelectableText(
            title,
            style: const TextStyle(fontSize: 30, fontWeight: FontWeight.w400),
          ),
          if (subtitle.isNotBlank) ...[
            SelectableText(
              subtitle,
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w200,
                color: Colors.black45,
              ),
            ),
          ],
          const SizedBox(height: 25),
          child,
        ],
      ),
    );
  }
}
