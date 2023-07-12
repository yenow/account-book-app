import 'dart:collection';

import 'package:account_book/common/constant/format.dart';
import 'package:account_book/constants.dart';
import 'package:account_book/data/model/trade.dart';
import 'package:account_book/get/controller/trade_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:table_calendar/table_calendar.dart';

import '../../../data/model/chart_data.dart';

class ChartPageController extends GetxController {
  static ChartPageController get to => Get.find();
  final selectedDay = DateTime.now().obs;

  final expenseChartData = Rx<List<ChartData>>([
    ChartData(accountName: "식비", amount: 5000, percent: 50),
    ChartData(accountName: "생활비", amount: 3000, percent: 30),
    ChartData(accountName: "유흥비", amount: 2000, percent: 20),
    ChartData(accountName: "관리비", amount: 1000, percent: 10),
    ChartData(accountName: "관리비", amount: 1000, percent: 10),
    ChartData(accountName: "관리비", amount: 1000, percent: 10),
    ChartData(accountName: "관리비", amount: 1000, percent: 10),
    ChartData(accountName: "관리비", amount: 1000, percent: 10),
    ChartData(accountName: "관리비", amount: 1000, percent: 10),
  ]);

  final incomeChartData = Rx<List<ChartData>>([
    ChartData(accountName: "월급", amount: 5000, percent: 50),
    ChartData(accountName: "퇴직금", amount: 3000, percent: 30),

  ]);


  final scroll = ScrollController();
  final colors = [
    const Color(0xFF78C1F3),
    const Color(0xFF9BE8D8),
    const Color(0xFFECF2FF),
    const Color(0xFFE3DFFD),
    const Color(0xFFE5D1FA),
    const Color(0xFFFFF4D2),
    const Color(0xFFF7C8E0),
    const Color(0xFFF7C8E0),
    const Color(0xFFF7C8E0),
    const Color(0xFFF7C8E0),
  ];
}
