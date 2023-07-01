import 'dart:collection';

import 'package:account_book/common/constant/intl.dart';
import 'package:account_book/constants.dart';
import 'package:account_book/data/model/trade.dart';
import 'package:account_book/get/controller/trade_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:table_calendar/table_calendar.dart';

class HomeController extends GetxController {
  static HomeController get to => Get.find();
  final PageController pageController = PageController();

  final selectIndex = 0.obs;

  final firstDay = DateTime.utc(2000, 01, 01);
  final lastDay = DateTime.utc(2100, 12, 31);
  final focusedDay = DateTime.now().obs;
  final selectedDay = DateTime.now().obs;
  final calendarFormat = CalendarFormat.month.obs;

  void onTap(int index) {
    selectIndex(index);
    pageController.animateToPage(index, duration: const Duration(milliseconds: 500), curve: Curves.ease);
    // pageController.jumpToPage(index);
  }

  bool selectedDayPredicate(DateTime dateTime) {
    return isSameDay(focusedDay.value, dateTime);
  }

  void onDaySelected(DateTime selectedDay, DateTime focusedDay) {
    log.d('before day $selectedDay  $focusedDay');
    if (!isSameDay(this.focusedDay.value, focusedDay)) {
      this.focusedDay(focusedDay);
      log.d('after day : ${this.focusedDay}');
    }
  }

  void onFormatChanged(CalendarFormat calendarFormat) {
    this.calendarFormat(calendarFormat);
  }

  void onPageChanged(day) {
    log.i('onPageChanged : $day');
    selectedDay(day);
  }

  List<Trade> eventLoader(DateTime dateTime) {
    String findDate = dateFormat.format(dateTime);
    List<Trade> accounts = TradeController.to.accountDateMap.value[findDate] ?? [];

    if (accounts.isNotEmpty) {
      return accounts;
    }
    return [];
  }
}
