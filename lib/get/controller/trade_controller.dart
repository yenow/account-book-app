import 'dart:collection';

import 'package:account_book/common/log_config.dart';
import 'package:account_book/data/model/trade.dart';
import 'package:account_book/get/controller/page/calendar_page_controller.dart';
import 'package:account_book/utilities/function/converter.dart';
import 'package:get/get.dart';

import '../../data/client/clients.dart';
import '../../data/dto/map_response.dart';

class TradeController extends GetxController {
  static TradeController get to => Get.find();
  final trades = <Trade>[].obs;
  final tradeListMap = Rx<Map<String, List<Trade>>>({});

  /// 전체 거래 리스트 가져오기
  Future<void> initTrades() async {
    await tradeClient.findAllTradeOfUser().then((MapResponse<Trade> value) {
      tradeListMap(value.data);
      log.i('가계부 거래 목록 :\n ${tradeListMap.value}');
    });
  }

  // 거래 리스트
  void changeTradeListMap(Map<String, List<Trade>> map) {
    tradeListMap(map);
  }

  bool isSameDay(Trade account1, Trade account2) {
    return true;
  }

  // 이번달 총 수입
  int calculateTotalIncome() {
    int totalIncome = 0;
    int month = CalendarPageController.to.selectedDay.value.month;

    tradeListMap.value.forEach((key, List<Trade> value) {
      for (Trade trade in value) {
        int tradeMonth = AppConverter.toDateTime(trade.tradeDate!).month;
        // int tradeMonth = int.parse(trade.tradeDate!.substring(5, 7));

        if (tradeMonth == month && trade.tradeType == TradeType.income.name) {
          totalIncome = totalIncome + trade.amount!;
        }
      }
    });

    return totalIncome;
  }

  // 이번달 총 지출
  int calculateTotalExpense() {
    int totalExpense = 0;
    int month = CalendarPageController.to.selectedDay.value.month;

    tradeListMap.value.forEach((key, List<Trade> value) {
      for (Trade trade in value) {
        // int tradeMonth = int.parse(trade.tradeDate!.substring(5, 7));
        int tradeMonth = AppConverter.toDateTime(trade.tradeDate!).month;

        if (tradeMonth == month && trade.tradeType == TradeType.expense.name) {
          totalExpense = totalExpense + trade.amount!;
        }
      }
    });

    return totalExpense;
  }
}
