import 'package:flutter/material.dart';
import 'dart:ui' as ui;
class LoginPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint0 = Paint()
      ..color = const Color.fromRGBO(92, 143, 38, 1)
      ..style = PaintingStyle.fill
      ..strokeWidth = 1;

    Path path0 = Path();
    path0.moveTo(0, size.height * 0.5157143);
    //path0.cubicTo(size.width * 0.1772917, size.height * 0.5096429, size.width * 0.2979167, size.height * 0.8285714, size.width * 0.4608333, size.height * 0.5857143);
    path0.cubicTo(size.width * 0.1772917, size.height * 0.5096429, size.width * 0.2979167, size.height * 0.7285714, size.width * 0.4608333, size.height * 0.60057143);
    // path0.cubicTo(size.width * 0.6479167, size.height * 0.3385714, size.width * 0.8185417, size.height * 0.1150000, size.width, size.height * 0.1142857);
    path0.cubicTo(size.width * 0.6679167, size.height * 0.3385714, size.width * 0.8185417, size.height * 0.2, size.width, size.height * 0.2042857);
    path0.quadraticBezierTo(size.width * 1.0033333, size.height * 0.3642857, size.width, size.height);
    path0.lineTo(0, size.height);
    path0.quadraticBezierTo(0, size.height * 0.8789286, 0, size.height * 0.5157143);
    path0.close();

    canvas.drawPath(path0, paint0);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}