import 'package:flutter/material.dart';

import '../constant/fontsize.dart';
import 'theme.dart';

TextTheme darkTextTheme() {
  return TextTheme(
    headlineLarge: TextStyle(
      fontSize: CommonFontSize.headlineLarge,
      fontFamily: mainFontFamily,
      backgroundColor: Colors.transparent,
      color : Colors.white,
      decorationColor: onPrimaryColor,
    ),
    headlineMedium: TextStyle(
      fontSize: CommonFontSize.headlineMedium,
      fontFamily: mainFontFamily,
      backgroundColor: Colors.transparent,
      color : Colors.white,
      decorationColor: onPrimaryColor,
    ),
    headlineSmall: TextStyle(
      fontSize: CommonFontSize.headlineSmall,
      fontFamily: mainFontFamily,
      backgroundColor: Colors.transparent,
      color : Colors.white,
      decorationColor: onPrimaryColor,
    ),
    titleLarge: TextStyle(
      fontSize: CommonFontSize.titleLarge,
      fontFamily: mainFontFamily,
      backgroundColor: Colors.transparent,
      color : Colors.white,
      decorationColor: onPrimaryColor,
    ),
    titleMedium: TextStyle(
      fontSize: CommonFontSize.titleMedium,
      fontFamily: mainFontFamily,
      backgroundColor: Colors.transparent,
      color : Colors.white,
      decorationColor: onPrimaryColor,
    ),
    titleSmall: TextStyle(
      fontSize: CommonFontSize.titleSmall,
      fontFamily: mainFontFamily,
      backgroundColor: Colors.transparent,
      color : Colors.white,
      decorationColor: onPrimaryColor,
    ),
    bodyLarge: TextStyle(
      fontSize: CommonFontSize.bodyLarge,
      fontFamily: mainFontFamily,
      backgroundColor: Colors.transparent,
      color : Colors.white,
      decorationColor: onPrimaryColor,
    ),
    bodyMedium: TextStyle(
        fontSize: CommonFontSize.bodyMedium,
        fontFamily: mainFontFamily,
        inherit: true,
        backgroundColor: Colors.transparent,
        color : Colors.white,
        letterSpacing: 1,
        wordSpacing: 1,
        height: 1,
        decorationColor: onPrimaryColor,
        decorationThickness: 1),
    bodySmall: const TextStyle(fontSize: CommonFontSize.bodySmall, fontFamily: mainFontFamily),
  );
}
