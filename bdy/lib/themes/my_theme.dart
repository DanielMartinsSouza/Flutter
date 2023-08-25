import 'package:bdy/themes/theme_colors.dart';
import 'package:flutter/material.dart';

ThemeData myTheme = ThemeData(
  cardColor: ThemeColors.cardColor,
  primarySwatch: ThemeColors.primaryColor,
  primaryColor: ThemeColors.mainColor,
  //brightness: Brightness.dark,
  fontFamily: 'Raleway',
  textTheme: const TextTheme(
    bodyMedium: TextStyle(
      fontSize: 16,
      color: Colors.white,
    ),
    bodyLarge: TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.bold,
        color: ThemeColors.mainColor),
    titleMedium: TextStyle(
      color: Colors.white,
      fontSize: 20,
      fontWeight: FontWeight.normal,
    ),
  ),
);
