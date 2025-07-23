import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Appbarbuttons extends StatelessWidget {
  const Appbarbuttons({required this.path, required this.color, super.key});

  final String path;
  final Color color;
  @override
  Widget build(context) {
    return Container(
      width: 40,
      height: 40,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: color,
      ),
      child: IconButton(onPressed: () {}, icon: SvgPicture.asset(path)),
    );
  }
}
