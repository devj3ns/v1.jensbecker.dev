import 'package:flutter/material.dart';

import '../extensions.dart';

class Section extends StatelessWidget {
  Section({
    @required this.title,
    this.applyHorizontalPadding = true,
    @required this.child,
  });
  final String title;
  final bool applyHorizontalPadding;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    final horizontalPadding =
        context.isMobile ? 15.0 : context.screenWidth / 6.0;
    final verticalPadding = context.isMobile ? 25.0 : 75.0;

    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: applyHorizontalPadding ? horizontalPadding : 0.0,
        vertical: verticalPadding,
      ),
      child: Column(
        children: [
          SelectableText(
            title,
            style: const TextStyle(fontSize: 30, fontWeight: FontWeight.w400),
          ),
          const SizedBox(height: 25),
          child,
        ],
      ),
    );
  }
}
