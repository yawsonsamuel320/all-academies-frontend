import 'package:flutter/material.dart';

// Light theme
final ThemeData lightTheme = ThemeData(
  useMaterial3: true,
  colorScheme: ColorScheme.fromSeed(
    seedColor: Colors.blue,
    brightness: Brightness.light,
  ),
  textTheme: const TextTheme(
    displayLarge: TextStyle(
      fontSize: 16,
      fontWeight: FontWeight.bold,
      color: Colors.black, // Appropriate text color for light theme
    ),
    titleLarge: TextStyle(
      fontSize: 14,
      fontWeight: FontWeight.bold,
      color: Colors.blueAccent, // Title text color for light theme
    ),
    bodyLarge: TextStyle(
      fontSize: 16,
      color: Colors.black87, // Body text color for light theme
    ),
    bodyMedium: TextStyle(
      fontSize: 14,
      color: Colors.black54, // Medium text color for light theme
    ),
  ),
);

// Dark theme
final ThemeData darkTheme = ThemeData(
  useMaterial3: true,
  colorScheme: ColorScheme.fromSeed(
    seedColor: Colors.blue,
    brightness: Brightness.dark,
  ),
  textTheme: const TextTheme(
    displayLarge: TextStyle(
      fontSize: 16,
      fontWeight: FontWeight.bold,
      color:
          Color.fromARGB(255, 231, 231, 231), // Text color for dark theme
    ),
    titleLarge: TextStyle(
      fontSize: 14,
      fontWeight: FontWeight.bold,
      color: Colors.blueAccent, // Title text color for dark theme
    ),
    bodyLarge: TextStyle(
      fontSize: 16,
      color: Colors.white70, // Body text color for dark theme
    ),
    bodyMedium: TextStyle(
      fontSize: 14,
      color: Colors.white60, // Medium text color for dark theme
    ),
  ),
);
