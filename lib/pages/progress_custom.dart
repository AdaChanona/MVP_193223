import 'package:flutter/material.dart';
import 'dart:math';

class ProgressCustom extends CustomPainter {
  int porcentaje;
  ProgressCustom(this.porcentaje);
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint();
    paint.strokeWidth=6;
    paint.style=PaintingStyle.stroke;
    final c= Offset(size.width*0.48,size.height*0.48 );
    final radius= size.height/2;
    canvas.drawCircle(c, radius, paint);

    final paint_2 = Paint();
    paint_2.strokeWidth=6;
    paint_2.style=PaintingStyle.stroke;
    paint_2.color=Colors.greenAccent;
    final rect =Rect.fromCircle(center: c, radius: radius);

    canvas.drawArc(rect, -pi/2, (pi* 2*porcentaje)/ 100, false, paint_2);

  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
