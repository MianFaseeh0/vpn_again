import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class AppBarIconButton extends StatelessWidget {
  const AppBarIconButton({
    required this.assetPath,
    required this.backgroundColor,
    this.onPressed,
    super.key,
  });

  final String assetPath;
  final Color backgroundColor;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 40,
      height: 40,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: backgroundColor,
      ),
      child: IconButton(
        onPressed: onPressed ?? () {},
        icon: SvgPicture.asset(assetPath),
      ),
    );
  }
}
