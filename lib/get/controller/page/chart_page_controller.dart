import 'dart:collection';

import 'package:account_book/common/constant/format.dart';
import 'package:account_book/common/log_config.dart';
import 'package:account_book/data/dto/chart/chart_request_dto.dart';
import 'package:account_book/data/model/trade.dart';
import 'package:account_book/get/controller/trade_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:table_calendar/table_calendar.dart';

import '../../../data/client/clients.dart';
import '../../../data/dto/chart/chart_response_dto.dart';
import '../../../data/dto/single_response.dart';
import '../../../data/model/chart_data.dart';
import '../../../utilities/function/converter.dart';

class ChartPageController extends GetxController {
  static ChartPageController get to => Get.find();
  final scroll = ScrollController();

  final selectedDay = DateTime.now().obs;
  final expenseChartData = Rx<List<ChartData>>([]);
  final incomeChartData = Rx<List<ChartData>>([]);

  /// 이전 월로 변경
  void goToPreviousMonth() async {
    selectedDay(DateTime(selectedDay.value.year, selectedDay.value.month - 1, selectedDay.value.day));
    await findChartData();
  }

  /// 다음 월로 변경
  void goToNextMonth() async {
    selectedDay(DateTime(selectedDay.value.year, selectedDay.value.month + 1, selectedDay.value.day));
    await findChartData();
  }

  /// 월 차트 데이터 조회
  Future<void> findChartData() async {

    chartClient.findChartData(
      chartRequestDto: ChartRequestDto(
        month: AppConverter.toMonthString(selectedDay.value),
      ),
    ).then((SingleResponse<ChartResponseDto> value) {
      incomeChartData(value.data!.incomeChartData);
      expenseChartData(value.data!.expenseChartData);
    });
  }

  final incomeColors = [
    const Color(0xFFE5D1FA),
    const Color(0xFFAAC4FF),
    const Color(0xFF9BE8D8),
    const Color(0xFFECF2FF),
    const Color(0xFFE3DFFD),
    const Color(0xFFFFF4D2),
    const Color(0xFFF7C8E0),
    const Color(0xFFF7C8E0),
    const Color(0xFFF7C8E0),
    const Color(0xFFF7C8E0),
  ];

  final expenseColors = [
    const Color(0xFF9BE8D8),
    const Color(0xFFAAC4FF),
    const Color(0xFFE5D1FA),
    const Color(0xFFECF2FF),
    const Color(0xFFE3DFFD),
    const Color(0xFFFFF4D2),
    const Color(0xFFF7C8E0),
    const Color(0xFFF7C8E0),
    const Color(0xFFF7C8E0),
    const Color(0xFFF7C8E0),
  ];
}
