import 'package:account_book/common/constant/colors.dart';
import 'package:account_book/common/constant/format.dart';
import 'package:account_book/common/log_config.dart';
import 'package:account_book/route.dart';
import 'package:account_book/utilities/function/converter.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../data/model/trade.dart';

/// 가계부 내역 컴포넌트
class TradeHistoryRow extends StatelessWidget {
  const TradeHistoryRow({Key? key, required this.trade}) : super(key: key);
  final Trade trade;

  // 날짜 카테고리 금액
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: goToTradeScreen,
      splashColor: Get.theme.colorScheme.onPrimaryContainer,
      focusColor: Get.theme.colorScheme.onPrimaryContainer,
      hoverColor: Get.theme.colorScheme.onPrimaryContainer,
      highlightColor: Get.theme.colorScheme.onPrimaryContainer,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 10),
        // margin: const EdgeInsets.symmetric(horizontal: 10,),
        decoration: BoxDecoration(
          border: Border(
            bottom: BorderSide(width: 0.1, color: Get.theme.colorScheme.outline),
          ),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Flexible(
                flex: 2,
                fit: FlexFit.tight,
                child: AutoSizeText(
                  AppConverter.toDayDashString(AppConverter.toDateTime(trade.tradeDate!)),
                  maxLines: 1,
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: Get.textTheme.bodyMedium?.fontSize),
                )),
            Flexible(flex: 1, fit: FlexFit.tight, child: AutoSizeText(trade.typeName!, maxLines: 1, textAlign: TextAlign.center)),
            Flexible(flex: 2, fit: FlexFit.tight, child: AutoSizeText(trade.incomeOrExpenseAccountName!, maxLines: 1, textAlign: TextAlign.left)),
            Flexible(
              flex: 3,
              fit: FlexFit.tight,
              child: Padding(
                padding: const EdgeInsets.fromLTRB(0, 0, 5, 0),
                child: AutoSizeText(
                  '${moneyFormat.format(trade.amount)}원',
                  maxLines: 1,
                  textAlign: TextAlign.right,
                  style: TextStyle(color: trade.tradeType == TradeType.income.name ? CommonColors.incomeColor : CommonColors.expenseColor),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void goToTradeScreen() {
    Get.toNamed(AppRoute.tradeScreen, arguments: trade, preventDuplicates: true);
  }
}
