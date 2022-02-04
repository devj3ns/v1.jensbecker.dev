import 'package:beamer/beamer.dart';
import 'package:fleasy/fleasy.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/link.dart';
import 'package:url_launcher/url_launcher.dart';

import 'constants.dart';

/// A rounded container with several customizable attributes.
class RoundedBox extends StatelessWidget {
  const RoundedBox({
    required this.child,
    this.borderRadius = 15,
    this.shadow = false,
    this.margin = const EdgeInsets.only(),
    this.padding = const EdgeInsets.only(),
    this.color = Colors.white,
    this.link,
    Key? key,
  }) : super(key: key);

  final Widget child;
  final double borderRadius;
  final bool shadow;
  final EdgeInsets margin;
  final EdgeInsets padding;
  final Color color;
  final Uri? link;

  @override
  Widget build(BuildContext context) {
    final Widget box = DecoratedBox(
      decoration: BoxDecoration(
        color: color,
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
          ? kUseLinkWidget
              ? Link(
                  uri: link,
                  builder: (context, followLink) => InkWell(
                    borderRadius: BorderRadius.circular(borderRadius),
                    onTap: followLink,
                    child: box,
                  ),
                )
              : InkWell(
                  borderRadius: BorderRadius.circular(borderRadius),
                  onTap: () => link!.hasAbsolutePath
                      ? launch(link.toString())
                      : context.beamToNamed(link.toString()),
                  child: box,
                )
          : box,
    ).floatOnHover(enable: link != null);
  }
}

/// Makes its child translate up when the mouse hovers over it.
class TranslateOnHover extends StatefulWidget {
  const TranslateOnHover({
    Key? key,
    required this.child,
  }) : super(key: key);

  final Widget child;

  @override
  _TranslateOnHoverState createState() => _TranslateOnHoverState();
}

class _TranslateOnHoverState extends State<TranslateOnHover> {
  final nonHoverTransform = Matrix4.identity();
  final hoverTransform = Matrix4.identity()..translate(0.0, -8.0, 0.0);

  bool _hovering = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (e) => _mouseEnter(true),
      onExit: (e) => _mouseEnter(false),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        transform: _hovering ? hoverTransform : nonHoverTransform,
        child: widget.child,
      ),
    );
  }

  void _mouseEnter(bool hover) {
    setState(() {
      _hovering = hover;
    });
  }
}

extension WidgetExtensions on Widget {
  /// Makes the widget float when the mouse hovers over it.
  Widget floatOnHover({bool enable = true}) =>
      enable ? TranslateOnHover(child: this) : this;
}

/// Animates its child y position up and down.
class AnimateVerticalTranslate extends StatefulWidget {
  const AnimateVerticalTranslate({
    required this.child,
    required this.duration,
    this.tweenBegin = -2.0,
    this.tweenEnd = 2.0,
    this.repeat = true,
    Key? key,
  }) : super(key: key);

  final Widget child;
  final Duration duration;
  final double tweenBegin;
  final double tweenEnd;
  final bool repeat;

  @override
  _AnimateVerticalTranslateState createState() =>
      _AnimateVerticalTranslateState();
}

class _AnimateVerticalTranslateState extends State<AnimateVerticalTranslate>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;
  late Animation<double> animation;

  @override
  void initState() {
    super.initState();
    controller = AnimationController(
      duration: widget.duration,
      vsync: this,
    );

    final Animation<double> curve =
        CurvedAnimation(parent: controller, curve: Curves.easeInOut);
    animation =
        Tween(begin: widget.tweenBegin, end: widget.tweenEnd).animate(curve);

    if (widget.repeat) controller.repeat(reverse: true);
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: controller,
      builder: (context, _) {
        return Transform.translate(
          offset: Offset(0, animation.value),
          child: widget.child,
        );
      },
    );
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }
}

/// Animates its child scale up and down.
class AnimateScale extends StatefulWidget {
  const AnimateScale({
    required this.child,
    Key? key,
  }) : super(key: key);

  final Widget child;

  @override
  _AnimateScaleState createState() => _AnimateScaleState();
}

class _AnimateScaleState extends State<AnimateScale>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;
  late Animation<double> animation;

  @override
  void initState() {
    super.initState();
    controller = AnimationController(
      duration: const Duration(milliseconds: 1500),
      vsync: this,
    );

    final Animation<double> curve =
        CurvedAnimation(parent: controller, curve: Curves.easeInOutSine);
    animation = Tween(begin: 1.0, end: 1.02).animate(curve);
    controller.repeat(reverse: true);
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: controller,
      builder: (context, _) {
        return Transform.scale(
          scale: animation.value,
          child: widget.child,
        );
      },
    );
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }
}

