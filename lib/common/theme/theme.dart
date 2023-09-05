import 'package:account_book/common/constant/colors.dart';
import 'package:account_book/common/constant/fontsize.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../constant/size.dart';
import 'text_theme.dart';

const mainFontFamily = 'cafe24SsurroundAir_KR';

Color backgroundColor = const Color(0xFFFFFFFF);
Color onBackgroundColor = const Color(0xFF6B6B6B);
Color primaryColor = const Color(0xFFB2A4FF);
Color onPrimaryColor = const Color(0xFFFFFFFF);
Color onPrimaryContainer = const Color(0xFFE5DFFF);
Color outLineColor = const Color(0xFFA1A1A1); // 경계선 색
Color outlineVariantColor = const Color(0xFF545454); // 포커스
Color canvasColor = const Color(0xFFF8F8F8);
Color outLineColor2 = const Color(0xFFDEDEDE);

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
      colorScheme: ColorScheme(
        primary: primaryColor,
        // 메인 컬러
        onPrimary: onPrimaryColor,
        onPrimaryContainer: onPrimaryContainer,
        // 메인 컬러 내용
        inversePrimary: const Color(0xFFD0F5BE),
        // 메인 컬러 반대
        primaryContainer: const Color(0xFF8C00FF),
        secondary: primaryColor, // const Color(0xFFFDA8AA),
        // 두번째 메인 컬러
        onSecondary: const Color(0xFFFFFFFF),
        // 세번째 메인 컬러
        tertiary: canvasColor,
        //  기본선 색깔
        outline: outLineColor,
        //  기본선 강조 색깔
        outlineVariant: outlineVariantColor,

        surface: outLineColor2,
        onSurface: onBackgroundColor,
        background: backgroundColor,
        onBackground: onBackgroundColor,
        // TextForm outline 색상
        error: const Color(0xFFD3696C),
        onError: backgroundColor,
        brightness: Brightness.light,
      ),
      dialogTheme: dialogTheme(),
      scaffoldBackgroundColor: backgroundColor,
      primaryColor: const Color(0xFF7D51CB),
      focusColor: const Color(0xFF545454),
      canvasColor: canvasColor,
    );

DialogTheme dialogTheme() => DialogTheme(
      backgroundColor: backgroundColor,
      contentTextStyle: TextStyle(
        fontSize: CommonFontSize.bodyMedium,
        color: onPrimaryColor,
        decoration: TextDecoration.none,
        decorationColor: onPrimaryColor,
        backgroundColor: onPrimaryColor,
        fontFamily: mainFontFamily,
      ),
      titleTextStyle: TextStyle(
        fontSize: CommonFontSize.bodyMedium,
        color: onPrimaryColor,
        decoration: TextDecoration.none,
        decorationColor: onPrimaryColor,
        backgroundColor: onPrimaryColor,
        fontFamily: mainFontFamily,
      ),
      elevation: 0,
      shadowColor: onPrimaryColor,
      surfaceTintColor: onPrimaryColor,
      iconColor: onPrimaryColor,
    );

IconThemeData iconThemeData() => IconThemeData(
      size: 20,
      weight: 0.5,
      color: onBackgroundColor,
    );

TabBarTheme tabBarTheme() => TabBarTheme(
      indicator: BoxDecoration(
        border: Border(
          bottom: BorderSide(color: onBackgroundColor, width: 1),
        ),
      ),
      labelStyle: Get.textTheme.bodyMedium,
      unselectedLabelStyle: Get.textTheme.bodyMedium,
      labelColor: onBackgroundColor,
      unselectedLabelColor: onBackgroundColor,
    );

AppBarTheme appTheme() => AppBarTheme(
      centerTitle: true,
      // toolbarHeight: Get.height / 20,
      toolbarHeight: CommonSize.appbarHeight,
      backgroundColor: primaryColor,
      elevation: 3.0,
      titleTextStyle: const TextStyle(fontSize: 18, fontFamily: mainFontFamily, color: CommonColors.white),
    );

//
FloatingActionButtonThemeData floatingActionButtonThemeData() => FloatingActionButtonThemeData(
      backgroundColor: primaryColor,
      foregroundColor: onPrimaryColor,
    );

//region 하단 네비게이션 테마
BottomNavigationBarThemeData bottomNavigationBarTheme() => BottomNavigationBarThemeData(
  
      selectedLabelStyle: const TextStyle(fontSize: CommonFontSize.bodySmall),
      unselectedLabelStyle: const TextStyle(fontSize: CommonFontSize.bodySmall),
      selectedItemColor: primaryColor,
      unselectedItemColor: outlineVariantColor,
      backgroundColor: backgroundColor,
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
    backgroundColor: MaterialStateProperty.all(primaryColor),
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
