import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:animated_text_kit/animated_text_kit.dart';

class MessBar extends StatelessWidget {
  const MessBar({super.key});
  Widget build(context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        SvgPicture.asset('assets/DISCONNECT/message.svg'),
        AnimatedTextKit(
          animatedTexts: [
            FadeAnimatedText(
              'initializing\nConnection',
              textStyle: TextStyle(
                fontFamily: 'gilroy',
                fontSize: 10,
                fontWeight: FontWeight.bold,
              ),
            ),
            FadeAnimatedText(
              'initializing\nConnection',
              textStyle: TextStyle(
                fontFamily: 'gilroy',
                fontSize: 10,
                fontWeight: FontWeight.bold,
              ),
            ),
            FadeAnimatedText(
              'initializing\nConnection',
              textStyle: TextStyle(
                fontFamily: 'gilroy',
                fontSize: 10,
                fontWeight: FontWeight.bold,
              ),
            ),
            FadeAnimatedText(
              'initializing\nConnection',
              textStyle: TextStyle(
                fontFamily: 'gilroy',
                fontSize: 10,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
