import 'package:fleasy/fleasy.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/link.dart';

import '../extensions.dart';

/// A text button which allows icons to be placed next to the text.
///
/// For a more customizable button use [MyButton].
class MyTextButton extends StatelessWidget {
  const MyTextButton({
    this.iconAfter,
    required this.text,
    this.textStyle,
    this.iconBefore,
    this.link,
    Key? key,
  }) : super(key: key);

  final String text;
  final TextStyle? textStyle;
  final IconData? iconBefore;
  final IconData? iconAfter;
  final Uri? link;

  @override
  Widget build(BuildContext context) {
    return MyButton(
      iconAfter: iconAfter,
      label: text,
      iconBefore: iconBefore,
      link: link,
      textStyle: textStyle ??
          const TextStyle(
            color: Colors.white,
            fontSize: 17,
          ),
      color: Colors.transparent,
    );
  }
}

/// An elevated button which allows icons to be placed next to the text.
///
/// For a more customizable button use [MyButton].
class MyElevatedButton extends StatelessWidget {
  const MyElevatedButton({
    this.iconAfter,
    required this.label,
    this.iconBefore,
    this.link,
    Key? key,
  }) : super(key: key);

  final String label;
  final IconData? iconBefore;
  final IconData? iconAfter;
  final Uri? link;

  @override
  Widget build(BuildContext context) {
    return MyButton(
      iconAfter: iconAfter,
      label: label,
      iconBefore: iconBefore,
      link: link,
      textStyle: const TextStyle(
        color: Colors.white,
        fontSize: 17,
      ),
      color: Theme.of(context).primaryColor,
    );
  }
}

/// An icon button.
class MyIconButton extends StatelessWidget {
  const MyIconButton({
    required this.icon,
    this.iconColor = Colors.white,
    this.iconSize = 35,
    this.padding = const EdgeInsets.all(0.0),
    this.margin = const EdgeInsets.all(8.0),
    this.floatOnHover = true,
    this.link,
    this.onPressed,
    Key? key,
  })  : assert(link != null || onPressed != null),
        super(key: key);

  final IconData icon;
  final Color iconColor;
  final double iconSize;
  final EdgeInsets padding;
  final EdgeInsets margin;
  final bool floatOnHover;

  final Uri? link;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: margin,
      child: _handleLinkOrOnPressed(
        link: link,
        onPressed: onPressed,
        child: (VoidCallback? onTap) => IconButton(
          icon: icon.fontPackage == 'font_awesome_flutter'
              ? FaIcon(
                  icon,
                  color: iconColor,
                  size: iconSize,
                )
              : Icon(
                  icon,
                  color: iconColor,
                  size: iconSize,
                ),
          padding: padding,
          iconSize: iconSize,
          onPressed: onTap,
        ).floatOnHover(enable: floatOnHover),
      ),
    );
  }
}

/// A customizable button.
///
/// For more predefined buttons use [TextButton] and [ElevatedButton].
class MyButton extends StatelessWidget {
  const MyButton({
    this.iconAfter,
    required this.label,
    this.iconBefore,
    this.onPressed,
    this.link,
    this.margin = const EdgeInsets.all(6.0),
    required this.textStyle,
    required this.color,
    Key? key,
  })  : assert(link != null || onPressed != null),
        super(key: key);

  final String label;
  final EdgeInsets margin;
  final IconData? iconBefore;
  final IconData? iconAfter;
  final TextStyle textStyle;
  final Color color;

  final VoidCallback? onPressed;
  final Uri? link;

  @override
  Widget build(BuildContext context) {
    return _handleLinkOrOnPressed(
      link: link,
      onPressed: onPressed,
      child: (VoidCallback? onTap) => Padding(
        padding: margin,
        child: Material(
          color: color,
          borderRadius: const BorderRadius.all(Radius.circular(10.0)),
          child: InkWell(
            onTap: onTap,
            borderRadius: const BorderRadius.all(Radius.circular(10.0)),
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  if (iconBefore != null) ...[
                    FaIcon(
                      iconBefore,
                      color: Colors.white,
                      size: textStyle.fontSize,
                    ),
                    const Gap.w8(),
                  ],
                  Text(
                    label,
                    style: textStyle,
                  ),
                  if (iconAfter != null) ...[
                    const Gap.w8(),
                    FaIcon(
                      iconAfter,
                      color: Colors.white,
                      size: textStyle.fontSize,
                    ),
                  ],
                ],
              ),
            ),
          ),
        ).floatOnHover(),
      ),
    );
  }
}

//ignore:avoid-returning-widgets
/// If link != null it wraps the given child with a link widget
///
/// If onPressed != null it calls it when the child is pressed
Widget _handleLinkOrOnPressed({
  Uri? link,
  VoidCallback? onPressed,
  required Widget Function(void Function()?) child,
}) {
  return link != null
      ? Link(
          uri: link,
          builder: (_, followLink) => child(followLink),
        )
      : child(onPressed);
}
