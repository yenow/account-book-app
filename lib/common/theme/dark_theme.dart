import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import '../constant/colors.dart';
import '../constant/fontsize.dart';
import '../constant/size.dart';
import 'dart_text_theme.dart';

const mainFontFamily = 'cafe24SsurroundAir_KR';

Color backgroundDarkColor = const Color(0xFF3F3F3F);
Color onBackgroundDarkColor = const Color(0xFFECECEC);
Color primaryDarkColor = const Color(0xFF998CE0);
Color onPrimaryDarkColor = const Color(0xFFFFFFFF);
Color onPrimaryDarkContainer = const Color(0xFF998CE0);
Color outLineDarkColor = const Color(0xFFB0B0B0); // 경계선 색
Color outlineVariantDarkColor = const Color(0xFFF1F1F1); // 포커스
Color canvasDarkColor = const Color(0xFF565656);
Color outLineDarkSecondColor = const Color(0xFFDEDEDE);

ThemeData darkTheme() => ThemeData(
      appBarTheme: appTheme(),
      textTheme: darkTextTheme(),
      tabBarTheme: tabBarTheme(),
      bottomNavigationBarTheme: bottomNavigationBarTheme(),
      floatingActionButtonTheme: floatingActionButtonThemeData(),
      elevatedButtonTheme: elevatedButtonThemeData(),
      iconButtonTheme: iconButtonThemeData(),
      iconTheme: iconThemeData(),
      fontFamily: mainFontFamily,
      colorScheme: ColorScheme(
        primary: primaryDarkColor,
        // 메인 컬러
        onPrimary: onPrimaryDarkColor,
        onPrimaryContainer: onPrimaryDarkContainer,
        // 메인 컬러 내용
        inversePrimary: const Color(0xFFD0F5BE),
        // 메인 컬러 반대
        primaryContainer: const Color(0xFF8C00FF),
        secondary: primaryDarkColor,
        // const Color(0xFFFDA8AA),
        // 두번째 메인 컬러
        onSecondary: const Color(0xFFFFFFFF),
        // 세번째 메인 컬러
        tertiary: canvasDarkColor,
        //  기본선 색깔
        outline: outLineDarkColor,
        //  기본선 강조 색깔
        outlineVariant: outlineVariantDarkColor,

        surface: outLineDarkSecondColor,
        onSurface: onBackgroundDarkColor,
        background: backgroundDarkColor,
        onBackground: onBackgroundDarkColor,
        // TextForm outline 색상
        error: const Color(0xFFD3696C),
        onError: backgroundDarkColor,
        brightness: Brightness.light,
      ),
      dialogTheme: dialogTheme(),
      scaffoldBackgroundColor: backgroundDarkColor,
      primaryColor: const Color(0xFF7D51CB),
      focusColor: const Color(0xFF545454),
      canvasColor: canvasDarkColor,
    );

DialogTheme dialogTheme() => DialogTheme(
      backgroundColor: backgroundDarkColor,
      contentTextStyle: TextStyle(
        fontSize: CommonFontSize.bodyMedium,
        color: onPrimaryDarkColor,
        decoration: TextDecoration.none,
        decorationColor: onPrimaryDarkColor,
        backgroundColor: onPrimaryDarkColor,
        fontFamily: mainFontFamily,
      ),
      titleTextStyle: TextStyle(
        fontSize: CommonFontSize.bodyMedium,
        color: onPrimaryDarkColor,
        decoration: TextDecoration.none,
        decorationColor: onPrimaryDarkColor,
        backgroundColor: onPrimaryDarkColor,
        fontFamily: mainFontFamily,
      ),
      elevation: 0,
      shadowColor: onPrimaryDarkColor,
      surfaceTintColor: onPrimaryDarkColor,
      iconColor: onPrimaryDarkColor,
    );

IconThemeData iconThemeData() => IconThemeData(
      size: 20,
      weight: 0.5,
      color: onBackgroundDarkColor,
    );

TabBarTheme tabBarTheme() => TabBarTheme(
      indicator: BoxDecoration(
        border: Border(
          bottom: BorderSide(color: onBackgroundDarkColor, width: 1),
        ),
      ),
      labelStyle: Get.textTheme.bodyMedium,
      unselectedLabelStyle: Get.textTheme.bodyMedium,
      labelColor: onBackgroundDarkColor,
      unselectedLabelColor: onBackgroundDarkColor,
    );

AppBarTheme appTheme() => AppBarTheme(
      centerTitle: true,
      // toolbarHeight: Get.height / 20,
      toolbarHeight: CommonSize.appbarHeight,
      backgroundColor: primaryDarkColor,
      elevation: 3.0,
      titleTextStyle: const TextStyle(
        fontSize: 18,
        fontFamily: mainFontFamily,
        color: CommonColors.white,
      ),
    );

//
FloatingActionButtonThemeData floatingActionButtonThemeData() => FloatingActionButtonThemeData(
      backgroundColor: primaryDarkColor,
      foregroundColor: onPrimaryDarkColor,
    );

//region 하단 네비게이션 테마
BottomNavigationBarThemeData bottomNavigationBarTheme() => BottomNavigationBarThemeData(
      selectedLabelStyle: const TextStyle(fontSize: CommonFontSize.bodySmall),
      unselectedLabelStyle: const TextStyle(fontSize: CommonFontSize.bodySmall),
      selectedItemColor: primaryDarkColor,
      unselectedItemColor: outlineVariantDarkColor,
      backgroundColor: backgroundDarkColor,
      selectedIconTheme: const IconThemeData(size: 20),
      unselectedIconTheme: const IconThemeData(size: 20),
      elevation: 5.0,
      showSelectedLabels: true,
      showUnselectedLabels: true,
    );
//endregion

//region 버튼 테마
ElevatedButtonThemeData elevatedButtonThemeData() {
  return ElevatedButtonThemeData(style: elevatedButtonStyle());
}

ButtonStyle elevatedButtonStyle() {
  return ButtonStyle(
    maximumSize: MaterialStateProperty.all(const Size.fromHeight(100)),
    minimumSize: MaterialStateProperty.all(const Size.fromHeight(40)),
    backgroundColor: MaterialStateProperty.all(primaryDarkColor),
    elevation: MaterialStateProperty.all(3.0),
    padding: MaterialStateProperty.all(EdgeInsets.zero),
    shape: MaterialStateProperty.all(RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(10.0),
    )),
  );
}
//endregion

//region 아이콘 버튼 테마
IconButtonThemeData iconButtonThemeData() => IconButtonThemeData(
      style: iconButtonStyle(),
    );

ButtonStyle iconButtonStyle() => ButtonStyle(
      iconSize: MaterialStateProperty.all(15),
      maximumSize: MaterialStateProperty.all(const Size(200, 100)),
      minimumSize: MaterialStateProperty.all(const Size(50, 25)),
      backgroundColor: MaterialStateProperty.all(CommonColors.onPrimaryColor),
      elevation: MaterialStateProperty.all(4),
      padding: MaterialStateProperty.all(EdgeInsets.zero),
      shape: MaterialStateProperty.all(
        RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
      ),
    );
//endregion
