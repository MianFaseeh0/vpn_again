import 'package:flutter/material.dart';

class InitialState extends StatelessWidget {
  const InitialState({super.key});

  Widget build(context) {
    return Column(
      children: [
        const SizedBox(height: 30),
        const Text(
          'Status',
          style: TextStyle(
            fontFamily: 'gilroy',
            fontSize: 12,
            color: Colors.black,
            fontWeight: FontWeight.w600,
          ),
        ),
        const SizedBox(height: 15),
        const Text(
          'Select A Country To Get Staterted',
          style: TextStyle(
            fontFamily: 'gilroy',
            fontSize: 16,
            color: Color(0xFFE63946),
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }
}
