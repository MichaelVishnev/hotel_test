import 'package:flutter/material.dart';

import 'constants.dart';

class SizeConfig {
  static late MediaQueryData _mediaQueryData;
  static late double screenWidth;
  static late double screenHeight;
  static late double defaultSize;
  static late Orientation orientation;

  Future<void> init(BuildContext context) async {
    _mediaQueryData = MediaQuery.of(context);
    screenWidth = _mediaQueryData.size.width;
    screenHeight = _mediaQueryData.size.height;
    orientation = _mediaQueryData.orientation;
  }
}

double getProportionateScreenHeight(double inputHeight) {
  final double screenHeight = SizeConfig.screenHeight;
  return (inputHeight / Constants.kHeightLayout) * screenHeight;
}

double getProportionateScreenWidth(double inputWidth) {
  final double screenWidth = SizeConfig.screenWidth;
  return (inputWidth / Constants.kWidthLayout) * screenWidth;
}

extension MediaQueryDataProportionate on MediaQueryData {
  /// 812 is the layout height that designer use
  static const double layoutHeight = 812.0;

  /// 375 is the layout width that designer use
  static const double layoutWidth = 375.0;

  /// Get the proportionate height as per screen size.
  double getProportionateScreenHeight(double inputHeight) => (inputHeight / layoutHeight) * size.height;

  /// Get the proportionate height as per screen size.
  double getProportionateScreenWidth(double inputWidth) => (inputWidth / layoutWidth) * size.width;
}
