import 'package:account_book/common/constant/colors.dart';
import 'package:account_book/common/constant/fontsize.dart';
import 'package:flutter/material.dart';

import '../constant/size.dart';

const mainFontFamily = 'cafe24SsurroundAir_KR';

ThemeData theme() => ThemeData(
      appBarTheme: appTheme(),
      textTheme: textTheme(),
      tabBarTheme: tabBarTheme(),
      bottomNavigationBarTheme: bottomNavigationBarTheme(),
      floatingActionButtonTheme: floatingActionButtonThemeData(),
      elevatedButtonTheme: elevatedButtonThemeData(),
      iconButtonTheme: iconButtonThemeData(),
      iconTheme: iconThemeData(),
      fontFamily: mainFontFamily,
      colorScheme: const ColorScheme(
        onPrimary: CommonColors.white,
        onSecondary: CommonColors.white,
        primary: LightColors.orange1,
        primaryContainer: LightColors.orange2,
        secondary: LightColors.blue,
        background: LightColors.gray1,
        surface: LightColors.gray2,
        outline: LightColors.gray3,
        surfaceVariant: LightColors.gray4,
        onSurface: LightColors.gray5,
        onSurfaceVariant: LightColors.gray6,
        onBackground: LightColors.important,
        error: CommonColors.red1,
        tertiary: CommonColors.purple3,
        tertiaryContainer: CommonColors.purple3,
        onError: LightColors.basic,
        brightness: Brightness.light,
      ),
      scaffoldBackgroundColor: Colors.white,
      primaryColor: Colors.deepPurple.shade100,
    );

IconThemeData iconThemeData() => const IconThemeData(
      size: 20,
      weight: 1,
      color: CommonColors.black,
    );

TabBarTheme tabBarTheme() => TabBarTheme(
    indicator: const BoxDecoration(border: Border(bottom: BorderSide(color: CommonColors.white, width: 4))),
    labelColor: CommonColors.white,
    unselectedLabelColor: Colors.grey.shade300);

AppBarTheme appTheme() => AppBarTheme(
    centerTitle: true,
    // color: CommonColors.white,
    // backgroundColor: Colors.deepPurple,
    // toolbarHeight: Get.height / 20,
    toolbarHeight: CommonSize.appbarHeight,
    backgroundColor: Colors.deepPurple.shade400,
    elevation: 3.0,
    titleTextStyle: const TextStyle(fontSize: 18, fontFamily: mainFontFamily, color: CommonColors.white));

TextTheme textTheme() {
  return const TextTheme(
    headlineLarge: TextStyle(fontSize: CommonFontSize.headlineLarge, fontFamily: mainFontFamily),
    headlineMedium: TextStyle(fontSize: CommonFontSize.headlineMedium, fontFamily: mainFontFamily),
    headlineSmall: TextStyle(fontSize: CommonFontSize.headlineSmall, fontFamily: mainFontFamily),
    titleLarge: TextStyle(fontSize: CommonFontSize.titleLarge, fontFamily: mainFontFamily),
    titleMedium: TextStyle(fontSize: CommonFontSize.titleMedium, fontFamily: mainFontFamily),
    titleSmall: TextStyle(fontSize: CommonFontSize.titleSmall, fontFamily: mainFontFamily),
    bodyLarge: TextStyle(fontSize: CommonFontSize.bodyLarge, fontFamily: mainFontFamily),
    bodyMedium: TextStyle(fontSize: CommonFontSize.bodyMedium, fontFamily: mainFontFamily),
    bodySmall: TextStyle(fontSize: CommonFontSize.bodySmall, fontFamily: mainFontFamily),
  );
}

FloatingActionButtonThemeData floatingActionButtonThemeData() => FloatingActionButtonThemeData(
      backgroundColor: Colors.deepPurple.shade400,
      foregroundColor: CommonColors.white,
    );

BottomNavigationBarThemeData bottomNavigationBarTheme() => const BottomNavigationBarThemeData(
      selectedLabelStyle: TextStyle(fontSize: CommonFontSize.bodySmall),
      unselectedLabelStyle: TextStyle(fontSize: CommonFontSize.bodySmall),
      selectedItemColor: Colors.deepPurple,
      unselectedItemColor: Colors.grey,
      selectedIconTheme: IconThemeData(size: 20),
      unselectedIconTheme: IconThemeData(size: 20),
      elevation: 5,
      showSelectedLabels: true,
      showUnselectedLabels: true,
    );

ElevatedButtonThemeData elevatedButtonThemeData() {
  return ElevatedButtonThemeData(
      style: ButtonStyle(
    minimumSize: MaterialStateProperty.all(Size.infinite),
    backgroundColor: MaterialStateProperty.all(Colors.deepPurple.shade400),
    elevation: MaterialStateProperty.all(4),
    shape: MaterialStateProperty.all(RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(10.0),
    )),
  ));
}

IconButtonThemeData iconButtonThemeData() => const IconButtonThemeData(style: ButtonStyle());
