import 'package:account_book/common/theme/theme.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:calendar_view/calendar_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../common/constant/colors.dart';
import '../../../common/constant/size.dart';
import '../../../common/log_config.dart';
import '../../../data/model/trade.dart';
import '../../../get/controller/page/calendar_page_controller.dart';
import '../../../get/controller/trade_controller.dart';
import '../../../main.dart';
import '../../../utilities/function/converter.dart';

class CalendarView extends StatelessWidget {
  const CalendarView({super.key, required this.tradeListMap});

  final Map<String, List<Trade>> tradeListMap;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(
            color: Get.theme.colorScheme.outline,
            width: 0.1,
          )
        )
      ),
      child: MonthView<Trade>(
        key: CalendarPageController.to.monthViewState,
        controller: eventController,
        showBorder: false,
        cellAspectRatio: 1 / 1,
        pageTransitionCurve: Curves.easeOutQuad,
        useAvailableVerticalSpace: true,
        pageTransitionDuration: const Duration(seconds: 1),
        initialMonth: DateTime.now(),
        minMonth: CalendarPageController.to.firstDay,
        maxMonth: CalendarPageController.to.lastDay,
        onCellTap: onCellTap,
        onPageChange: onPageChange,
        cellBuilder: cellBuilder,
        weekDayBuilder: weekDayBuilder,
        headerBuilder: headerBuilder,
      ),
    );
  }

  Widget headerBuilder(date) {
        return Container();
      }

  void onPageChange(date, page) {
        CalendarPageController.to.onPageChanged(date);
      }

  void onCellTap(events, date) {
        CalendarPageController.to.changeFocusDay(date);
      }

  Widget cellBuilder(DateTime date, List<CalendarEventData<Trade>> events, bool isToday, bool isInMonth) {
    // Color backgroundColor = CalendarPageController.to.focusedDay.value == date ? Get.theme.colorScheme.onPrimaryContainer : Get.theme.colorScheme.background;

    // Map<String, List<Trade>> list = TradeController.to.tradeListMap.value;
    List<Trade> tradeList = tradeListMap[AppConverter.toDayString(date)] ?? [];
    int income = 0;
    int expense = 0;
    int transfer = 0;
    for (Trade trade in tradeList) {
      if (trade.tradeType == TradeType.income.name) {
        income = income + trade.amount!;
      } else if (trade.tradeType == 'expense') {
        expense = expense + trade.amount!;
      } else if (trade.tradeType == 'transfer') {
        transfer = transfer + trade.amount!;
      }
    }

    return Obx(
      () => ConstrainedBox(
        constraints: const BoxConstraints(
          minHeight: 50,
        ),
        child: Container(
          width: double.infinity,
          height: double.infinity,
          padding: const EdgeInsets.fromLTRB(0, 5, 0, 0),
          color: cellBackgroundColor(date, isInMonth),
          alignment: Alignment.topCenter,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Text(
                '${date.day}',
                style: TextStyle(color: cellTextColor(date, isInMonth), fontSize: Get.textTheme.bodySmall!.fontSize),
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  income == 0 ? Container(height: 10) : buildTradeMarker(income, CommonColors.incomeColor),
                  expense == 0 ? Container(height: 10) : buildTradeMarker(expense, CommonColors.expenseColor),
                  transfer == 0 ? Container(height: 10) : buildTradeMarker(transfer, CommonColors.transferColor),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  Color cellBackgroundColor(DateTime date, bool isInMonth) {
    Color color = Get.theme.colorScheme.background;
    // isInMonth
    if (!isInMonth) {
      color = Get.theme.colorScheme.tertiary;
    }
    if (CalendarPageController.to.focusedDay.value.year == date.year &&
        CalendarPageController.to.focusedDay.value.month == date.month &&
        CalendarPageController.to.focusedDay.value.day == date.day) {
      color = Get.theme.colorScheme.onPrimaryContainer;
    }

    return color;
  }

  /// 날짜 텍스트 색상
  Color cellTextColor(DateTime date, bool isInMonth) {
    Color color = Get.theme.colorScheme.onBackground;
    if (date.weekday == 7) color = CommonColors.saturdayColor;
    if (date.weekday == 1) color = CommonColors.sundayColor;

    // isInMonth
    if (!isInMonth) {
      color = Get.theme.colorScheme.outline;
    }

    return color;
  }

  /// 요일 형식
  Widget weekDayBuilder(int index) {
    Color color = Get.theme.colorScheme.onBackground;
    if (index == 6) color = CommonColors.saturdayColor;
    if (index == 0) color = CommonColors.sundayColor;

    return Container(
      padding: const EdgeInsets.symmetric(vertical: 10),
      alignment: Alignment.center,
      // decoration: BoxDecoration(border: Border(right: BorderSide(color: Get.theme.colorScheme.outline, width: 0.1))),
      child: Text(
        AppConverter.convertWeekDay(index),
        style: TextStyle(fontSize: Get.textTheme.bodyMedium!.fontSize, color: color),
      ),
    );
  }
}

Container buildTradeMarker(int amount, Color? color) {
  return Container(
    height: 10,
    // margin: margin,
    alignment: Alignment.centerRight,
    child: AutoSizeText(
      AppConverter.numberFormat(amount),
      maxLines: 1,
      overflow: TextOverflow.ellipsis,
      minFontSize: 6,
      maxFontSize: 10,
      style: TextStyle(fontSize: Get.textTheme.bodySmall!.fontSize, color: color, letterSpacing: CommonSize.letterSpacing),
    ),
  );
}
