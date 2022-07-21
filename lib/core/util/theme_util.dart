import 'package:flutter/material.dart';
import './color_constants.dart';

class ThemeUtil {
  static final ThemeData themeData = ThemeData.light().copyWith(
    primaryColor: kPrimaryColour,
    primaryColorDark: kPrimaryDarkColour,
    visualDensity: VisualDensity.adaptivePlatformDensity,
    colorScheme: ColorScheme.fromSwatch().copyWith(secondary: kAccentColor),
  );
}
