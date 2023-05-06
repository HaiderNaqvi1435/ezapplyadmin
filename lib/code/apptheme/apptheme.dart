import 'package:flutter/material.dart';

class AppTheme {
  static final lightTheme = ThemeData(
    scaffoldBackgroundColor: Color.fromARGB(255, 244, 243, 240),
    primaryColor: Color.fromARGB(255, 10, 61, 51),
    colorScheme: ColorScheme.light(
        primary: Color.fromARGB(255, 10, 61, 51),
        onPrimary: Color.fromARGB(255, 244, 243, 240),
        secondary: Color.fromARGB(255, 244, 243, 240),
        //old secondary  Color.fromARGB(255, 176, 190, 197),
        onSecondary: Color.fromARGB(255, 10, 61, 51),
        error: const Color.fromARGB(255, 195, 44, 33),
        onError: Colors.red,
        background: const Color.fromARGB(255, 236, 239, 241),
        onBackground: Colors.black,
        surface: const Color.fromARGB(255, 224, 224, 224),
        onSurface: Colors.black),
  );
}
