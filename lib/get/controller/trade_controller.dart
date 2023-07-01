import 'dart:collection';

import 'package:account_book/constants.dart';
import 'package:account_book/data/model/trade.dart';
import 'package:account_book/get/controller/home_controller.dart';
import 'package:get/get.dart';

class TradeController extends GetxController {
  static TradeController get to => Get.find();
  final accounts = <Trade>[].obs;
  final accountDateMap = Rx<Map<String, List<Trade>>>({
    '2023-07-04': [
      Trade(
          id: 1,
          tradeDate: '2023-07-04',
          type: 'expense',
          categoryId: 1,
          amount: 1000000,
          typeName: '지출',
          categoryName: '변동 지출 [식비]'),
      Trade(
          id: 2,
          tradeDate: '2023-07-04',
          type: 'income',
          amount: 10000,
          categoryId: 2,
          typeName: '수입',
          categoryName: '월급'),
      Trade(
          id: 5,
          tradeDate: '2023-07-04',
          type: 'expense',
          amount: 100000,
          categoryId: 2,
          typeName: '지출',
          categoryName: '변동 지출 [취미]')
    ],
    '2023-04-09': [
      Trade(
          id: 3,
          tradeDate: '2023-04-09',
          type: 'expense',
          categoryId: 3,
          amount: 10000,
          typeName: '지출',
          categoryName: '변동 지출 [식비]'),
      Trade(
          id: 4,
          tradeDate: '2023-04-09',
          type: 'income',
          categoryId: 4,
          amount: 10000,
          typeName: '수입',
          categoryName: '월급')
    ]
  });

  bool isSameDay(Trade account1, Trade account2) {
    return true;
  }

  // 이번달 총 수입
  int calculateTotalIncome() {
    int totalIncome = 0;
    int month = HomeController.to.selectedDay.value.month;
    log.i('calculateTotalIncome : $month');

    accountDateMap.value.forEach((key,List<Trade> value) {
      for (Trade trade in value) {
        int tradeMonth = int.parse(trade.tradeDate!.substring(5,7));

        if (tradeMonth == month && trade.type == TradeType.income.name) {
          totalIncome = totalIncome + trade.amount!;
        }
      }
    });

    return totalIncome;
  }

  // 이번달 총 지출
  int calculateTotalExpense() {
    int totalExpense = 0;
    int month = HomeController.to.selectedDay.value.month;

    accountDateMap.value.forEach((key,List<Trade> value) {
      for (Trade trade in value) {
        int tradeMonth = int.parse(trade.tradeDate!.substring(5,7));

        if (tradeMonth == month && trade.type == TradeType.expense.name) {
          totalExpense = totalExpense + trade.amount!;
        }
      }
    });

    return totalExpense;
  }
}