import 'package:account_book/common/constant/colors.dart';
import 'package:account_book/common/constant/format.dart';
import 'package:account_book/data/model/trade.dart';
import 'package:account_book/get/controller/trade_controller.dart';
import 'package:account_book/get/controller/page/calendar_page_controller.dart';
import 'package:account_book/screens/home/component/calendar_view.dart';
import 'package:account_book/screens/home/component/trade_history_row.dart';
import 'package:account_book/screens/home/component/calendar_builder.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:calendar_view/calendar_view.dart';
import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:table_calendar/table_calendar.dart';

import '../../../common/constant/size.dart';
import '../../../get/controller/screen/home_screen_controller.dart';
import '../../../utilities/function/converter.dart';

class CalendarPage extends StatefulWidget {
  const CalendarPage({Key? key}) : super(key: key);

  @override
  State<CalendarPage> createState() => _CalendarPageState();
}

class _CalendarPageState extends State<CalendarPage> with AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    super.build(context);

    return Scaffold(
        appBar: AppBar(
          title: const Text('가계부'),
        ),
        floatingActionButton: floatingActionButton(),
        body: Column(
          children: [
            Flexible(
              fit: FlexFit.loose,
              flex: 1,
              child: Obx(() => buildMonthIndicator()),
            ),
            Flexible(
              fit: FlexFit.loose,
              flex: 1,
              child: Obx(() => buildTotal()),
            ),
            Flexible(
              fit: FlexFit.tight,
              flex: 7,
              child: Obx(() => CalendarView(tradeListMap: TradeController.to.tradeListMap.value)),
            ),
            // const CalendarBuilder(),
            Flexible(
              fit: FlexFit.loose,
              flex: 3,
              child: Obx(() => buildTradeHistory()),
            ),
          ],
        ));
  }

  FloatingActionButton? floatingActionButton() {
    return FloatingActionButton(
      onPressed: () async {
        Trade trade = Trade(
          tradeDate: AppConverter.toDayString(CalendarPageController.to.selectedDay.value),
        );
        await CalendarPageController.to.goToTradeScreen(trade);
      },
      child: const Icon(
        Icons.edit,
      ),
    );
  }

  Widget buildMonthIndicator() {
    return Row(
      // mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Flexible(
          flex: 1,
          fit: FlexFit.tight,
          child: IconButton(
            icon: const Icon(FluentIcons.chevron_left_20_regular),
            onPressed: CalendarPageController.to.goToPreviousMonth,
            style: ButtonStyle(
              fixedSize: MaterialStateProperty.all(const Size(20, 20)),
              padding: MaterialStateProperty.all(EdgeInsets.zero),
            ),
          ),
        ),
        Flexible(
          flex: 1,
          fit: FlexFit.tight,
          child: Text(
            '${CalendarPageController.to.selectedDay.value.year}년 ${CalendarPageController.to.selectedDay.value.month}월',
            textAlign: TextAlign.center,
            style: Get.textTheme.bodyLarge,
          ),
        ),
        Flexible(
          flex: 1,
          fit: FlexFit.tight,
          child: IconButton(
            icon: const Icon(FluentIcons.chevron_right_20_regular),
            onPressed: CalendarPageController.to.goToNextMonth,
            style: ButtonStyle(
              fixedSize: MaterialStateProperty.all(const Size(20, 20)),
              padding: MaterialStateProperty.all(EdgeInsets.zero),
            ),
          ),
        ),
      ],
    );
  }

  Container buildTotal() {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 15),
      decoration: BoxDecoration(
        // color: Get.theme.colorScheme.tertiary,
        border: Border.all(
          width: 0.1,
          color: Get.theme.colorScheme.outline,
        ),
      ),
      child: Row(
        children: [
          Flexible(
              flex: 1,
              fit: FlexFit.tight,
              child: Container(
                decoration: BoxDecoration(
                  border: Border(
                    right: BorderSide(
                      width: 0.3,
                      color: Get.theme.colorScheme.outline,
                    ),
                  ),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    const Text(
                      '수입',
                      style: TextStyle(color: CommonColors.incomeColor),
                    ),
                    AutoSizeText(
                      '${AppConverter.numberFormat(TradeController.to.calculateTotalIncome())}원',
                      style: TextStyle(color: CommonColors.incomeColor, letterSpacing: CommonSize.letterSpacing),
                      textAlign: TextAlign.right,
                      maxLines: 1,
                    )
                  ],
                ),
              )),
          Flexible(
              flex: 1,
              fit: FlexFit.tight,
              child: Container(
                decoration: BoxDecoration(
                  border: Border(
                    right: BorderSide(
                      width: 0.3,
                      color: Get.theme.colorScheme.outline,
                    ),
                  ),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    const Text(
                      '지출',
                      style: TextStyle(color: CommonColors.expenseColor),
                    ),
                    AutoSizeText(
                      '${AppConverter.numberFormat(TradeController.to.calculateTotalExpense())}원',
                      style: TextStyle(color: CommonColors.expenseColor, letterSpacing: CommonSize.letterSpacing),
                      textAlign: TextAlign.right,
                      maxLines: 1,
                    )
                  ],
                ),
              )),
          Flexible(
              flex: 1,
              fit: FlexFit.tight,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text('합계', style: TextStyle(color: CommonColors.black, letterSpacing: CommonSize.letterSpacing)),
                  AutoSizeText(
                    '${AppConverter.numberFormat(TradeController.to.calculateTotalIncome() - TradeController.to.calculateTotalExpense())}원',
                    textAlign: TextAlign.right,
                    maxLines: 1,
                  )
                ],
              ))
        ],
      ),
    );
  }

  // /// 캘린더 영역
  // Widget buildTableCalendar() {
  //   return Container(
  //     key: CalendarPageController.to.globalKey,
  //     padding: const EdgeInsets.fromLTRB(0, 10, 0, 0),
  //     decoration: BoxDecoration(
  //       border: Border(
  //         bottom: BorderSide(
  //           width: 0.1,
  //           color: Get.theme.colorScheme.outline,
  //         ),
  //       ),
  //     ),
  //     child: TableCalendar(
  //       firstDay: CalendarPageController.to.firstDay,
  //       lastDay: CalendarPageController.to.lastDay,
  //       focusedDay: CalendarPageController.to.focusedDay.value,
  //       // currentDay: CalendarPageController.to.selectedDay.value,
  //       pageAnimationEnabled: false,
  //       rowHeight: 65,
  //       headerVisible: false,
  //       headerStyle: HeaderStyle(
  //         formatButtonVisible: false,
  //         leftChevronIcon: const Icon(FluentIcons.chevron_left_20_regular),
  //         rightChevronIcon: const Icon(FluentIcons.chevron_right_20_regular),
  //         titleCentered: true,
  //         headerPadding: const EdgeInsets.only(bottom: 10),
  //         titleTextStyle: TextStyle(fontSize: Get.textTheme.bodyLarge!.fontSize),
  //       ),
  //       calendarStyle: const CalendarStyle(
  //         canMarkersOverflow: false,
  //       ),
  //       calendarFormat: CalendarFormat.month,
  //       onPageChanged: CalendarPageController.to.onPageChanged,
  //       onFormatChanged: CalendarPageController.to.onFormatChanged,
  //       selectedDayPredicate: CalendarPageController.to.selectedDayPredicate,
  //       onDaySelected: CalendarPageController.to.onDaySelected,
  //       eventLoader: CalendarPageController.to.eventLoader,
  //       calendarBuilders: buildCalendarBuilders(), // 캘린터 설정
  //     ),
  //   );
  // }

  // 당일 거래 내역
  Widget buildTradeHistory() {
    return SingleChildScrollView(
      child: ListView(
        shrinkWrap: true,
        children: [
          for (Trade trade in TradeController.to.tradeListMap.value[AppConverter.toDayString(CalendarPageController.to.focusedDay.value)] ?? [])
            TradeHistoryRow(
              trade: trade,
            )
        ],
      ),
    );
  }

  Container buildHeadRow() {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 10),
      decoration: const BoxDecoration(
        border: Border(
          top: BorderSide(width: 0.5, color: Colors.black45),
          bottom: BorderSide(width: 0.5, color: Colors.black45),
        ),
      ),
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
