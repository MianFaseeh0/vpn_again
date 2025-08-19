import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:riverpod/riverpod.dart';

class CredentialsFormFieldStyle extends StatelessWidget {
  const CredentialsFormFieldStyle({required this.fieldsType, super.key});

  final Widget fieldsType;

  @override
  Widget build(context) {
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
        child: fieldsType,
      ),
    );
  }
}
