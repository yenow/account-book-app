
import 'package:account_book/common/constant/format.dart';
import 'package:account_book/constants.dart';
import 'package:account_book/data/model/trade.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../route.dart';
import '../page/calendar_page_controller.dart';

class HomeScreenController extends GetxController {
  static HomeScreenController get to => Get.find();
  final PageController pageController = PageController();
  final selectIndex = 0.obs;

  void onTap(int index) {
    selectIndex(index);
    pageController.animateToPage(index, duration: const Duration(milliseconds: 500), curve: Curves.ease);
  }

  void onPageChanged(int index) {
    log.i('pageIndex = $index');
    selectIndex(index);
  }

  /// 가계부 등록 페이지로 이동
  void goToSingleTradeRegisterScreen() {
    log.d('goToAccountDetailScreen()');

    Trade trade = Trade(
      tradeDate: dateFormat.format(CalendarPageController.to.selectedDay.value),
    );
    Get.toNamed(AppRoute.tradeScreen, arguments: trade, preventDuplicates: true);
  }
}