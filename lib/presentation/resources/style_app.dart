import 'font_app.dart';
import 'package:flutter/material.dart';

TextStyle? _getTextStyle(double fontSize, FontWeight fontWeight, Color color,
    {double? height}) {
  return TextStyle(
      fontSize: fontSize,
      fontFamily: FontConstantEnglish.fontFamily,
      color: color,
      fontWeight: fontWeight,
      height: height,
      decoration: TextDecoration.none);
}

// regular style
TextStyle? getRegularStyle(
    {double fontSize = FontSizeApp.s12, required Color color, double? height}) {
  return _getTextStyle(fontSize, FontWeightApp.regular, color, height: height);
}

// Medium style
TextStyle? getMediumStyle(
    {double fontSize = FontSizeApp.s12, required Color color, double? height}) {
  return _getTextStyle(fontSize, FontWeightApp.medium, color, height: height);
}

// light style
TextStyle? getLightStyle(
    {double fontSize = FontSizeApp.s12, required Color color, double? height}) {
  return _getTextStyle(fontSize, FontWeightApp.light, color, height: height);
}

// semi bold style
TextStyle? getSemiBoldStyle(
    {double fontSize = FontSizeApp.s12, required Color color, double? height}) {
  return _getTextStyle(fontSize, FontWeightApp.semiBold, color, height: height);
}

TextStyle? getUnderBoldStyle(
    {double fontSize = FontSizeApp.s12, required Color color, double? height}) {
  return _getTextStyle(fontSize, FontWeightApp.underBold, color,
      height: height);
}

// bold style
TextStyle? getBoldStyle(

    {double fontSize = FontSizeApp.s12, required Color color, double? height}) {
  return _getTextStyle(fontSize, FontWeightApp.morebold, color, height: height);
}

//morbold
// TextStyle? getMoreBoldStyle({
//   double fontSize = FontSizeApp.s12,
//   required Color color,
// }) {
//   return _getTextStyle(fontSize, FontWeightApp.moreBold, color);
// }
