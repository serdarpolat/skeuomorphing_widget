import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:vector_math/vector_math_64.dart' as Vector;

class TickerPainter extends CustomPainter {
  final Color color;

  TickerPainter({this.color});
  @override
  void paint(Canvas canvas, Size size) {
    //? Global Angle
    var angle = Vector.radians(-90);

    final double r =
        sqrt(size.width * size.height + size.width * size.height) / 2;

    DateTime now = DateTime.now();

    //? init painter
    final paint = Paint();
    paint.color = Colors.white;
    paint.strokeCap = StrokeCap.round;

    //? ekternal lines
    for (var i = 0; i < 60; i++) {
      // Calculate line position
      double ticks = 360 / 60 * i;

      // Set style every 5 minutes
      paint.color = i > 24 || i < 6 ? color : Colors.transparent;
      paint.strokeWidth = 3;
      int distance = 30;

      double x1 = (size.width / 2) +
          (size.width / 3 + distance) * cos(Vector.radians(ticks));
      double y1 = (size.height / 2) +
          (size.width / 3 + distance) * sin(Vector.radians(ticks));

      final p1 = Offset(x1, y1);

      double x2 =
          (size.width / 2) + (size.width / 3 + 45) * cos(Vector.radians(ticks));
      double y2 = (size.height / 2) +
          (size.width / 3 + 45) * sin(Vector.radians(ticks));

      final p2 = Offset(x2, y2);

      canvas.drawLine(p1, p2, paint);
    }
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}
