import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'extensions.dart';

class Button extends StatelessWidget {
  const Button({
    @required this.text,
    @required this.onPressed,
    this.iconData,
    this.margin = const EdgeInsets.all(6.0),
  });
  final String text;
  final IconData iconData;
  final VoidCallback onPressed;
  final EdgeInsets margin;

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
              Text(
                text,
                style: const TextStyle(color: Colors.white, fontSize: 17),
              ),
              if (iconData != null) ...[
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
    @required this.child,
    @required this.onPressed,
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
                      color: Colors.grey[200],
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
    @required this.child,
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
                    color: Colors.grey[200],
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
    @required this.child,
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
            color: Colors.grey[300],
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
  TranslateOnHover({Key key, this.child}) : super(key: key);

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

class AnimateTranslate extends StatefulWidget {
  const AnimateTranslate({
    @required this.child,
  });

  final Widget child;

  @override
  _AnimateTranslateState createState() => _AnimateTranslateState();
}

class _AnimateTranslateState extends State<AnimateTranslate>
    with SingleTickerProviderStateMixin {
  AnimationController controller;
  Animation<double> animation;

  @override
  void initState() {
    super.initState();
    controller = AnimationController(
      duration: const Duration(milliseconds: 750),
      vsync: this,
    )..addListener(() => setState(() {}));

    final Animation<double> curve =
        CurvedAnimation(parent: controller, curve: Curves.easeInOutSine);
    animation = Tween(begin: -2.0, end: 2.0).animate(curve);
    controller.repeat(reverse: true);
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
    @required this.child,
  });

  final Widget child;

  @override
  _AnimateScaleState createState() => _AnimateScaleState();
}

class _AnimateScaleState extends State<AnimateScale>
    with SingleTickerProviderStateMixin {
  AnimationController controller;
  Animation<double> animation;

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
  const TextChip({@required this.text});
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

class WinkingHandEmoji extends StatelessWidget {
  const WinkingHandEmoji({this.size = 22});
  final double size;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: size,
      height: size,
      child: SvgPicture.network(
        'assets/emoji_u1f44b.svg',
        semanticsLabel: 'Winking hand emoji',
      ),
    );
  }
}
