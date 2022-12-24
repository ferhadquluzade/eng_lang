import 'dart:ui';

import "package:flutter/material.dart";

class Painter extends CustomPainter {
  late final offsets;
  Painter({this.offsets}) : super();
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.deepPurple
      ..isAntiAlias = true
      ..strokeWidth = 5;
    for (var i = 0; i < offsets.length - 1; i++) {
      // if (offsets[i] == Offset.zero) continue;
      if (offsets[i] != Offset.zero && offsets[i + 1] != Offset.zero) {
        canvas.drawLine(offsets[i], offsets[i + 1], paint);
      } 
      else if (offsets[i] != null && offsets[i + 1] == Offset.zero) {
        canvas.drawPoints(PointMode.points, [offsets[i]], paint);
      }
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}
