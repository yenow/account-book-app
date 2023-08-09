import 'package:account_book/common/log_config.dart';
import 'package:account_book/data/dto/trade/trade_request_dto.dart';
import 'package:account_book/data/model/trade.dart';
import 'package:account_book/get/binding/asset_screen_binding.dart';
import 'package:account_book/get/binding/trade_screen_binding.dart';
import 'package:account_book/get/binding/login_binding.dart';
import 'package:account_book/get/controller/screen/trade_screen_controller.dart';
import 'package:account_book/get/controller/screen/login_screen_controller.dart';
import 'package:account_book/screens/asset/asset_screen.dart';
import 'package:account_book/screens/home/home_screen.dart';
import 'package:account_book/screens/login/login_screen.dart';
import 'package:account_book/screens/setting/income_category_management_screen.dart';
import 'package:account_book/screens/splash/splash_screen.dart';
import 'package:flutter/animation.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import 'data/model/asset.dart';
import 'get/controller/screen/asset_screen_controller.dart';
import 'screens/setting/expense_category_management_screen.dart';
import 'screens/trade/trade_screen.dart';
import 'utilities/function/converter.dart';

class AppRoute {
  static const String root = '/';
  static const String homeScreen = '/homeScreen';
  static const String loginScreen = '/loginScreen';
  static const String tradeScreen = '/tradeScreen';
  static const String incomeCategoryManagement = '/incomeCategoryManagement';
  static const String expenseCategoryManagement = '/expenseCategoryManagement';
  static const String assetScreen = '/assetScreen';

  static List<GetPage<dynamic>> getRoutes() {
    return [
      toRoot(),
      toHomeScreen(),
      toLoginScreen(),
      getTradeScreen(),
      toIncomeCategoryManagement(),
      toExpenseCategoryManagement(),
      toAssetScreen(),
    ];
  }

  static GetPage<dynamic> toRoot() => GetPage(name: root, page: () => const SplashScreen());

  static GetPage<dynamic> toHomeScreen() => GetPage(name: homeScreen, page: () => const HomeScreen());

  static GetPage<dynamic> toLoginScreen() {
    return GetPage(
      name: loginScreen,
      page: () => const LoginScreen(),
      binding: LoginBinding(),
    );
  }

  static GetPage<dynamic> toIncomeCategoryManagement() {
    return GetPage(
      name: incomeCategoryManagement,
      page: () {
        return const IncomeCategoryManagementScreen();
      },
      curve: Curves.ease,
      popGesture: true,
      transitionDuration: const Duration(milliseconds: 550),
    );
  }

  static GetPage<dynamic> toExpenseCategoryManagement() {
    return GetPage(
      name: expenseCategoryManagement,
      page: () {
        return const ExpenseCategoryManagementScreen();
      },
      curve: Curves.ease,
      popGesture: true,
      transitionDuration: const Duration(milliseconds: 550),
    );
  }

  static GetPage<dynamic> toAssetScreen() {
    return GetPage(name: assetScreen,
        binding: AssetScreenBinding(),
        curve: Curves.easeOutQuad,
        popGesture: true,
        transition: Transition.downToUp,
        transitionDuration: const Duration(milliseconds: 500),
        page: () {
      Asset asset = Get.arguments;
      log.d(asset);

      AssetScreenController.to.asset(asset);
      if (asset.accountId != null) {
        AssetScreenController.to.amountController.text = AppConverter.numberFormat(asset.sumAmount ?? 0);
        if (asset.level == 1) {
          AssetScreenController.to.amountController.text = AppConverter.numberFormat(0);
          AssetScreenController.to.groupNameController.text = asset.accountName?? '';
          AssetScreenController.to.assetGroupController.text = '';
          AssetScreenController.to.assetNameController.text = '';
          AssetScreenController.to.assetType(AssetType.group.name);
        } else {
          AssetScreenController.to.amountController.text = AppConverter.numberFormat(0);
          AssetScreenController.to.groupNameController.text = '';
          AssetScreenController.to.assetGroupController.text = asset.groupAccountName ?? '';
          AssetScreenController.to.assetNameController.text = asset.accountName ?? '';
          AssetScreenController.to.assetType(AssetType.asset.name);
        }

      } else {
        AssetScreenController.to.amountController.text = AppConverter.numberFormat(0);
        AssetScreenController.to.groupNameController.text = '';
        AssetScreenController.to.assetGroupController.text = '';
        AssetScreenController.to.assetNameController.text = '';
        AssetScreenController.to.assetType(AssetType.asset.name);
      }

      return AssetScreen(asset: asset,);
    });
  }

  static GetPage<dynamic> getTradeScreen() {
    return GetPage(
      name: tradeScreen,
      binding: TradeScreenBinding(),
      curve: Curves.easeOutQuad,
      popGesture: true,
      transition: Transition.downToUp,
      transitionDuration: const Duration(milliseconds: 500),
      page: () {
        Trade trade = Get.arguments;
        log.d('거래 상세 페이지로 이동\n $trade');
        TradesScreenController.to.tradeType(trade.tradeType ?? TradeType.expense.name);

        TradesScreenController.to.trade = trade;
        TradesScreenController.to.dateController.text = trade.tradeDate!;
        TradesScreenController.to.amountController.text = AppConverter.numberFormat(trade.amount ?? 0);
        TradesScreenController.to.incomeExpenseAccountController.text = trade.typeName ?? '';
        TradesScreenController.to.assetController.text = trade.incomeOrExpenseAccountName ?? '';
        TradesScreenController.to.contentController.text = trade.content ?? '';
        TradesScreenController.to.memoController.text = trade.memo ?? '';
        TradesScreenController.to.depositAssertTextController.text = trade.depositAccountName ?? '';
        TradesScreenController.to.withdrawAssertTextController.text = trade.withdrawAccountName ?? '';

        return TradeScreen(trade: trade);
      },
    );
  }
}
