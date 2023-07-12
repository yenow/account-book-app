import 'dart:collection';

import 'package:account_book/data/dto/account/account_request_dto.dart';
import 'package:account_book/data/model/trade.dart';
import 'package:account_book/data/model/account.dart';
import 'package:get/get.dart';

import '../../constants.dart';
import '../../data/client/account_client.dart';
import '../../data/client/client_list.dart';

class AccountController extends GetxController {
  static AccountController get to => Get.find();

  final categories = Rx<List<Account>>([]);
  final incomeAccounts = Rx<List<Account>>([]);
  final expenseAccounts = Rx<List<Account>>([]);
  final assetAccounts = Rx<List<Account>>([]);

  @override
  void onInit() {
    super.onInit();
    // findAccountsByAccountType();
  }

  /// 계정타입별 계정(카테고리)리스트
  void findAccountsByAccountType() {
    accountClient.findAccountsByAccountType(accountRequestDto: AccountRequestDto(userId: 3)).then((value) {
      log.i(value);
      incomeAccounts(value.incomeAccounts);
      expenseAccounts(value.expenseAccounts);
      assetAccounts(value.assetAccounts);
    });
  }
}
