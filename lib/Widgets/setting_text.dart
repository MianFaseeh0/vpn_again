import 'package:flutter/material.dart';

class SettingText extends StatelessWidget {
  const SettingText({required this.text, super.key});

  final String text;
  @override
  Widget build(context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 18),
      child: Text(text, style: Theme.of(context).textTheme.titleSmall),
    );
  }
}
