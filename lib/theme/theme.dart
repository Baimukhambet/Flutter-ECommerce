import 'package:flutter/material.dart';

final theme = ThemeData(
  textTheme: const TextTheme(
      titleLarge: TextStyle(
        fontSize: 24,
      ),
      //H7
      titleMedium: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
      titleSmall: TextStyle(
          fontSize: 14, fontWeight: FontWeight.w600, color: Colors.white),

      //H4
      headlineLarge: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),

      //H5
      headlineMedium: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),

      // H6
      headlineSmall: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),

      //Regular
      bodySmall: TextStyle(
          fontSize: 12, fontWeight: FontWeight.w400, color: Color(0xA0A0A0FF))),
);
