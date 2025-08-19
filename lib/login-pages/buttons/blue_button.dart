import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class BlueButton extends StatelessWidget {
  const BlueButton({
    this.path,
    required this.text,
    required this.gotofunction,
    required this.color,
    required this.textcolor,
    super.key,
  });

  final String text;
  final Color textcolor;
  final void Function() gotofunction;
  final Color color;
  final String? path;

  @override
  Widget build(context) {
    return SizedBox(
      width: 296,
      height: 56,
      child: TextButton(
        style: TextButton.styleFrom(
          splashFactory: NoSplash.splashFactory,
          overlayColor: Colors.transparent,

          elevation: 0,
          backgroundColor: color,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
        ),
        onPressed: gotofunction,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          spacing: 7,
          children: [
            if (path != null) ...[SvgPicture.asset(path!)],
            Text(
              text,
              style: Theme.of(
                context,
              ).textTheme.labelMedium!.copyWith(color: textcolor),
            ),
          ],
        ),
      ),
    );
  }
}
