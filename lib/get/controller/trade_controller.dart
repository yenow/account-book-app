import 'dart:collection';

import 'package:account_book/constants.dart';
import 'package:account_book/data/model/trade.dart';
import 'package:account_book/get/controller/page/calendar_page_controller.dart';
import 'package:get/get.dart';

class TradeController extends GetxController {
  static TradeController get to => Get.find();
  final trades = <Trade>[].obs;
  final tradeListMap = Rx<Map<String, List<Trade>>>({
    '2023-07-04': [
      Trade(
          tradeId: 1,
          tradeDate: '2023-07-04',
          tradeType: 'expense',
          accountId: 1,
          amount: 1000000,
          typeName: '지출',
          accountName: '변동 지출 [식비]'),
      Trade(
          tradeId: 2,
          tradeDate: '2023-07-04',
          tradeType: 'income',
          amount: 10000,
          accountId: 2,
          typeName: '수입',
          accountName: '월급'),
      Trade(
          tradeId: 5,
          tradeDate: '2023-07-04',
          tradeType: 'expense',
          amount: 100000,
          accountId: 2,
          typeName: '지출',
          accountName: '변동 지출 [취미]'),
      Trade(
          tradeId: 6,
          tradeDate: '2023-07-04',
          tradeType: 'transfer',
          amount: 10000,
          accountId: 3,
          typeName: '이체',
          accountName: '이체')
    ],
    '2023-04-09': [
      Trade(
          tradeId: 3,
          tradeDate: '2023-04-09',
          tradeType: 'expense',
          accountId: 3,
          amount: 10000,
          typeName: '지출',
          accountName: '변동 지출 [식비]'),
      Trade(
          tradeId: 4,
          tradeDate: '2023-04-09',
          tradeType: 'income',
          accountId: 4,
          amount: 10000,
          typeName: '수입',
          accountName: '월급')
    ]
  });

  bool isSameDay(Trade account1, Trade account2) {
    return true;
  }

  // 이번달 총 수입
  int calculateTotalIncome() {
    int totalIncome = 0;
    int month = CalendarPageController.to.selectedDay.value.month;

    tradeListMap.value.forEach((key,List<Trade> value) {
      for (Trade trade in value) {
        int tradeMonth = int.parse(trade.tradeDate!.substring(5,7));

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

    tradeListMap.value.forEach((key,List<Trade> value) {
      for (Trade trade in value) {
        int tradeMonth = int.parse(trade.tradeDate!.substring(5,7));

        if (tradeMonth == month && trade.tradeType == TradeType.expense.name) {
          totalExpense = totalExpense + trade.amount!;
        }
      }
    });

    return totalExpense;
  }
}