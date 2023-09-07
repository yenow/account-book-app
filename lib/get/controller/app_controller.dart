import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:restart_app/restart_app.dart';

import '../../common/theme/system_theme.dart';
import '../../main.dart';

class AppController extends GetxController {
  static AppController get to => Get.find();
  final isDarkMode = false.obs;
  String version = '';

  void toDarkMode() async {
    SystemChrome.setSystemUIOverlayStyle(darkSystemUiOverlayStyle);

    Get.changeThemeMode(ThemeMode.dark);
    await saveIsDarkModeForStorage(true);
    isDarkMode(true);
    Restart.restartApp();
  }

  void toWhiteMode() async {
    SystemChrome.setSystemUIOverlayStyle(lightSystemUiOverlayStyle);

    Get.changeThemeMode(ThemeMode.light);
    await saveIsDarkModeForStorage(false);
    isDarkMode(false);
    Restart.restartApp();
  }

  /// 스토리지에 다크모드 설정 저장
  Future<void> saveIsDarkModeForStorage(bool isDarkMode) async {
    await storage.write(key: 'isDarkMode', value: isDarkMode ? 'Y' : 'N');
  }

  Future<void> initData() async {
    String value = await storage.read(key: 'isDarkMode') ?? '';
    PackageInfo packageInfo = await PackageInfo.fromPlatform();

    version = packageInfo.version;

    if (value == 'Y') {
      isDarkMode(true);
    } else {
      isDarkMode(false);
    }
  }
}
