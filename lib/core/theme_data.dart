import 'package:flutter/material.dart';

import 'app_settings.dart';

final themeData = ThemeData(
  accentColor: Colors.lime,
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ButtonStyle(
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
