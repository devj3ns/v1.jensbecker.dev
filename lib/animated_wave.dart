import 'dart:math';

import 'package:flutter/material.dart';
import 'package:simple_animations/simple_animations.dart';

class AnimatedWave extends StatelessWidget {
  AnimatedWave({
    @required this.height,
    @required this.speed,
    @required this.color,
    this.offset = 0.0,
  });

  final double height;
  final double speed;
  final double offset;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        LayoutBuilder(builder: (context, constraints) {
          return Container(
            height: height,
            width: constraints.biggest.width,
            child: ControlledAnimation(
                playback: Playback.LOOP,
                duration: Duration(milliseconds: (5000 / speed).round()),
                tween: Tween(begin: 0.0, end: 2 * pi),
                builder: (context, double value) {
                  return CustomPaint(
                    foregroundPainter: CurvePainter(value + offset, color),
                  );
                }),
          );
        }),
      ],
    );
  }
}

class CurvePainter extends CustomPainter {
  CurvePainter(this.value, this.color);

  final double value;
  final Color color;

  @override
  void paint(Canvas canvas, Size size) {
    final white = Paint()..color = color;
    final path = Path();

    final y1 = sin(value);
    final y2 = sin(value + pi / 2);
    final y3 = sin(value + pi);

    final startPointY = size.height * (0.5 + 0.4 * y1);
    final controlPointY = size.height * (0.5 + 0.4 * y2);
    final endPointY = size.height * (0.5 + 0.4 * y3);

    path
      ..moveTo(size.width * 0, startPointY)
      ..quadraticBezierTo(
          size.width * 0.5, controlPointY, size.width, endPointY)
      ..lineTo(size.width, size.height)
      ..lineTo(0, size.height)
      ..close();

    canvas.drawPath(path, white);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}
