import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class BlueButton extends StatelessWidget {
  const BlueButton({
    required this.text,
    required this.onPressed,
    required this.backgroundColor,
    required this.textColor,
    this.iconAssetPath,
    super.key,
  });

  final String text;
  final Color textColor;
  final VoidCallback onPressed;
  final Color backgroundColor;
  final String? iconAssetPath;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 296,
      height: 56,
      child: TextButton(
        style: TextButton.styleFrom(
          splashFactory: NoSplash.splashFactory,
          overlayColor: Colors.transparent,
          elevation: 0,
          backgroundColor: backgroundColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
        ),
        onPressed: onPressed,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          spacing: 7,
          children: [
            if (iconAssetPath != null) SvgPicture.asset(iconAssetPath!),
            Text(
              text,
              style: Theme.of(
                context,
              ).textTheme.labelMedium!.copyWith(color: textColor),
            ),
          ],
        ),
      ),
    );
  }
}
