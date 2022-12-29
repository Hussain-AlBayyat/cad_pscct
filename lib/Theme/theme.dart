import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AppTheme {
  static const Color primaryColor = Color(0xFF00A3E0);
  static const Color primaryColorLight = Color(0xFF6CD5FC);
  static const Color accentColor = Color(0xFF7F82B7);
  static const Color white = Color(0xFFffffff);
  static const Color backGroundColor = Color(0xFFF7F7F7);

  static const Color backgroundDark = Color(0xFFD9CECE);
  static const Color backgroundLight = Color(0xFFFFFFFF);

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
  static ThemeData android = ThemeData(
    scaffoldBackgroundColor: Color(0xFFF7F7F7),
    fontFamily: 'Arial',
    primaryColor: primaryColor,
    primaryColorDark: primaryColor,
    primaryColorLight: primaryColorLight,
    brightness: Brightness.light,
    iconTheme: const IconThemeData(color: primaryColor),
  );
  static CupertinoThemeData ios = const CupertinoThemeData(
    primaryColor: primaryColor,
    scaffoldBackgroundColor: Color(0xFFF7F7F7),
  );
}
