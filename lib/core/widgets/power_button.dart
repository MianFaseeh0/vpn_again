import 'package:flutter/material.dart';

class PowerButton extends StatelessWidget {
  const PowerButton({
    required this.icon,
    this.foregroundColor,
    this.backgroundColor,
    this.onPressed,
    super.key,
  });

  final IconData icon;
  final VoidCallback? onPressed;
  final Color? foregroundColor;
  final Color? backgroundColor;

  @override
  Widget build(BuildContext context) {
    return IconButton.filled(
      color: foregroundColor,
      style: IconButton.styleFrom(
        iconSize: 13,
        minimumSize: const Size(1, 1),
        backgroundColor: backgroundColor,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      ),
      onPressed: onPressed,
      icon: Icon(icon),
    );
  }
}
