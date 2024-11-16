import 'package:flutter/material.dart';

ThemeData lightTheme = ThemeData(
  brightness: Brightness.light,
  primaryColor: Colors.blue[500],
  colorScheme: ColorScheme.light(
    primary: Colors.blue[900]!,
    onPrimary: Colors.white,
    secondary: Colors.blue[200]!,
    onSecondary: Colors.white,
    surface: Colors.blue[100]!,
    onSurface: Colors.black,
    error: Colors.red,
    onError: Colors.white,
  ),
  appBarTheme: AppBarTheme(
    backgroundColor: Colors.blue[100],
    titleTextStyle: TextStyle(color: Colors.black, fontSize: 20),
    iconTheme: IconThemeData(color: Colors.black),
  ),
  textTheme: const TextTheme(
      bodyLarge: TextStyle(color: Colors.black),
      bodyMedium: TextStyle(color: Colors.black),
      bodySmall: TextStyle(color: Colors.black),
      titleLarge: TextStyle(
        color: Colors.black,
        fontWeight: FontWeight.bold,
      )),
);
