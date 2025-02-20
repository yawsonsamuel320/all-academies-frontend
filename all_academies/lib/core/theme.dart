import 'package:flutter/material.dart';

final ThemeData themeData = ThemeData(
  primaryColor: const Color.fromARGB(255, 218, 5, 5), // Red primary color
  textButtonTheme: TextButtonThemeData(
    style: TextButton.styleFrom(
      foregroundColor: const Color.fromARGB(255, 218, 5, 5), // Button text color
    ),
  ),
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      backgroundColor: const Color.fromARGB(255, 218, 5, 5), // Button background
    ),
  ),
  colorScheme: ColorScheme.fromSeed(seedColor: const Color.fromARGB(255, 218, 5, 5)),
  useMaterial3: true,
);
