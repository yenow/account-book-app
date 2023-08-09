import 'dart:collection';

import 'package:account_book/data/dto/account/account_request_dto.dart';
import 'package:account_book/data/model/trade.dart';
import 'package:account_book/data/model/account.dart';
import 'package:account_book/get/controller/user_controller.dart';
import 'package:get/get.dart';

import '../../common/log_config.dart';
import '../../data/client/account_client.dart';
import '../../data/client/clients.dart';

class AccountController extends GetxController {
  static AccountController get to => Get.find();

  final categories = Rx<List<Account>>([]);
  final incomeAccounts = Rx<List<Account>>([]); // 수입 카테고리
  final expenseAccounts = Rx<List<Account>>([]); // 지출 카테고리
  final assetAccounts = Rx<List<Account>>([]); // 자산 카테고리
  final groupAssetAccounts = Rx<List<Account>>([]); // 자산 그룹 카테고리

  /// 계정타입별 계정(카테고리)리스트
  Future<void> findAccounts() async {
    await accountClient.findAccountsByAccountType().then((value) {
      incomeAccounts(value.data!.incomeAccounts);
      expenseAccounts(value.data!.expenseAccounts);
      assetAccounts(value.data!.assetAccounts);
      groupAssetAccounts(value.data!.assetAccounts?.where((element) => element.level == 1).toList());
    });
  }
}
