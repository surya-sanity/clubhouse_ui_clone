import 'package:flutter/material.dart';

class SizeConfig {
  static MediaQueryData _mediaQueryData;
  static double screenWidth;
  static double screenHeight;
  static double longside;
  static double shortside;
  static bool portrait = false;
  static bool landscape = false;
  static double sidePadding;

  void init(BuildContext context) {
    _mediaQueryData = MediaQuery.of(context);
    screenWidth = _mediaQueryData.size.width;
    screenHeight = _mediaQueryData.size.height;
    longside = MediaQuery.of(context).size.longestSide;
    shortside = MediaQuery.of(context).size.shortestSide;
    MediaQuery.of(context).orientation == Orientation.portrait
        ? portrait = true
        : portrait = false;
    MediaQuery.of(context).orientation == Orientation.landscape
        ? landscape = true
        : landscape = false;
    sidePadding = MediaQuery.of(context).size.longestSide / 60;
  }
}
