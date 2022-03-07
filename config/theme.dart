import 'package:flutter/material.dart';

ThemeData theme() {
  return ThemeData(
    primaryColor: Color(0xFFFFD700),
    scaffoldBackgroundColor: Colors.white,
    colorScheme: ColorScheme(
      primary: Color(0xFFFFD700), // Color(0xFFFE3C5B),
      secondary: Color(0xFFFFD700), //Color(0xFFe84545),
      background: Color(0xFFFFFFFF),
      brightness: Brightness.light,
      error: Color(0x00000000),
      onError: Color(0x00000000),
      secondaryVariant: Color(0xFFe84545),
      primaryVariant: Color(0xFFFE3C5B),
      onPrimary: Color(0xFFFFFFFF),
      onBackground: Color(0xFF2b2e4a),
      onSecondary: Color(0xFFFFFFFF),
      onSurface: Color(0xFF2b2e4a),
      surface: Color(0xFFFFFFFF),
    ),
    backgroundColor: Color(0xFFf5b6da),
    fontFamily: 'Avenir',
    textTheme: TextTheme(
      headline1: TextStyle(
        color: Color(0xFFFFFFFF),
        fontWeight: FontWeight.bold,
        fontSize: 36,
      ),
      headline2: TextStyle(
        color: Color(0xFFFFFFFF),
        fontWeight: FontWeight.bold,
        fontSize: 24,
      ),
      headline3: TextStyle(
        color: Color(0xFFFFFFFF),
        fontWeight: FontWeight.bold,
        fontSize: 18,
      ),
      headline4: TextStyle(
        color: Color(0xFFFFFFFF),
        fontWeight: FontWeight.bold,
        fontSize: 16,
      ),
      headline5: TextStyle(
        color: Color(0xFFFFFFFF),
        fontWeight: FontWeight.bold,
        fontSize: 14,
      ),
      headline6: TextStyle(
        color: Color(0xFFFFFFFF),
        fontWeight: FontWeight.normal,
        fontSize: 14,
      ),
      bodyText1: TextStyle(
        color: Color(0xFFFFFFFF),
        fontWeight: FontWeight.normal,
        fontSize: 12,
      ),
      bodyText2: TextStyle(
        color: Color(0xFFFFFFFF),
        fontWeight: FontWeight.normal,
        fontSize: 10,
      ),
    ),
  );
}
