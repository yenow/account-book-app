import 'dart:collection';

import 'package:account_book/common/constant/format.dart';
import 'package:account_book/common/log_config.dart';
import 'package:account_book/data/model/trade.dart';
import 'package:account_book/get/controller/trade_controller.dart';
import 'package:account_book/utilities/function/converter.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:table_calendar/table_calendar.dart';

class CalendarPageController extends GetxController {
  static CalendarPageController get to => Get.find();
  final firstDay = DateTime.utc(2000, 01, 01);
  final lastDay = DateTime.utc(2100, 12, 31);
  final focusedDay = DateTime.now().obs;
  final selectedDay = DateTime.now().obs;
  final calendarFormat = CalendarFormat.month.obs;

  /// 이전 월로 변경
  void goToPreviousMonth() async {
    selectedDay(DateTime(selectedDay.value.year, selectedDay.value.month - 1, selectedDay.value.day));
  }

  /// 다음 월로 변경
  void goToNextMonth() async {
    selectedDay(DateTime(selectedDay.value.year, selectedDay.value.month + 1, selectedDay.value.day));
  }

  bool selectedDayPredicate(DateTime dateTime) {
    return isSameDay(focusedDay.value, dateTime);
  }

  void onDaySelected(DateTime selectedDay, DateTime focusedDay) {
    if (!isSameDay(this.focusedDay.value, focusedDay)) {
      this.focusedDay(focusedDay);
    }
  }

  void onFormatChanged(CalendarFormat calendarFormat) {
    this.calendarFormat(calendarFormat);
  }

  void onPageChanged(day) {
    selectedDay(day);
  }

  List<Trade> eventLoader(DateTime dateTime) {
    String findDate = AppConverter.toDayString(dateTime);
    List<Trade> accounts = TradeController.to.tradeListMap.value[findDate] ?? [];
    log.i('출력할 거래 목록 : $findDate $accounts');

    if (accounts.isNotEmpty) {
      return accounts;
    }
    return [];
  }
}
