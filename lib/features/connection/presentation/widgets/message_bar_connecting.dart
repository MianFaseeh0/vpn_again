import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:animated_text_kit/animated_text_kit.dart';

class MessageBarConnecting extends StatelessWidget {
  const MessageBarConnecting({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        SvgPicture.asset('assets/DISCONNECT/message.svg'),
        AnimatedTextKit(
          animatedTexts: List.generate(
            4,
            (_) => FadeAnimatedText(
              'initializing\nConnection',
              textStyle: const TextStyle(
                fontFamily: 'gilroy',
                fontSize: 10,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
