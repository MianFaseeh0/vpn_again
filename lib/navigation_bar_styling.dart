import 'package:flutter/material.dart';

class BNBCustomPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint =
        Paint()
          ..color = const Color.fromARGB(255, 255, 255, 255)
          ..style = PaintingStyle.fill;

    final path = Path();
    final double flatTopHeight = 50 - 15; // Calculate flat portion height

    // Start at bottom-left
    path.moveTo(0, size.height);

    // Go up to flat top portion (reduced height)
    path.lineTo(0, flatTopHeight);

    // Left curve to bump start
    path.quadraticBezierTo(0, flatTopHeight - 5, 15, flatTopHeight - 8.5);
    path.lineTo((size.width - size.width), flatTopHeight - 5);

    // Center bump (unchanged curve shape)
    path.quadraticBezierTo(
      size.width / 2,
      flatTopHeight - 10 - 40,
      (size.width + size.width) / 2,
      flatTopHeight - 5,
    );

    // Right curve from bump to edge
    path.lineTo(size.width - 15, flatTopHeight - 8.5);
    path.quadraticBezierTo(
      size.width,
      flatTopHeight - 5,
      size.width,
      flatTopHeight,
    );

    // Down to bottom-right
    path.lineTo(size.width, size.height);

    path.close();

    canvas.drawShadow(path, const Color.fromARGB(255, 0, 0, 0), 30, true);

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}

class customPainter extends StatelessWidget {
  const customPainter({super.key});

  @override
  Widget build(context) {
    final size = MediaQuery.of(context).size;

    return CustomPaint(size: Size(size.width, 75), painter: BNBCustomPainter());
  }
}
