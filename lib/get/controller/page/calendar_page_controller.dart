import 'dart:collection';

import 'package:account_book/common/constant/format.dart';
import 'package:account_book/common/log_config.dart';
import 'package:account_book/data/model/trade.dart';
import 'package:account_book/get/controller/trade_controller.dart';
import 'package:account_book/screens/home/component/calendar_builder.dart';
import 'package:account_book/common/function/converter.dart';
import 'package:calendar_view/calendar_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:table_calendar/table_calendar.dart';

import '../../../route.dart';
import 'asset_page_controller.dart';
import 'chart_page_controller.dart';

class CalendarPageController extends GetxController {
  static CalendarPageController get to => Get.find();
  final firstDay = DateTime.utc(2000, 01, 01);
  final lastDay = DateTime.utc(2100, 12, 31);
  final globalKey = UniqueKey();
  final GlobalKey<MonthViewState> monthViewState = GlobalKey();


  final focusedDay = DateTime.now().obs;
  final selectedDay = DateTime.now().obs;
  final calendarFormat = CalendarFormat.month.obs;

  /// 이전 월로 변경
  void goToPreviousMonth() async {
    selectedDay(DateTime(selectedDay.value.year, selectedDay.value.month - 1, selectedDay.value.day));
    CalendarPageController.to.monthViewState.currentState?.animateToMonth(selectedDay.value);
  }

  /// 다음 월로 변경
  void goToNextMonth() async {
    selectedDay(DateTime(selectedDay.value.year, selectedDay.value.month + 1, selectedDay.value.day));
    CalendarPageController.to.monthViewState.currentState?.animateToMonth(selectedDay.value);
  }

  /// 거래 상세 페이지로 이동
  Future<void> goToTradeScreen(Trade trade) async {
    String tradeDate = await Get.toNamed(AppRoute.tradeScreen, arguments: trade, preventDuplicates: true);
    changeFocusDate(tradeDate);
    // log.i('tradeListMap = $tradeListMap');
    // await ChartPageController.to.initChartData();
    // await AssetPageController.to.initAssetListSumAmount();
    // TradeController.to.changeTradeListMap(tradeListMap);
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

  void onPageChanged(DateTime day) {
    selectedDay(day);
  }

  List<Trade> eventLoader(DateTime dateTime) {
    String findDate = AppConverter.toDayString(dateTime);
    List<Trade> accounts = TradeController.to.tradeListMap.value[findDate] ?? [];

    if (accounts.isNotEmpty) {
      return accounts;
    }
    return [];
  }

  // 포커스 날짜 변경
  void changeFocusDate(String tradeDate) {
    focusedDay(AppConverter.toDateTime(tradeDate));
  }

  // 포커스 날짜 변경
  void changeFocusDay(DateTime focusDay) {
    focusedDay(focusDay);
  }
}
