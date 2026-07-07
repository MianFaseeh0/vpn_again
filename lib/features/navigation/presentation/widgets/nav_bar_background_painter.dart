import 'package:flutter/material.dart';

class NavBarBackgroundPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = const Color.fromARGB(255, 255, 255, 255)
      ..style = PaintingStyle.fill;

    final path = Path();
    double flatTopHeight = 50 - 15;

    path.moveTo(0, size.height);
    path.lineTo(0, flatTopHeight);
    path.quadraticBezierTo(0, flatTopHeight - 5, 15, flatTopHeight - 8.5);
    path.lineTo(size.width - size.width, flatTopHeight - 5);
    path.quadraticBezierTo(
      size.width / 2,
      flatTopHeight - 10 - 40,
      (size.width + size.width) / 2,
      flatTopHeight - 5,
    );
    path.lineTo(size.width - 15, flatTopHeight - 8.5);
    path.quadraticBezierTo(
      size.width,
      flatTopHeight - 5,
      size.width,
      flatTopHeight,
    );
    path.lineTo(size.width, size.height);
    path.close();

    canvas.drawShadow(path, const Color.fromARGB(255, 0, 0, 0), 30, true);
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}

class NavBarBackground extends StatelessWidget {
  const NavBarBackground({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return CustomPaint(
      size: Size(size.width, 75),
      painter: NavBarBackgroundPainter(),
    );
  }
}
