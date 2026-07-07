import 'package:flutter/material.dart';

class ScreenButton extends StatelessWidget {
  const ScreenButton({
    required this.icon,
    required this.text,
    required this.onPressed,
    required this.color,
    super.key,
  });

  final IconData icon;
  final Color color;
  final String text;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      iconSize: 20,
      onPressed: onPressed,
      icon: Column(
        children: [
          Icon(icon, color: color),
          Text(
            text,
            style: Theme.of(context).textTheme.bodySmall!.copyWith(color: color),
          ),
        ],
      ),
    );
  }
}
