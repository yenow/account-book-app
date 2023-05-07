import 'package:flutter/material.dart';

ThemeData theme() => ThemeData(
      appBarTheme: appTheme(),
      textTheme: textTheme(),
      tabBarTheme: tabBarTheme(),
      bottomNavigationBarTheme: bottomNavigationBarTheme(),
      floatingActionButtonTheme: floatingActionButtonThemeData(),
      elevatedButtonTheme: elevatedButtonThemeData(),
      iconButtonTheme: iconButtonThemeData(),
      scaffoldBackgroundColor: Colors.white,
      fontFamily: 'cafe24SsurroundAir_KR',
      colorScheme: const ColorScheme(
        primary: Colors.deepPurple,
        onPrimary: Colors.white,
        background: Color(0xFFD7B7FF),
        onBackground: Colors.white,
        secondary: Color(0xFF402572),
        onSecondary: Colors.white,
        error: Colors.redAccent,
        onError: Colors.white,
        surface: Colors.white,
        onSurface: Colors.black,
        brightness: Brightness.light,
      ),
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
    toolbarHeight: 45,
    backgroundColor: Colors.deepPurple.shade400,
    elevation: 3.0,
    titleTextStyle: const TextStyle(fontSize: 24, fontFamily: 'cafe24SsurroundAir_KR', color: Colors.white));

TextTheme textTheme() {
  return const TextTheme(
    headlineLarge: TextStyle(fontSize: 30, fontFamily: 'cafe24SsurroundAir_KR'),
    headlineMedium: TextStyle(fontSize: 26, fontFamily: 'cafe24SsurroundAir_KR'),
    headlineSmall: TextStyle(fontSize: 22, fontFamily: 'cafe24SsurroundAir_KR'),
    titleLarge: TextStyle(fontSize: 21, fontFamily: 'cafe24SsurroundAir_KR'),
    titleMedium: TextStyle(fontSize: 20, fontFamily: 'cafe24SsurroundAir_KR'),
    titleSmall: TextStyle(fontSize: 18, fontFamily: 'cafe24SsurroundAir_KR'),
    bodyLarge: TextStyle(fontSize: 17, fontFamily: 'cafe24SsurroundAir_KR'),
    bodyMedium: TextStyle(fontSize: 16, fontFamily: 'cafe24SsurroundAir_KR'),
    bodySmall: TextStyle(fontSize: 14, fontFamily: 'cafe24SsurroundAir_KR'),
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

IconButtonThemeData iconButtonThemeData() => IconButtonThemeData(
  style: ButtonStyle(
  )
);
