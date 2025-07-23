import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:lucide_icons/lucide_icons.dart';

class ScreenButton extends StatelessWidget {
  const ScreenButton({
    required this.icon,
    required this.text,
    required this.onPressed,
    required this.status1,
    super.key,
  });

  final IconData icon;
  final bool status1;

  final String text;
  final void Function() onPressed;

  @override
  Widget build(context) {
    final status = status1;
    return IconButton(
      isSelected: status,
      iconSize: 20,
      onPressed: () {
        onPressed;
      },
      icon: Column(
        children: [
          Icon(
            icon,
            color:
                status == true
                    ? const Color.fromARGB(255, 0, 36, 136)
                    : Colors.black,
          ),
          Text(text, style: Theme.of(context).textTheme.bodySmall),
        ],
      ),
    );
  }
}
