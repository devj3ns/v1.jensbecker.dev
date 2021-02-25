import 'package:flutter/material.dart';

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
}
