import 'package:flutter/material.dart';

class Catlab extends StatelessWidget {
  const Catlab({required this.text, required this.showdialog, super.key});

  final void Function() showdialog;
  final String text;
  @override
  Widget build(context) {
    return Row(
      children: [
        const SizedBox(width: 35),
        Text(
          text,
          style: Theme.of(context).textTheme.headlineMedium!.copyWith(
            color: Color.fromARGB(169, 0, 0, 0),
            fontWeight: FontWeight.bold,
          ),
        ),
        const Spacer(),
        IconButton(
          splashColor: Colors.transparent,
          onPressed: showdialog,
          icon: Icon(Icons.info, color: Color(0x6600091F)),
        ),
        const SizedBox(width: 20),
      ],
    );
  }
}
