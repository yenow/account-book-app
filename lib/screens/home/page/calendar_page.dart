import 'package:account_book/common/constant/colors.dart';
import 'package:account_book/common/constant/intl.dart';
import 'package:account_book/constants.dart';
import 'package:account_book/data/model/trade.dart';
import 'package:account_book/get/controller/trade_controller.dart';
import 'package:account_book/get/controller/page/calendar_page_controller.dart';
import 'package:account_book/screens/home/component/trade_history_row.dart';
import 'package:account_book/screens/home/component/calendar_builder.dart';
import 'package:account_book/utilities/function/convert.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:table_calendar/table_calendar.dart';

class CalendarPage extends StatelessWidget {
  const CalendarPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('가계부'),
      ),
      body: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          Obx(() => buildHeader()),
          Obx(() => buildTotal()),
          Obx(() => buildTableCalendar()),
          Obx(() => buildTradeHistory()),
          // , const SizedBox(height: 10), buildTransactionHistory()
        ],
      ),
    );
  }

  Widget buildHeader() {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Flexible(
            flex: 1,
            child: Align(
              alignment: Alignment.center,
              child: Icon(CupertinoIcons.left_chevron, size: 15)  // Icons.chevron_left
            )
          ),
          Flexible(
            flex: 1,
            child: Text('${CalendarPageController.to.selectedDay.value.year}년 ${CalendarPageController.to.selectedDay.value.month}월', style: Get.textTheme.bodyLarge,)
          ),
          const Flexible(
            flex: 1,
            child: Align(
                alignment: Alignment.center,
                child: Icon(CupertinoIcons.right_chevron, size: 15)
            )
          ),
        ],
      ),
    );
  }

  Container buildTotal() {
    return Container(
      padding: const EdgeInsets.fromLTRB(0, 0, 0, 20),
      child: Row(
        children: [
          Flexible(
              flex: 1,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  const Text('수입', style: TextStyle(color: CommonColors.incomeColor),),
                  AutoSizeText(numberFormat(TradeController.to.calculateTotalIncome()), maxLines: 1,)
                ],
              )),
          Flexible(
              flex: 1,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  const Text('지출', style: TextStyle(color: CommonColors.expenseColor)),
                  AutoSizeText(numberFormat(TradeController.to.calculateTotalExpense()), maxLines: 1)
                ],
              )),
          Flexible(
              flex: 1,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  const Text('합계', style: TextStyle(color: CommonColors.black)),
                  AutoSizeText(numberFormat(TradeController.to.calculateTotalIncome()-TradeController.to.calculateTotalExpense()), maxLines: 1)
                ],
              ))
        ],
      ),
    );
  }

  /// 캘린더 영역
  Widget buildTableCalendar() {
    return TableCalendar(
      firstDay: CalendarPageController.to.firstDay,
      lastDay: CalendarPageController.to.lastDay,
      focusedDay: CalendarPageController.to.focusedDay.value,
      rowHeight: 60,
      headerVisible: false,
      headerStyle: const HeaderStyle(
          formatButtonVisible: false, titleCentered: true, headerPadding: EdgeInsets.symmetric(vertical: 5)),
      calendarStyle: const CalendarStyle(
        canMarkersOverflow: false,
      ),
      calendarFormat: CalendarFormat.month,
      onPageChanged: CalendarPageController.to.onPageChanged,
      onFormatChanged: CalendarPageController.to.onFormatChanged,
      selectedDayPredicate: CalendarPageController.to.selectedDayPredicate,
      onDaySelected: CalendarPageController.to.onDaySelected,
      eventLoader: CalendarPageController.to.eventLoader,
      calendarBuilders: buildCalendarBuilders(), // 캘린터 설정
    );
  }

  // 당일 거래 내역
  Expanded buildTradeHistory() {
    return Expanded(
      child: ListView(children: [
        // buildHeadRow(),
        for (Trade trade
            in TradeController.to.accountDateMap.value[dateFormat.format(CalendarPageController.to.focusedDay.value)] ??
                [])
          TradeHistoryRow(
            trade: trade,
          )
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