/// A more performant alternative to [Chip] when we just need a the label property
class TextChip extends StatelessWidget {
  const TextChip({required this.text, Key? key}) : super(key: key);
  final String text;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 6, horizontal: 12),
      decoration: BoxDecoration(
        color: Colors.grey.shade300,
        borderRadius: const BorderRadius.all(Radius.circular(25)),
      ),
      child: SelectableText(
        text,
        style: const TextStyle(fontWeight: FontWeight.bold),
      ),
    );
  }
}

/// Specifies the structure of a section.
class Section extends StatelessWidget {
  const Section({
    required this.title,
    required this.child,
    this.horizontalMarginMultiplier = 1,
    this.topMarginMultiplier = 1,
    this.bottomMarginMultiplier = 1,
    this.subtitle,
    Key? key,
  }) : super(key: key);

  final String title;
  final Widget child;
  final double horizontalMarginMultiplier;
  final double topMarginMultiplier;
  final double bottomMarginMultiplier;
  final String? subtitle;

  @override
  Widget build(BuildContext context) {
    final horizontalMargin = context.byFormFactor<double>(
            onHandset: 15, onTablet: 50, onDesktop: context.screenWidth / 8) *
        horizontalMarginMultiplier;
    final marginTop = context.byFormFactor<double>(
            onHandset: 20, onTablet: 40, onDesktop: 60) *
        topMarginMultiplier;
    final marginBottom = marginTop * bottomMarginMultiplier;
    final titleFontSize = context.byFormFactor<double>(
        onHandset: 25, onTablet: 28, onDesktop: 30);

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
              subtitle!,
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

// ############### Buttons: ###################

/// A text button which allows icons to be placed next to the label.
///
/// For a more customizable button use [MyButton].
class MyTextButton extends StatelessWidget {
  const MyTextButton({
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
      textStyle: TextStyle(
        color: Theme.of(context).primaryColor,
        fontWeight: FontWeight.bold,
      ),
      color: Colors.transparent,
    );
  }
}

/// A elevated button which allows icons to be placed next to the label.
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

/// A customizable button.
///
/// For more predefined buttons use [TextButton] and [ElevatedButton].
///
/// If a link with an absolute path (starting with '/') is given it opens it
/// in a new window.
/// Else it navigates to the page with the given link.
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
      context: context,
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
                      size: 17,
                    ),
                    const SizedBox(width: 10.0),
                  ],
                  Text(
                    label,
                    style: textStyle,
                  ),
                  if (iconAfter != null) ...[
                    const SizedBox(width: 10.0),
                    FaIcon(
                      iconAfter,
                      color: Colors.white,
                      size: 17,
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

/// A simple icon button.
///
/// For a more customizable button use [MyButton].
class MyIconButton extends StatelessWidget {
  const MyIconButton({
    required this.icon,
    this.color,
    this.size,
    this.link,
    Key? key,
  }) : super(key: key);

  final IconData icon;
  final Color? color;
  final double? size;
  final Uri? link;

  @override
  Widget build(BuildContext context) {
    return _handleLinkOrOnPressed(
      link: link,
      onPressed: null,
      context: context,
      child: (VoidCallback? onTap) => IconButton(
        onPressed: onTap,
        icon: Icon(
          icon,
          size: size,
          color: Colors.white,
        ),
      ).floatOnHover(),
    );
  }
}

//ignore:avoid-returning-widgets
/// If link != null:
/// - it wraps the given child with a link widget (if kUseLinkWidget == true)
/// - it launches the link in a new tab (if the link is absolute)
/// - it navigates to the page internally (if the link is relative)
///
/// If onPressed != null:
/// - it calls it when the child is pressed
Widget _handleLinkOrOnPressed({
  Uri? link,
  VoidCallback? onPressed,
  required BuildContext context,
  required Widget Function(void Function()?) child,
}) {
  return link != null
      ? kUseLinkWidget
          ? Link(
              uri: link,
              builder: (_, followLink) => child(followLink),
            )
          : child(
              link.hasAbsolutePath
                  ? () => launch(link.toString())
                  : () => context.beamToNamed(link.toString()),
            )
      : child(onPressed);
}
