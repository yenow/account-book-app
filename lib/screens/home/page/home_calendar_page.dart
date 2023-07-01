import 'package:account_book/common/colors.dart';
import 'package:account_book/common/constant/intl.dart';
import 'package:account_book/constants.dart';
import 'package:account_book/data/model/trade.dart';
import 'package:account_book/get/controller/trade_controller.dart';
import 'package:account_book/get/controller/home_controller.dart';
import 'package:account_book/screens/home/component/account_history_row.dart';
import 'package:account_book/screens/home/page/calendar_builder.dart';
import 'package:account_book/utilities/function/convert.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:table_calendar/table_calendar.dart';

class HomeCalendarPage extends StatelessWidget {
  const HomeCalendarPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Obx(() => Text('${HomeController.to.selectedDay.value.month}월')),
        ),
        body: Obx(
          () => Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              buildTotal(),
              buildTableCalendar(),
              buildTradeHistory(),
              // , const SizedBox(height: 10), buildTransactionHistory()
            ],
          ),
        ));
  }

  Container buildTotal() {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 20),
      child: Row(
        children: [
          Flexible(
              flex: 1,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  const Text(
                    '총 수입',
                    style: TextStyle(color: CommonColors.incomeColor),
                  ),
                  AutoSizeText(
                    numberFormat(TradeController.to.calculateTotalIncome()),
                    maxLines: 1,
                  )
                ],
              )),
          Flexible(
              flex: 1,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  const Text('총 지출', style: TextStyle(color: CommonColors.expenseColor)),
                  AutoSizeText(numberFormat(TradeController.to.calculateTotalExpense()), maxLines: 1)
                ],
              ))
        ],
      ),
    );
  }

  /// 캘린더 영역
  Widget buildTableCalendar() {
    return TableCalendar(
      firstDay: HomeController.to.firstDay,
      lastDay: HomeController.to.lastDay,
      focusedDay: HomeController.to.focusedDay.value,
      rowHeight: 55,
      headerVisible: false,
      headerStyle: const HeaderStyle(
          formatButtonVisible: false, titleCentered: true, headerPadding: EdgeInsets.symmetric(vertical: 5)),
      calendarFormat: CalendarFormat.month,
      onPageChanged: HomeController.to.onPageChanged,
      onFormatChanged: HomeController.to.onFormatChanged,
      selectedDayPredicate: HomeController.to.selectedDayPredicate,
      onDaySelected: HomeController.to.onDaySelected,
      eventLoader: HomeController.to.eventLoader,
      calendarBuilders: buildCalendarBuilders(), // 캘린터 설정
    );
  }

  // 당일 거래 내역
  Expanded buildTradeHistory() {
    return Expanded(
      child: ListView(children: [
        // buildHeadRow(),
        for (Trade trade
            in TradeController.to.accountDateMap.value[dateFormat.format(HomeController.to.focusedDay.value)] ?? [])
          TradeHistoryRow(trade: trade,)
      ]),
    );
  }

  Container buildHeadRow() {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 10),
      decoration: const BoxDecoration(
          border: Border(
              top: BorderSide(width: 0.5, color: Colors.black45),
              bottom: BorderSide(width: 0.5, color: Colors.black45))),
      child: Row(
        children: const [
          Flexible(
              flex: 2,
              fit: FlexFit.tight,
              child: AutoSizeText(
                '날짜',
                maxLines: 1,
                textAlign: TextAlign.center,
                style: TextStyle(fontWeight: FontWeight.bold),
              )),
          Flexible(
              flex: 1,
              fit: FlexFit.tight,
              child: AutoSizeText(
                '타입',
                maxLines: 1,
                textAlign: TextAlign.center,
                style: TextStyle(fontWeight: FontWeight.bold),
              )),
          Flexible(
              flex: 2,
              fit: FlexFit.tight,
              child: AutoSizeText(
                '카테고리',
                maxLines: 1,
                textAlign: TextAlign.center,
                style: TextStyle(fontWeight: FontWeight.bold),
              )),
          Flexible(
              flex: 2,
              fit: FlexFit.tight,
              child: AutoSizeText(
                '금액',
                maxLines: 1,
                textAlign: TextAlign.center,
                style: TextStyle(fontWeight: FontWeight.bold),
              )),
        ],
      ),
    );
  }
}
