import 'dart:collection';

import 'package:account_book/data/dto/account/account_request_dto.dart';
import 'package:account_book/data/model/asset.dart';
import 'package:account_book/data/model/trade.dart';
import 'package:account_book/data/model/account.dart';
import 'package:account_book/get/controller/user_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../common/log_config.dart';
import '../../data/client/account_client.dart';
import '../../data/client/clients.dart';
import '../../data/dto/account/account_response_dto.dart';
import '../../data/dto/single_response.dart';

class AccountController extends GetxController {
  static AccountController get to => Get.find();

  final categories = Rx<List<Account>>([]);
  final incomeAccounts = Rx<List<Account>>([]); // 수입 카테고리
  final expenseAccounts = Rx<List<Account>>([]); // 지출 카테고리
  final assetAccounts = Rx<List<Account>>([]); // 자산 카테고리
  final groupAssetAccounts = Rx<List<Account>>([]); // 자산 그룹 카테고리

  TextEditingController nameController = TextEditingController();

  /// 계정타입별 계정(카테고리)리스트
  Future<void> initAccounts() async {
    await accountClient.findAccountsByAccountType().then((value) {
      incomeAccounts(value.data!.incomeAccounts);
      expenseAccounts(value.data!.expenseAccounts);
      // assetAccounts(value.data!.assetAccounts);
      assetAccounts(value.data!.assetAccounts?.where((element) => element.level == 2).toList());
      groupAssetAccounts(value.data!.assetAccounts?.where((element) => element.level == 1).toList());
    });
  }

  /// 계정 추가 및 수정 팝업
  Future<dynamic> accountAddDialog(String name, Account? account, String accountType) {
    return Get.defaultDialog(
      title: name,
      titlePadding: const EdgeInsetsDirectional.only(top: 15, bottom: 10),
      titleStyle: TextStyle(fontSize: Get.textTheme.titleMedium!.fontSize, color: Get.theme.colorScheme.onBackground),
      backgroundColor: Get.theme.colorScheme.background,
      buttonColor: Get.theme.colorScheme.primary,
      content: textForm(),
      textConfirm: '저장',
      confirmTextColor: Get.theme.colorScheme.onPrimary,
      // 저장
      onConfirm: () async {
        SingleResponse<AccountResponseDto> value = await accountClient.saveAccount(
          accountRequestDto: AccountRequestDto(
            accountId: account?.accountId,
            accountName: nameController.text,
            accountType: accountType,
          ),
        );

        AccountResponseDto data = value.data!;

        if (accountType == 'income') {
          if (account == null) {
            AccountController.to.incomeAccounts.value.add(
              Account(
                  accountId: data.accountId,
                  accountName: data.accountName,
                  level: data.level,
                  accountType: data.accountType,
                  description: data.description,
                  isLeaf: data.isLeaf),
            );
            AccountController.to.incomeAccounts(AccountController.to.incomeAccounts.value.toList());
          } else {
            account.accountName = data.accountName;
            AccountController.to.incomeAccounts(AccountController.to.incomeAccounts.value.toList());
          }


        } else if (accountType == 'expense') {
          if (account == null) {
            AccountController.to.expenseAccounts.value.add(
              Account(
                  accountId: data.accountId,
                  accountName: data.accountName,
                  level: data.level,
                  accountType: data.accountType,
                  description: data.description,
                  isLeaf: data.isLeaf),
            );
            AccountController.to.expenseAccounts(AccountController.to.expenseAccounts.value.toList());
          } else {
            account.accountName = data.accountName;
            AccountController.to.expenseAccounts(AccountController.to.expenseAccounts.value.toList());
          }
        }

        nameController.text = '';

        Get.back(result: true);
      },
      textCancel: '취소',
      cancelTextColor: Get.theme.colorScheme.primary,
      onCancel: () {
        nameController.text = '';
      },
    );
  }

  Widget textForm() {
    return Row(
      children: [
        Container(
          padding: const EdgeInsets.fromLTRB(5, 0, 15, 10),
          child: Text(
            '이름',
            style: TextStyle(fontSize: Get.textTheme.bodyLarge!.fontSize!, color: Get.theme.colorScheme.onBackground),
          ),
        ),
        Expanded(
          child: TextFormField(
            onSaved: (newValue) {},
            validator: (value) {},
            maxLines: 1,
            maxLength: 200,
            autofocus: false,
            cursorColor: Get.theme.colorScheme.outlineVariant,
            controller: nameController,
            decoration: buildInputDecoration(),
            style: TextStyle(fontSize: Get.textTheme.bodyLarge!.fontSize!),
          ),
        )
      ],
    );
  }

  InputDecoration buildInputDecoration() {
    return InputDecoration(
      counterText: '',
      isDense: true,
      focusColor: Get.theme.colorScheme.outlineVariant,
      errorMaxLines: 1,
      contentPadding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      focusedBorder: UnderlineInputBorder(borderSide: BorderSide(width: 1, color: Get.theme.colorScheme.outlineVariant)),
      enabledBorder: UnderlineInputBorder(borderSide: BorderSide(width: 0.5, color: Get.theme.colorScheme.outlineVariant)),
      disabledBorder: UnderlineInputBorder(borderSide: BorderSide(width: 0.5, color: Get.theme.colorScheme.outlineVariant)),
    );
  }
}
