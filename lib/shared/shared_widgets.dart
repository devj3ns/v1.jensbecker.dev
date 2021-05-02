import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter_extensions/flutter_extensions.dart';

import 'extensions.dart';

enum AlignIcon { beforeText, afterText }

class Button extends StatelessWidget {
  const Button({
    required this.text,
    required this.onPressed,
    this.alignIcon = AlignIcon.afterText,
    this.margin = const EdgeInsets.all(6.0),
    this.iconData,
  });

  final String text;
  final VoidCallback onPressed;
  final AlignIcon alignIcon;
  final EdgeInsets margin;
  final IconData? iconData;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: margin,
      child: InkWell(
        onTap: onPressed,
        child: Container(
          padding: const EdgeInsets.all(12.0),
          decoration: BoxDecoration(
            color: Theme.of(context).primaryColor,
            borderRadius: BorderRadius.circular(10.0),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              if (iconData != null && alignIcon == AlignIcon.beforeText) ...[
                FaIcon(
                  iconData,
                  color: Colors.white,
                  size: 17,
                ),
                const SizedBox(width: 10.0),
              ],
              Text(
                text,
                style: const TextStyle(color: Colors.white, fontSize: 17),
              ),
              if (iconData != null && alignIcon == AlignIcon.afterText) ...[
                const SizedBox(width: 10.0),
                FaIcon(
                  iconData,
                  color: Colors.white,
                  size: 17,
                )
              ]
            ],
          ),
        ).floatOnHover(),
      ),
    );
  }
}

class RoundedClickBox extends StatelessWidget {
  const RoundedClickBox({
    required this.child,
    required this.onPressed,
    this.borderRadius = 15,
    this.withShadow = false,
    this.margin = const EdgeInsets.only(),
    this.padding = const EdgeInsets.only(),
  });
  final Widget child;
  final VoidCallback onPressed;
  final double borderRadius;
  final bool withShadow;
  final EdgeInsets margin;
  final EdgeInsets padding;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: margin,
      child: InkWell(
        borderRadius: BorderRadius.circular(borderRadius),
        onTap: onPressed,
        child: DecoratedBox(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(borderRadius),
            boxShadow: withShadow
                ? [
                    BoxShadow(
                      color: Colors.grey[200]!,
                      spreadRadius: 15,
                      blurRadius: 15,
                      offset: const Offset(0, 5),
                    ),
                  ]
                : [],
          ),
          child: Padding(
            padding: padding,
            child: child,
          ),
        ),
      ).floatOnHover(),
    );
  }
}

class RoundedBox extends StatelessWidget {
  const RoundedBox({
    required this.child,
    this.borderRadius = 15,
    this.withShadow = false,
    this.margin = const EdgeInsets.only(),
    this.padding = const EdgeInsets.only(),
  });

  final Widget child;
  final double borderRadius;
  final bool withShadow;
  final EdgeInsets margin;
  final EdgeInsets padding;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: margin,
      child: DecoratedBox(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(borderRadius),
          boxShadow: withShadow
              ? [
                  BoxShadow(
                    color: Colors.grey[200]!,
                    spreadRadius: 15,
                    blurRadius: 15,
                    offset: const Offset(0, 5),
                  ),
                ]
              : [],
        ),
        child: Padding(
          padding: padding,
          child: child,
        ),
      ),
    );
  }
}

class ShadowBox extends StatelessWidget {
  const ShadowBox({
    required this.child,
    this.borderRadius = 15,
  });
  final Widget child;
  final double borderRadius;

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(borderRadius),
        boxShadow: [
          BoxShadow(
            color: Colors.grey[300]!,
            spreadRadius: 15,
            blurRadius: 15,
            offset: const Offset(0, 5),
          ),
        ],
      ),
      child: child,
    );
  }
}

class TranslateOnHover extends StatefulWidget {
  TranslateOnHover({
    Key? key,
    required this.child,
  }) : super(key: key);

  final Widget child;

  @override
  _TranslateOnHoverState createState() => _TranslateOnHoverState();
}

class _TranslateOnHoverState extends State<TranslateOnHover> {
  final nonHoverTransform = Matrix4.identity()..translate(0, 0, 0);
  final hoverTransform = Matrix4.identity()..translate(0, -8, 0);

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

class AnimateVerticalTranslate extends StatefulWidget {
  const AnimateVerticalTranslate({
    required this.child,
    required this.duration,
    this.tweenBegin = -2.0,
    this.tweenEnd = 2.0,
    this.repeat = true,
  });

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
    )..addListener(() => setState(() {}));

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

class AnimateScale extends StatefulWidget {
  const AnimateScale({
    required this.child,
  });

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
    )..addListener(() => setState(() {}));

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

/// A more performant alternative to Chip() when just the label property is used
class TextChip extends StatelessWidget {
  const TextChip({required this.text});
  final String text;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 6, horizontal: 12),
      decoration: BoxDecoration(
        color: Colors.grey[300],
        borderRadius: BorderRadius.circular(25),
      ),
      child: SelectableText(
        text,
        style: const TextStyle(fontWeight: FontWeight.bold),
      ),
    );
  }
}

class Section extends StatelessWidget {
  const Section({
    required this.title,
    required this.child,
    this.horizontalMarginMultiplier = 1,
    this.topMarginMultiplier = 1,
    this.bottomMarginMultiplier = 1,
    this.subtitle,
  });

  final String title;
  final Widget child;
  final double horizontalMarginMultiplier;
  final double topMarginMultiplier;
  final double bottomMarginMultiplier;
  final String? subtitle;

  @override
  Widget build(BuildContext context) {
    final horizontalMargin = context.responsive<double>(
            onMobile: 15, onTablet: 50, onDesktop: context.screenWidth / 8) *
        horizontalMarginMultiplier;
    final marginTop =
        context.responsive<double>(onMobile: 20, onTablet: 40, onDesktop: 60) *
            topMarginMultiplier;
    final marginBottom = marginTop * bottomMarginMultiplier;
    final titleFontSize =
        context.responsive<double>(onMobile: 25, onTablet: 28, onDesktop: 30);

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
