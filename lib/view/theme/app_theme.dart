import 'package:flutter/material.dart';
import 'package:yelp_nyc_business/view/theme/app_colors.dart';

ThemeData lightTheme = ThemeData(
    fontFamily: 'Poppins',
    primaryColor: primaryColor,
    hintColor: hintColor,
    highlightColor: highlightColor,
    colorScheme: const ColorScheme.light(
      primary: primaryColor,
      secondary: secondaryColor,
    ),
    textTheme: const TextTheme(
        titleLarge: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 20,
        ),
        titleMedium: TextStyle(
          fontWeight: FontWeight.bold,
        ),
        bodyMedium: TextStyle(fontSize: 14, fontWeight: FontWeight.normal),
        bodySmall: TextStyle(fontSize: 11, color: Colors.black)),
    textButtonTheme: TextButtonThemeData(
      style: ButtonStyle(
        backgroundColor: WidgetStateProperty.all<Color>(
          primaryColor,
        ),
        foregroundColor: WidgetStateProperty.all<Color>(
          highlightColor,
        ),
      ),
    ),
    floatingActionButtonTheme: const FloatingActionButtonThemeData(
      foregroundColor: highlightColor,
    ));
