import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class ChangeServerButton extends StatelessWidget {
  const ChangeServerButton({required this.onPressed, super.key});

  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 10, left: 30, right: 30),
      width: 296,
      height: 56,
      decoration: BoxDecoration(
        color: const Color(0xFFE8E9EA),
        borderRadius: BorderRadius.circular(16),
      ),
      child: InkWell(
        borderRadius: BorderRadius.circular(16),
        onTap: onPressed,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            SvgPicture.asset('assets/DISCONNECT/smallGlobe.svg'),
            Text('Change Server', style: Theme.of(context).textTheme.bodyLarge),
            SvgPicture.asset('assets/DISCONNECT/forwardSmall.svg'),
          ],
        ),
      ),
    );
  }
}
