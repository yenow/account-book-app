import 'dart:collection';

import 'package:account_book/data/model/account.dart';
import 'package:get/get.dart';

class AccountController extends GetxController {
  static AccountController get to => Get.find();
  final accounts = <Account>[].obs;
  final accountDateMap = Rx<Map<String, List<Account>>>({
    '2023-04-04': [
      Account(
          id: 1,
          date: '2023-04-04',
          type: 'expense',
          categoryId: 1,
          amount: 10000,
          typeName: '지출',
          categoryName: '변동 지출 [식비]'),
      Account(
          id: 2,
          date: '2023-04-04',
          type: 'income',
          amount: 10000,
          categoryId: 2,
          typeName: '수입',
          categoryName: '월급')
    ],
    '2023-04-09': [
      Account(
          id: 3,
          date: '2023-04-09',
          type: 'expense',
          categoryId: 3,
          amount: 10000,
          typeName: '지출',
          categoryName: '변동 지출 [식비]'),
      Account(
          id: 4,
          date: '2023-04-09',
          type: 'income',
          categoryId: 4,
          amount: 10000,
          typeName: '수입',
          categoryName: '월급')
    ]
  });

  bool isSameDay(Account account1, Account account2) {
    return true;
  }
}