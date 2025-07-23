import 'package:flutter/material.dart';

class Credentials extends StatelessWidget {
  const Credentials({
    required this.hintext,
    required this.obsecuretext,
    required this.controller,
    super.key,
  });

  final TextEditingController controller;
  final bool obsecuretext;
  final String hintext;

  @override
  Widget build(context) {
    return Container(
      width: 296,
      height: 56,
      decoration: BoxDecoration(
        border: BoxBorder.all(color: Color(0x3300091F), width: 1),
        shape: BoxShape.rectangle,
        borderRadius: BorderRadius.circular(16),
      ),
      alignment: Alignment.center,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8),
        child: TextField(
          controller: controller,
          obscureText: obsecuretext,
          decoration: InputDecoration(
            border: InputBorder.none,
            focusedBorder: InputBorder.none,
            enabledBorder: InputBorder.none,
            hintText: hintext,
            hintStyle: Theme.of(context).textTheme.labelSmall,
          ),
        ),
      ),
    );
  }
}
