import 'package:account_book/get/controller/account_controller.dart';
import 'package:account_book/get/controller/page/asset_page_controller.dart';
import 'package:account_book/get/controller/page/is_loading_controller.dart';
import 'package:account_book/get/controller/trade_controller.dart';
import 'package:account_book/get/controller/user_controller.dart';
import 'package:account_book/screens/home/home_screen.dart';
import 'package:account_book/screens/login/login_screen.dart';
import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../common/log_config.dart';
import '../../common/widget/loader.dart';
import '../../get/controller/page/chart_page_controller.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimatedSplashScreen.withScreenFunction(
        splash: Column(
          children: [
            Icon(Icons.home, size: Get.textTheme.headlineMedium?.fontSize),
            Text(
              '가계부',
              style: Get.textTheme.headlineMedium,
            ),
            GestureDetector(
              onTap: UserController.to.clearToken,
              child: Text(
                '임시 로그아웃',
                style: Get.textTheme.bodySmall,
              ),
            )
          ],
        ),
        duration: 1000,
        splashTransition: SplashTransition.fadeTransition,
        backgroundColor: Get.theme.colorScheme.background,
        screenFunction: () async {
          await _processingData();

          if (UserController.to.accessToken == '') {
            return const LoginScreen();
          }
          return const HomeScreen();
        });
  }

  Future<void> _processingData() async {
    await UserController.to.initUser();

    if (UserController.to.user.value.userId != null) {
      await AccountController.to.findAccounts();
      await TradeController.to.findTrades();
      await ChartPageController.to.findChartData();
      await AssetPageController.to.findAssets();
    }
  }
}
