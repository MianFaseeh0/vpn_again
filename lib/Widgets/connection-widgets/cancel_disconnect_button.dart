import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CancelDisconnectButton extends StatelessWidget {
  const CancelDisconnectButton({required this.disconnect, super.key});
  final void Function() disconnect;

  @override
  Widget build(context) {
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
        onTap: disconnect,
        child: Center(
          child: Text(
            'Cancel Connection',
            style: Theme.of(context).textTheme.bodyLarge,
          ),
        ),
      ),
    );
  }
}
