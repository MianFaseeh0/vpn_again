import 'package:flutter/material.dart';

class CredentialsTextFieldFrame extends StatelessWidget {
  const CredentialsTextFieldFrame({required this.child, super.key});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 296,
      height: 76,
      decoration: BoxDecoration(
        border: Border.all(
          width: 1,
          color: const Color.fromARGB(255, 78, 77, 77),
        ),
        shape: BoxShape.rectangle,
        borderRadius: BorderRadius.circular(16),
      ),
      alignment: Alignment.center,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
        child: child,
      ),
    );
  }
}
