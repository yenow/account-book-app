import 'package:account_book/common/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

const mainFontFamily = 'cafe24SsurroundAir_KR';

ThemeData theme() => ThemeData(
      appBarTheme: appTheme(),
      textTheme: textTheme(),
      tabBarTheme: tabBarTheme(),
      bottomNavigationBarTheme: bottomNavigationBarTheme(),
      floatingActionButtonTheme: floatingActionButtonThemeData(),
      elevatedButtonTheme: elevatedButtonThemeData(),
      iconButtonTheme: iconButtonThemeData(),
      fontFamily: mainFontFamily,
      // colorScheme: const ColorScheme(
      //   primary: Colors.deepPurple,
      //   onPrimary: Colors.white,
      //   background: Color(0xFFD7B7FF),
      //   onBackground: Colors.white,
      //   secondary: Color(0xFF402572),
      //   onSecondary: Colors.white,
      //   error: Colors.redAccent,
      //   onError: Colors.white,
      //   surface: Colors.white,
      //   onSurface: Colors.black,
      //   brightness: Brightness.light,
      // ),
      colorScheme: const ColorScheme(
        onPrimary: CommonColors.onWhite,
        onSecondary: CommonColors.onWhite,
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

TabBarTheme tabBarTheme() => TabBarTheme(
    indicator: const BoxDecoration(border: Border(bottom: BorderSide(color: Colors.white, width: 4))),
    labelColor: Colors.white,
    unselectedLabelColor: Colors.grey.shade300);

AppBarTheme appTheme() => AppBarTheme(
    centerTitle: true,
    // color: Colors.white,
    // backgroundColor: Colors.deepPurple,
    toolbarHeight: Get.height / 20,
    backgroundColor: Colors.deepPurple.shade400,
    elevation: 3.0,
    titleTextStyle: const TextStyle(fontSize: 18, fontFamily: mainFontFamily, color: Colors.white));

TextTheme textTheme() {
  return const TextTheme(
    headlineLarge: TextStyle(fontSize: 30, fontFamily: mainFontFamily),
    headlineMedium: TextStyle(fontSize: 26, fontFamily: mainFontFamily),
    headlineSmall: TextStyle(fontSize: 22, fontFamily: mainFontFamily),
    titleLarge: TextStyle(fontSize: 21, fontFamily: mainFontFamily),
    titleMedium: TextStyle(fontSize: 20, fontFamily: mainFontFamily),
    titleSmall: TextStyle(fontSize: 18, fontFamily: mainFontFamily),
    bodyLarge: TextStyle(fontSize: 17, fontFamily: mainFontFamily),
    bodyMedium: TextStyle(fontSize: 15, fontFamily: mainFontFamily),
    bodySmall: TextStyle(fontSize: 10, fontFamily: mainFontFamily),
  );
}

FloatingActionButtonThemeData floatingActionButtonThemeData() => FloatingActionButtonThemeData(
      backgroundColor: Colors.deepPurple.shade400,
      foregroundColor: Colors.white,
    );

BottomNavigationBarThemeData bottomNavigationBarTheme() => const BottomNavigationBarThemeData(
      // selectedLabelStyle: TextStyle(fontSize: 0),
      selectedItemColor: Colors.deepPurple,
      unselectedItemColor: Colors.grey,
      // selectedIconTheme: IconThemeData(size: 20),
      // unselectedLabelStyle: TextStyle(fontSize: 0),
      // unselectedIconTheme: IconThemeData(size: 20),
    );

ElevatedButtonThemeData elevatedButtonThemeData() => ElevatedButtonThemeData(
        style: ButtonStyle(
      minimumSize: MaterialStateProperty.all(Size.infinite),
      backgroundColor: MaterialStateProperty.all(Colors.deepPurple.shade400),
      elevation: MaterialStateProperty.all(4),
      shape: MaterialStateProperty.all(RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      )),
    ));

IconButtonThemeData iconButtonThemeData() => IconButtonThemeData(style: ButtonStyle());
