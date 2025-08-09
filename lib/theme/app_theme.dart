import 'package:flutter/material.dart';

final ThemeData appTheme = ThemeData(
  colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
  textTheme: const TextTheme(
    // For date and time
    headlineMedium: TextStyle(
      fontSize: 24,
      fontWeight: FontWeight.bold,
      color: Colors.black, // Default text color for headline
    ),
    // For button text
    labelLarge: TextStyle(
      fontSize: 20,
      color: Colors.white,
    ),
    // For QR Code value text
    bodyLarge: TextStyle(
      fontSize: 18, // Adjust as needed
      color: Colors.black, // Default text color for body
    ),
    // For app bar title
    titleLarge: TextStyle(
      fontSize: 20,
      fontWeight: FontWeight.bold,
      color: Colors.black, // Default text color for app bar title
    ),
  ),
);
