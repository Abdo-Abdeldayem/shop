import 'package:flutter/material.dart';

ThemeData darkTheme = ThemeData(
  brightness: Brightness.dark,
  primaryColor: Colors.blue[500],
  colorScheme: ColorScheme.dark(
    primary: Colors.blue[900]!,
    onPrimary: Colors.black,
    secondary: Colors.blue[200]!,
    onSecondary: Colors.black,
    surface: Colors.grey[850]!,
    onSurface: Colors.white,
    error: Colors.red,
    onError: Colors.black,
  ),
  appBarTheme: AppBarTheme(
    backgroundColor: Colors.grey[850]!,
    titleTextStyle: const TextStyle(color: Colors.white, fontSize: 20),
    actionsIconTheme: const IconThemeData(color: Colors.white70),
    iconTheme: IconThemeData(color: Colors.white),
  ),
  textTheme: const TextTheme(
    bodyLarge: TextStyle(color: Colors.white),
    bodyMedium: TextStyle(color: Colors.white),
    bodySmall: TextStyle(color: Colors.white),
  ),
);
