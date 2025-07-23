import 'package:flutter/material.dart';

class PowerButton extends StatelessWidget {
  const PowerButton({required this.icon, this.onPressed, super.key});

  final IconData icon;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: const Color(0x0F00091F),
      borderRadius: BorderRadius.circular(11),
      child: InkWell(
        onTap: onPressed,
        borderRadius: BorderRadius.circular(11),
        child: SizedBox(
          width: 28,
          height: 28,
          child: Icon(icon, size: 18, color: const Color(0xFF292D32)),
        ),
      ),
    );
  }
}
