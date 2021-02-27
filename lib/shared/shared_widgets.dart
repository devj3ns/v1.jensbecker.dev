import 'package:flutter/material.dart';
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
            color: Colors.blueAccent,
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

class RoundedBox extends StatelessWidget {
  const RoundedBox({
    @required this.child,
    this.borderRadius = 15,
    this.withShadow = false,
    this.onPressed,
    this.margin = const EdgeInsets.all(0.0),
  });
  final Widget child;
  final double borderRadius;
  final bool withShadow;
  final VoidCallback onPressed;
  final EdgeInsets margin;

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
                      color: Colors.grey.withOpacity(0.15),
                      spreadRadius: 15,
                      blurRadius: 15,
                      offset: const Offset(0, 5),
                    ),
                  ]
                : [],
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(borderRadius),
            child: child,
          ),
        ),
      ).floatOnHover(enable: onPressed != null),
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
        child: widget.child,
        transform: _hovering ? hoverTransform : nonHoverTransform,
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
