import 'package:account_book/common/constant/format.dart';
import 'package:account_book/common/log_config.dart';
import 'package:account_book/data/model/trade.dart';
import 'package:account_book/get/controller/page/asset_page_controller.dart';
import 'package:account_book/get/controller/page/chart_page_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../route.dart';
import '../../../common/function/converter.dart';
import '../page/calendar_page_controller.dart';
import '../trade_controller.dart';

class HomeScreenController extends GetxController {
  static HomeScreenController get to => Get.find();
  final PageController pageController = PageController(keepPage: true);
  final selectIndex = 0.obs;

  void onTap(int index) {
    selectIndex(index);
    pageController.jumpToPage(index);
    // pageController.animateToPage(index, duration: const Duration(milliseconds: 500), curve: Curves.ease);
  }

  void onPageChanged(int index) {
    selectIndex(index);
  }

  /// 가계부 등록 페이지로 이동
  void goToTradeRegisterScreen() async {
    Trade trade = Trade(
      tradeDate: AppConverter.toDayString(CalendarPageController.to.selectedDay.value),
    );
    await CalendarPageController.to.goToTradeScreen(trade);
  }
}
