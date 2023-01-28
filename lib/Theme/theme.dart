import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AppTheme {
  static const Color primaryColor = Color(0xFF00A3E0);
  static const Color primaryColorLight = Color(0xFF6CD5FC);

  static const Color accentColor = Color(0xFF7F82B7);

  static const Color backgroundDark = Color(0xFF1A1A1B);
  static const Color backgroundLight = Color(0xFFFFFFFF);
  static const Color disabledColor = Color(0xFF8D8D8D);

  static const backgroundGradient = LinearGradient(
    colors: [backgroundDark, backgroundLight],
    stops: [0.0, 1.0],
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
  );
  static const backgroundGradientReversed = LinearGradient(
    colors: [backgroundLight, backgroundDark],
    stops: [0.0, 1.0],
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
  );
  static const backgroundGradientH = LinearGradient(
    colors: [backgroundLight, backgroundDark],
    stops: [0.0, 1.0],
    begin: FractionalOffset(0.0, 0.0),
    end: FractionalOffset(1.0, 0.0),
  );

  static const menuItemGradient = LinearGradient(
    colors: [
      primaryColorLight,
      primaryColor,
    ],
    stops: [0.0, 1.0],
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
  );

  static const totalSpendGradient = LinearGradient(
    colors: [
      Color(0xFFF2F3FA),
      Color(0xFFB4B9D9),
    ],
    stops: [0.0, 1.0],
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
  );
  static ThemeData light = ThemeData(
    scaffoldBackgroundColor: backgroundLight,
    backgroundColor: backgroundLight,
    fontFamily: 'Arial',
    primaryColor: primaryColor,
    disabledColor: disabledColor,
    highlightColor: Colors.black,
    cardColor: Colors.white,
    primaryColorDark: primaryColor,
    primaryColorLight: primaryColorLight,
    textTheme:
        TextTheme(labelSmall: TextStyle(color: Colors.black, fontSize: 16)),
    brightness: Brightness.light,
    iconTheme: const IconThemeData(color: primaryColor),
  );
  static ThemeData dark = ThemeData(
    scaffoldBackgroundColor: backgroundDark,
    backgroundColor: backgroundDark.withOpacity(0.8),
    fontFamily: 'Arial',
    primaryColor: primaryColor,
    buttonTheme: ButtonThemeData(),
    highlightColor: Colors.white,
    /*textButtonTheme: TextButtonThemeData(
        style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all<Color>(Colors.white),
            foregroundColor: MaterialStateProperty.all<Color>(Colors.black),
            textStyle: MaterialStateProperty.all<TextStyle>(
                TextStyle(color: Colors.black)))),*/
    disabledColor: disabledColor,
    cardColor: Color(0xFF2F2F31),
    textTheme:
        TextTheme(labelSmall: TextStyle(color: Colors.white, fontSize: 16)),
    primaryColorDark: primaryColor,
    primaryColorLight: primaryColorLight,
    brightness: Brightness.dark,
    iconTheme: const IconThemeData(color: primaryColor),
  );
}
