import 'package:flutter/material.dart';

import 'app_settings.dart';

final themeData = ThemeData(
  appBarTheme: const AppBarTheme(
    elevation: 0,
  ),
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ButtonStyle(
      backgroundColor: MaterialStateProperty.resolveWith<Color?>(
        (states) => Colors.blue.shade400,
      ),
      shape: MaterialStateProperty.resolveWith<OutlinedBorder?>(
        (states) => RoundedRectangleBorder(
          borderRadius: borderRadius,
        ),
      ),
    ),
  ),
  inputDecorationTheme: InputDecorationTheme(
    border: OutlineInputBorder(
      borderRadius: borderRadius,
    ),
  ),
);
