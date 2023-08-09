import 'package:account_book/common/constant/format.dart';
import 'package:account_book/common/log_config.dart';
import 'package:account_book/data/model/trade.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../route.dart';
import '../../../utilities/function/converter.dart';
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
  void goToSingleTradeRegisterScreen() async {
    log.d('goToAccountDetailScreen() : 가계부 등록 페이지로 이동');

    Trade trade = Trade(
      tradeDate: AppConverter.toDayString(CalendarPageController.to.selectedDay.value),
    );
    String result = await Get.toNamed(AppRoute.tradeScreen, arguments: trade, preventDuplicates: true);
    // if (result == 'Y') {
    //   TradeController.to.findTrades();
    // }
  }
}
