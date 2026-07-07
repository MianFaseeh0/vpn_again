import 'package:flutter/material.dart';

class CancelDisconnectButton extends StatelessWidget {
  const CancelDisconnectButton({required this.label, required this.onPressed, super.key});

  final String label;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Container(
      margin: EdgeInsets.only(
        bottom: screenHeight * 0.012,
        left: screenWidth * 0.08,
        right: screenWidth * 0.08,
      ),
      width: screenWidth * 0.80,
      height: screenHeight * 0.07,
      decoration: BoxDecoration(
        color: const Color(0xFFE8E9EA),
        borderRadius: BorderRadius.circular(screenWidth * 0.04),
      ),
      child: InkWell(
        borderRadius: BorderRadius.circular(screenWidth * 0.04),
        onTap: onPressed,
        child: Center(
          child: Text(label, style: Theme.of(context).textTheme.bodyLarge),
        ),
      ),
    );
  }
}
