import 'package:flutter/material.dart';
import 'package:url_launcher/link.dart';

import '../extensions.dart';

/// A styled rounded container with several customizable attributes.
class Box extends StatelessWidget {
  const Box({
    required this.child,
    this.borderRadius = 15,
    this.shadow = false,
    this.margin = const EdgeInsets.only(),
    this.padding = const EdgeInsets.only(),
    this.backgroundColor = Colors.transparent,
    this.link,
    Key? key,
  }) : super(key: key);

  final Widget child;
  final double borderRadius;
  final bool shadow;
  final EdgeInsets margin;
  final EdgeInsets padding;
  final Color backgroundColor;
  final Uri? link;

  @override
  Widget build(BuildContext context) {
    final Widget box = DecoratedBox(
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(borderRadius),
        boxShadow: shadow
            ? [
                BoxShadow(
                  color: Colors.grey.shade300,
                  spreadRadius: 15,
                  blurRadius: 15,
                  offset: const Offset(0, 5),
                ),
              ]
            : null,
      ),
      child: Padding(
        padding: padding,
        child: child,
      ),
    );

    return Padding(
      padding: margin,
      child: link != null
          ? Link(
              uri: link,
              builder: (context, followLink) => InkWell(
                borderRadius: BorderRadius.circular(borderRadius),
                onTap: followLink,
                child: box,
              ),
            )
          : box,
    ).floatOnHover(enable: link != null);
  }
}
