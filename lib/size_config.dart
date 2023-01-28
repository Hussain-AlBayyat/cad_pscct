import 'package:flutter/material.dart';

class SizeConfig {
  static late MediaQueryData _mediaQueryData;
  static late double screenWidth;
  static late double screenHeight;
  static late double blockSizeHorizontal;
  static late double blockSizeVertical;

  static double? defaultSize;
  static Orientation? orientation;
  static isLandscape() => SizeConfig.orientation == Orientation.landscape;
  void init(BuildContext context) {
    _mediaQueryData = MediaQuery.of(context);
    screenWidth = _mediaQueryData.size.width;
    screenHeight = _mediaQueryData.size.height;
    blockSizeHorizontal = screenWidth / 100;
    blockSizeVertical = screenHeight / 100;
    orientation = _mediaQueryData.orientation;
  }
}

// Get the proportionate height as per screen size
double getProportionateScreenHeight(double inputHeight) {
  double screenHeight = SizeConfig.screenHeight;
  //return SizeConfig.blockSizeVertical * inputHeight;
  // 812 is the layout height that designer use
  return (inputHeight /
          (SizeConfig.orientation == Orientation.portrait ? 844 : 768)) *
      screenHeight;
}

// Get the proportionate height as per screen size
double getProportionateScreenWidth(double inputWidth) {
  double screenWidth = SizeConfig.screenWidth;
  // 375 is the layout width that designer use
  //return SizeConfig.blockSizeHorizontal * screenWidth;
  return (inputWidth /
          (SizeConfig.orientation == Orientation.portrait ? 390 : 1024)) *
      screenWidth;
}
