import 'package:account_book/common/constant/colors.dart';
import 'package:account_book/common/constant/intl.dart';
import 'package:account_book/constants.dart';
import 'package:account_book/route.dart';
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
                  trade.tradeDate!,
                  maxLines: 1,
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: Get.textTheme.bodyMedium?.fontSize),
                )),
            Flexible(
                flex: 1,
                fit: FlexFit.tight,
                child: AutoSizeText(trade.typeName!, maxLines: 1, textAlign: TextAlign.center)),
            Flexible(
                flex: 2,
                fit: FlexFit.tight,
                child: AutoSizeText(trade.categoryName!, maxLines: 1, textAlign: TextAlign.left)),
            Flexible(
              flex: 2,
              fit: FlexFit.tight,
              child: AutoSizeText(
                '${moneyFormat.format(trade.amount)}원',
                maxLines: 1,
                textAlign: TextAlign.right,
                style: TextStyle(color: trade.type == TradeType.income.name ? CommonColors.incomeColor : CommonColors.expenseColor),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void goToAccountDetailScreen() {
    log.d('goToAccountDetailScreen()');
    Get.toNamed(AppRoute.singleTradeRegisterScreen, arguments: trade, preventDuplicates: true);
  }
}
