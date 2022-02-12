import 'package:flutter/material.dart';

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
