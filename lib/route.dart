import 'package:account_book/constants.dart';
import 'package:account_book/data/dto/trade/trade_request_dto.dart';
import 'package:account_book/data/model/trade.dart';
import 'package:account_book/get/binding/account_detail_binding.dart';
import 'package:account_book/get/binding/login_binding.dart';
import 'package:account_book/get/controller/screen/trade_screen_controller.dart';
import 'package:account_book/get/controller/screen/login_screen_controller.dart';
import 'package:account_book/screens/home/home_screen.dart';
import 'package:account_book/screens/login/login_screen.dart';
import 'package:account_book/screens/setting/income_category_management_screen.dart';
import 'package:flutter/animation.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import 'screens/setting/expense_category_management_screen.dart';
import 'screens/trade/trade_screen.dart';
import 'utilities/function/convert.dart';

class AppRoute {
  static const String root = '/';
  static const String login = '/login';
  static const String tradeScreen = '/tradeScreen';
  static const String incomeCategoryManagement = '/incomeCategoryManagement';
  static const String expenseCategoryManagement = '/expenseCategoryManagement';

  static List<GetPage<dynamic>> getRoutes() {
    return [
      GetPage(name: root, page: () => const HomeScreen()),
      GetPage(
        name: login,
        page: () => const LoginScreen(),
        binding: LoginBinding(),
      ),
      tradeRegisterScreenPage(),
      GetPage(
        name: incomeCategoryManagement,
        page: () {
          return const IncomeCategoryManagementScreen();
        },
        curve: Curves.ease,
        popGesture: true,
        transitionDuration: const Duration(milliseconds: 550),
      ),
      GetPage(
        name: expenseCategoryManagement,
        page: () {
          return const ExpenseCategoryManagementScreen();
        },
        curve: Curves.ease,
        popGesture: true,
        transitionDuration: const Duration(milliseconds: 550),
      ),
    ];
  }

  static GetPage<dynamic> tradeRegisterScreenPage() {
    return GetPage(
      name: tradeScreen,
      binding: TradeRegisterScreenBinding(),
      curve: Curves.easeOutQuad,
      popGesture: true,
      transition: Transition.downToUp,
      transitionDuration: const Duration(milliseconds: 500),
      page: () {
        Trade trade = Get.arguments;
        log.d(trade);
        TradesScreenController.to.tradeType(trade.tradeType ?? TradeType.expense.name);

        TradesScreenController.to.trade = trade;
        TradesScreenController.to.dateController.text = trade.tradeDate!;
        TradesScreenController.to.amountController.text = Converter.numberFormat(trade.amount ?? 0);
        TradesScreenController.to.accountController.text = trade.typeName ?? '';
        TradesScreenController.to.assetController.text = trade.accountName ?? '';
        TradesScreenController.to.contentController.text = trade.content ?? '';
        TradesScreenController.to.memoController.text = trade.memo ?? '';
        TradesScreenController.to.depositAssertTextController.text = trade.depositAccountName ?? '';
        TradesScreenController.to.withdrawAssertTextController.text = trade.withdrawAccountName ?? '';

        return TradeScreen(trade: trade);
      },
    );
  }
}
