import 'package:flutter/material.dart';

import '../constant/fontsize.dart';
import 'theme.dart';

TextTheme textTheme() {
  return TextTheme(
    headlineLarge: TextStyle(
      fontSize: CommonFontSize.headlineLarge,
      fontFamily: mainFontFamily,
      backgroundColor: Colors.transparent,
      decorationColor: onPrimaryColor,
    ),
    headlineMedium: TextStyle(
      fontSize: CommonFontSize.headlineMedium,
      fontFamily: mainFontFamily,
      backgroundColor: Colors.transparent,
      decorationColor: onPrimaryColor,
    ),
    headlineSmall: TextStyle(
      fontSize: CommonFontSize.headlineSmall,
      fontFamily: mainFontFamily,
      backgroundColor: Colors.transparent,
      decorationColor: onPrimaryColor,
    ),
    titleLarge: TextStyle(
      fontSize: CommonFontSize.titleLarge,
      fontFamily: mainFontFamily,
      backgroundColor: Colors.transparent,
      decorationColor: onPrimaryColor,
    ),
    titleMedium: TextStyle(
      fontSize: CommonFontSize.titleMedium,
      fontFamily: mainFontFamily,
      backgroundColor: Colors.transparent,
      decorationColor: onPrimaryColor,
    ),
    titleSmall: TextStyle(
      fontSize: CommonFontSize.titleSmall,
      fontFamily: mainFontFamily,
      backgroundColor: Colors.transparent,
      decorationColor: onPrimaryColor,
    ),
    bodyLarge: TextStyle(
      fontSize: CommonFontSize.bodyLarge,
      fontFamily: mainFontFamily,
      backgroundColor: Colors.transparent,
      decorationColor: onPrimaryColor,
    ),
    bodyMedium: TextStyle(
        fontSize: CommonFontSize.bodyMedium,
        fontFamily: mainFontFamily,
        inherit: true,
        backgroundColor: Colors.transparent,
        letterSpacing: 1,
        wordSpacing: 1,
        height: 1,
        decorationColor: onPrimaryColor,
        decorationThickness: 1),
    bodySmall: const TextStyle(fontSize: CommonFontSize.bodySmall, fontFamily: mainFontFamily),
  );
}
