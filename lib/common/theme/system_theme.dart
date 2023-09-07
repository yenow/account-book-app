import 'package:account_book/common/theme/dark_theme.dart';
import 'package:account_book/common/theme/theme.dart';
import 'package:flutter/services.dart';

// 시스템 UI 스타일 (light)
SystemUiOverlayStyle lightSystemUiOverlayStyle = SystemUiOverlayStyle(
  statusBarColor: onPrimaryColor,
  systemNavigationBarColor: onPrimaryColor,
  systemNavigationBarIconBrightness: Brightness.dark,
  statusBarIconBrightness: Brightness.dark,
  statusBarBrightness: Brightness.light,
);

// 시스템 UI 스타일 (dark)
SystemUiOverlayStyle darkSystemUiOverlayStyle = SystemUiOverlayStyle(
  statusBarColor: primaryDarkColor,
  systemNavigationBarColor: primaryDarkColor,
  systemNavigationBarIconBrightness: Brightness.light,
  statusBarIconBrightness: Brightness.light,
  statusBarBrightness: Brightness.dark,
);

