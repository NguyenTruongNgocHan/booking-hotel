import 'package:flutter/material.dart';

class AppTheme {
  static const Color primary = Color(0xFFB68D40); // gold nâu
  static const Color dark = Color(0xFF101417);
  static const Color light = Color(0xFFF8F7F4);

  static ThemeData lightTheme = ThemeData(
    useMaterial3: true,
    colorScheme: ColorScheme.fromSeed(seedColor: primary, brightness: Brightness.light),
    scaffoldBackgroundColor: light,
    appBarTheme: const AppBarTheme(
      backgroundColor: light, foregroundColor: dark, elevation: 0, centerTitle: true,
    ),
    inputDecorationTheme: InputDecorationTheme(
      filled: true, fillColor: Colors.white,
      border: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(14))),
      enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(14))),
      contentPadding: EdgeInsets.symmetric(horizontal: 14, vertical: 12),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: primary, foregroundColor: Colors.white,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
        padding: EdgeInsets.symmetric(horizontal: 18, vertical: 14),
      ),
    ),
  );
}
