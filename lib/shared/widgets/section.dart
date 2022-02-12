import 'package:fleasy/fleasy.dart';
import 'package:flutter/material.dart';

import '../extensions.dart';

/// A structured section.
class Section extends StatelessWidget {
  const Section({
    required this.title,
    required this.child,
    this.subtitle,
    this.additionalMargin = const EdgeInsets.only(),
    Key? key,
  }) : super(key: key);

  final String title;
  final Widget child;
  final String? subtitle;
  final EdgeInsets additionalMargin;

  @override
  Widget build(BuildContext context) {
    final titleFontSize =
        context.byFormFactor<double>(onMobile: 25, onTablet: 28, onDesktop: 30);

    final margin = context.byFormFactor<EdgeInsets>(
      onMobile:
          context.contentMargin + const EdgeInsets.symmetric(vertical: 25),
      onTablet:
          context.contentMargin + const EdgeInsets.symmetric(vertical: 25),
      onDesktop: context.contentMargin.copyWith(top: 60, bottom: 60),
    );

    return Padding(
      padding: margin + additionalMargin,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          SelectableText(
            title,
            style:
                TextStyle(fontSize: titleFontSize, fontWeight: FontWeight.w400),
            textAlign: TextAlign.center,
          ),
          if (subtitle.isNotBlank) ...[
            SelectableText(
              subtitle!,
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w200,
                color: Colors.black45,
              ),
              textAlign: TextAlign.center,
            ),
          ],
          const Gap.h16(),
          child,
        ],
      ),
    );
  }
}
