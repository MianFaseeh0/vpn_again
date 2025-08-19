import 'package:flutter/material.dart';

class PowerButton extends StatelessWidget {
  const PowerButton({
    required this.icon,
    this.foregrColor,
    this.backgrColor,
    this.onPressed,
    super.key,
  });

  final IconData icon;
  final VoidCallback? onPressed;
  final Color? foregrColor;
  final Color? backgrColor;

  @override
  Widget build(BuildContext context) {
    return IconButton.filled(
      color: foregrColor,
      style: IconButton.styleFrom(
        iconSize: 13,
        minimumSize: Size(1, 1),
        backgroundColor: backgrColor,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      ),
      onPressed: onPressed,
      icon: Icon(icon),
    );
    //
    //
    // Container(
    //   color: const Color(0x0F00091F),
    //   borderRadius: BorderRadius.circular(11),
    //   child: InkWell(
    //     onTap: onPressed,
    //     borderRadius: BorderRadius.circular(11),
    //     child: SizedBox(
    //       width: 28,
    //       height: 28,
    //       child: Icon(icon, size: 18, color: const Color(0xFF292D32)),
    //     ),
    //   ),
    // );
  }
}
