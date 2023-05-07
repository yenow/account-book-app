import 'package:account_book/common/constant/intl.dart';
import 'package:account_book/constants.dart';
import 'package:account_book/route.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../data/model/account.dart';

/// 가계부 내역 컴포넌트
class AccountHistoryRow extends StatelessWidget {
  const AccountHistoryRow({Key? key, required this.account}) : super(key: key);
  final Account account;

  // 날짜 카테고리 금액
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: goToAccountDetailScreen,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 10),
        child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Flexible(
                flex: 2,
                fit: FlexFit.tight,
                child: AutoSizeText(
                  account.date!,
                  maxLines: 1,
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: Get.textTheme.bodyMedium?.fontSize),
                )),
            Flexible(
                flex: 1,
                fit: FlexFit.tight,
                child: AutoSizeText(account.typeName!, maxLines: 1, textAlign: TextAlign.center)),
            Flexible(
                flex: 2,
                fit: FlexFit.tight,
                child: AutoSizeText(account.categoryName!, maxLines: 1, textAlign: TextAlign.center)),
            Flexible(
              flex: 2,
              fit: FlexFit.tight,
              child: AutoSizeText(
                '${moneyFormat.format(account.amount)}원',
                maxLines: 1,
                textAlign: TextAlign.center,
                style: TextStyle(color: account.type == 'income' ? Colors.red : Colors.blue),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void goToAccountDetailScreen() {
    log.d('goToAccountDetailScreen()');
    Get.toNamed(AppRoute.accountDetail, arguments: account, preventDuplicates: true);
  }
}
