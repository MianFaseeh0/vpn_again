import 'package:flutter/material.dart';

class AppTheme {
  const AppTheme._();

  static ThemeData get light => ThemeData(
    textTheme: const TextTheme(
      headlineLarge: TextStyle(fontFamily: 'gilroybold'),
      bodyMedium: TextStyle(
        fontFamily: 'gilroy',
        fontSize: 16,
        fontWeight: FontWeight.w400,
      ),
      labelMedium: TextStyle(
        fontFamily: 'gilroy',
        fontSize: 14,
        fontWeight: FontWeight.w400,
      ),
      labelSmall: TextStyle(
        fontFamily: 'gilroy',
        fontSize: 14,
        fontWeight: FontWeight.w400,
      ),
      headlineMedium: TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: 14,
        fontFamily: 'gilroy',
        color: Colors.black,
      ),
      headlineSmall: TextStyle(
        fontWeight: FontWeight.w500,
        fontSize: 10,
        fontFamily: 'gilroy',
        color: Color(0x6600091F),
      ),
      bodySmall: TextStyle(
        fontWeight: FontWeight.w500,
        fontSize: 12,
        fontFamily: 'gilroy',
        color: Color.fromARGB(255, 0, 0, 0),
      ),
      bodyLarge: TextStyle(
        fontSize: 14,
        color: Color.fromARGB(255, 0, 0, 0),
        fontWeight: FontWeight.w700,
        fontFamily: 'gilroy',
      ),
      labelLarge: TextStyle(
        fontWeight: FontWeight.w700,
        fontSize: 12,
        fontFamily: 'gilroy',
        color: Color.fromARGB(162, 25, 25, 25),
      ),
      titleSmall: TextStyle(
        fontWeight: FontWeight.w600,
        fontSize: 10,
        fontFamily: 'gilroy',
        color: Color.fromARGB(255, 31, 31, 31),
      ),
    ),
  );
}
