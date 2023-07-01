import 'package:account_book/constants.dart';
import 'package:account_book/data/model/trade.dart';
import 'package:account_book/get/binding/account_detail_binding.dart';
import 'package:account_book/screens/home/home_screen.dart';
import 'package:account_book/screens/setting/income_category_management_screen.dart';
import 'package:account_book/screens/single_trade_register_screen/single_trade_register_screen.dart';
import 'package:flutter/animation.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';

import 'screens/setting/expense_category_management_screen.dart';

class AppRoute {
  static const String root = '/';
  static const String singleTradeRegisterScreen = '/singleTradeRegisterScreen';
  static const String incomeCategoryManagement = '/incomeCategoryManagement';
  static const String expenseCategoryManagement = '/expenseCategoryManagement';

  static List<GetPage<dynamic>> getRoutes() {
    return [
      GetPage(name: root, page: () => const HomeScreen()),
      GetPage(
          name: singleTradeRegisterScreen,
          page: () {
            Trade account = Get.arguments;
            log.d(account);
            return SingleTradeRegisterScreen(account: account);
          },
          binding: AccountDetailBinding(),
          curve: Curves.ease,
          popGesture: true,
          transitionDuration: const Duration(milliseconds: 1000)),
      GetPage(
          name: incomeCategoryManagement,
          page: () {
            return const IncomeCategoryManagementScreen();
          },
          curve: Curves.ease,
          popGesture: true,
          transitionDuration: const Duration(milliseconds: 550)),
      GetPage(
          name: expenseCategoryManagement,
          page: () {
            return const ExpenseCategoryManagementScreen();
          },
          curve: Curves.ease,
          popGesture: true,
          transitionDuration: const Duration(milliseconds: 550)),
    ];
  }
}
