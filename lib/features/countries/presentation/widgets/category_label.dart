import 'package:flutter/material.dart';

class CategoryLabel extends StatelessWidget {
  const CategoryLabel({required this.text, required this.onInfoTap, super.key});

  final VoidCallback onInfoTap;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const SizedBox(width: 35),
        Text(
          text,
          style: Theme.of(context).textTheme.headlineMedium!.copyWith(
            color: const Color.fromARGB(169, 0, 0, 0),
            fontWeight: FontWeight.bold,
          ),
        ),
        const Spacer(),
        IconButton(
          splashColor: Colors.transparent,
          onPressed: onInfoTap,
          icon: const Icon(Icons.info, color: Color(0x6600091F)),
        ),
        const SizedBox(width: 20),
      ],
    );
  }
}
