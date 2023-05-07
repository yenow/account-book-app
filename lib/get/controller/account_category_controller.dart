import 'dart:collection';

import 'package:account_book/data/model/account.dart';
import 'package:account_book/data/model/account_category.dart';
import 'package:account_book/data/model/account_type.dart';
import 'package:get/get.dart';

class AccountCategoryController extends GetxController {
  static AccountCategoryController get to => Get.find();
  final accountCategoryMap = Rx<Map<String, List<AccountCategory>>>({
    'income': [
      AccountCategory(id: 1, name: '월급', type: AccountType.income, typeName: '수입'),
      AccountCategory(id: 2, name: '돌발 수입', type: AccountType.income, typeName: '수입'),
      AccountCategory(id: 3, name: '용돈', type: AccountType.income, typeName: '수입'),
      AccountCategory(id: 4, name: '이월', type: AccountType.income, typeName: '수입'),
      AccountCategory(id: 5, name: '자산 인출', type: AccountType.income, typeName: '수입'),
      AccountCategory(id: 6, name: '기타', type: AccountType.income, typeName: '수입'),
    ],
    'expense': [
      AccountCategory(id: 7, level: 1, name: '변동 지출', type: AccountType.expense, typeName: '지출'),
      AccountCategory(id: 10, parentId: 7, level: 2, name: '식비', type: AccountType.expense, typeName: '지출'),
      AccountCategory(id: 11, parentId: 7, level: 2, name: '생활 용품비', type: AccountType.expense, typeName: '지출'),
      AccountCategory(id: 12, parentId: 7, level: 2, name: '교통 유류비', type: AccountType.expense, typeName: '지출'),
      AccountCategory(id: 8, level: 1, name: '고정 지출', type: AccountType.expense, typeName: '지출'),
      AccountCategory(id: 20, parentId: 8, level: 2, name: '전기세', type: AccountType.expense, typeName: '지출'),
      AccountCategory(id: 9, level: 1, name: '돌발 지출', type: AccountType.expense, typeName: '지출'),
      AccountCategory(id: 30, parentId: 9, level: 2, name: '카드 대금', type: AccountType.expense, typeName: '지출'),
    ]
  });
}
