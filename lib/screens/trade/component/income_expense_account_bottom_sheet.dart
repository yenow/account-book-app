import 'package:account_book/common/constant/size.dart';
import 'package:account_book/data/client/clients.dart';
import 'package:account_book/data/model/trade.dart';
import 'package:account_book/get/controller/account_controller.dart';
import 'package:account_book/route.dart';
import 'package:account_book/common/function/icon_converter.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../common/constant/colors.dart';
import '../../../common/log_config.dart';
import '../../../data/model/account.dart';
import '../../../get/controller/screen/trade_screen_controller.dart';

class IncomeExpenseAccountBottomSheet extends StatelessWidget {
  const IncomeExpenseAccountBottomSheet({super.key, required this.tradeType});

  final TradeType tradeType;

  // final List<Account> accounts;

  @override
  Widget build(BuildContext context) {
    return Obx(() =>
      Center(
        child: ConstrainedBox(
          constraints: BoxConstraints(
            maxWidth: (Get.width * 6) / 7,
            maxHeight: (Get.height * 3) / 4,
          ),
          child: Material(
            type: MaterialType.transparency,
            child: buildSingleChildScrollView(),
          ),
        ),
      ),
    );
  }

  SingleChildScrollView buildSingleChildScrollView() {
    return SingleChildScrollView(
      controller: TradesScreenController.to.scroll,
      child: Container(
        decoration: BoxDecoration(
          color: Get.theme.colorScheme.background,
          borderRadius: const BorderRadius.all(Radius.circular(15)),
        ),
        child: Column(
          children: [
            Container(
              alignment: Alignment.center,
              padding: const EdgeInsets.only(top: 20, bottom: 5),
              child: Text(
                '${tradeType.tradeTypeName} 리스트',
                style: TextStyle(
                  color: Get.theme.colorScheme.onBackground,
                  fontSize: Get.textTheme.titleSmall!.fontSize,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            GridView.builder(
              shrinkWrap: true,
              scrollDirection: Axis.vertical,
              controller: TradesScreenController.to.scroll,
              itemCount:
                  tradeType == TradeType.income ? AccountController.to.incomeAccounts.value.length + 1 : AccountController.to.expenseAccounts.value.length + 1,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3, // 1 개의 행에 보여줄 item 개수
                  childAspectRatio: 2 / 1, //item 의 가로 1, 세로 2 의 비율
                  mainAxisSpacing: 1,
                  crossAxisSpacing: 1),
              itemBuilder: (context, index) {
                // @formatter:off
                int length = tradeType == TradeType.income ? AccountController.to.incomeAccounts.value.length
                                                           : AccountController.to.expenseAccounts.value.length;
                final List<Account> accounts = tradeType == TradeType.income ? AccountController.to.incomeAccounts.value
                                                                             : AccountController.to.expenseAccounts.value;
                // @formatter:on

                if (index < length) {
                  return buildItem(accounts.elementAt(index), index);
                } else {
                  return buildAddItem();
                }
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget buildItem(Account account, int index) {
    return GestureDetector(
      onTap: () {
        Get.back(result: account, closeOverlays: false);
      },
      child: Container(
        alignment: Alignment.center,
        color: Get.theme.colorScheme.background,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              padding: const EdgeInsets.only(bottom: 5, right: 3),
              child: Icon(
                IconConverter.iconConverter(account.accountName!),
                color: CommonColors.typeColors.elementAt(index % CommonColors.typeColors.length),
              ),
            ),
            AutoSizeText(
              account.accountName!,
              maxLines: 1,
              style: TextStyle(
                // color: Get.theme.colorScheme.onBackground,
                color: CommonColors.typeColors.elementAt(index % CommonColors.typeColors.length),
                fontSize: Get.textTheme.bodyMedium!.fontSize,
              ),
            ),
          ],
        ),
      ),
    );
  }

  /// 추가
  Widget buildAddItem() {
    return GestureDetector(
      // onTap : 자산 설정 페이지로 이동
      onTap: () async {
        dlog.i('buildAddItem');
        dlog.i(tradeType);

        if (tradeType == TradeType.expense) {
          await Get.toNamed(AppRoute.expenseCategoryManagement);
          AccountController.to.incomeAccounts();
        } else if (tradeType == TradeType.income) {
          await Get.toNamed(AppRoute.incomeCategoryManagement);
          AccountController.to.incomeAccounts();
        } else {
          Get.snackbar('에러', '오류가 발생했습니다.');
        }
      },
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            alignment: Alignment.center,
            color: Get.theme.colorScheme.background,
            padding: const EdgeInsets.only(bottom: 5, right: 3),
            child: Icon(
              FluentIcons.add_circle_20_regular,
              color: Get.theme.colorScheme.onBackground,
            ),
          ),
          AutoSizeText(
            '추가',
            maxLines: 1,
            style: TextStyle(fontSize: Get.textTheme.bodyMedium!.fontSize, fontWeight: FontWeight.w400, color: Get.theme.colorScheme.onBackground),
          ),
        ],
      ),
    );
  }
}
