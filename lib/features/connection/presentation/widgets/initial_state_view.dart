import 'package:flutter/material.dart';

class InitialStateView extends StatelessWidget {
  const InitialStateView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        SizedBox(height: 30),
        Text(
          'Status',
          style: TextStyle(
            fontFamily: 'gilroy',
            fontSize: 12,
            color: Colors.black,
            fontWeight: FontWeight.w600,
          ),
        ),
        SizedBox(height: 15),
        Text(
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
