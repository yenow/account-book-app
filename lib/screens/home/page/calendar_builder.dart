import 'package:account_book/common/colors.dart';
import 'package:account_book/data/model/trade.dart';
import 'package:account_book/utilities/function/convert.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:table_calendar/table_calendar.dart';

// 커스텀 캘린더
CalendarBuilders<dynamic> buildCalendarBuilders() {
  return const CalendarBuilders(
    defaultBuilder: defaultBuilder,
    outsideBuilder: outsiderBuilder,
    markerBuilder: markerBuilder,
    selectedBuilder: selectedBuilder,
    todayBuilder: defaultBuilder,
    dowBuilder: dowBuilder,

  );
}

Widget? dowBuilder(context, day) {
  final text = DateFormat.E().format(day);
  Color color = Colors.black;
  if (day.weekday == DateTime.sunday) {
    color = CommonColors.sundayColor;
  } else if (day.weekday == DateTime.saturday) {
    color = CommonColors.saturdayColor;
  }

  return Container(
    alignment: Alignment.center,
    child: Text(
      text,
      style: TextStyle(color: color),
    ),
  );
}

// 오늘 날짜
Widget? todayBuilder(BuildContext context, DateTime day, DateTime focusedDay) {
  return Center(
    child: Text(
      '${day.day}',
    ),
  );
}

// 기본 날짜
Widget? defaultBuilder(BuildContext context, DateTime day, DateTime focusedDay) {
  Color color = Colors.black;
  if (day.weekday == DateTime.sunday) {
    color = CommonColors.sundayColor;
  } else if (day.weekday == DateTime.saturday) {
    color = CommonColors.saturdayColor;
  }

  return Container(
    padding: dayEdgeInsets(),
    alignment: Alignment.topCenter,
    child: Text(
      '${day.day}',
      style: TextStyle(color: color),
    ),
  );
}

// 해당 월 제외
Widget? outsiderBuilder(BuildContext context, DateTime day, DateTime focusedDay) {
  return Container(
    padding: dayEdgeInsets(),
    alignment: Alignment.topCenter,
    child: Text('${day.day}', style: TextStyle(color: Colors.grey)),
  );
}

// 선택 날짜
Widget? selectedBuilder(BuildContext context, DateTime day, DateTime focusedDay) {
  return Container(
    width: double.infinity,
    height: double.infinity,
    padding: dayEdgeInsets(),
    color: CommonColors.purple1,
    alignment: Alignment.topCenter,
    child: Text('${day.day}'),
  );
}

Widget? markerBuilder(BuildContext context, DateTime day, events) {
  if (events.isNotEmpty) {
    int? income = 0;
    int? expense = 0;
    for (Trade trade in events) {
      if (trade.type == TradeType.income.name) {
        income = income! + trade.amount!;
      } else if (trade.type == 'expense') {
        expense = expense! + trade.amount!;
      }
    }

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        income != 0 ? buildIncomeMarker(income) : Container(),
        expense != 0 ? buildExpenseMarker(expense) : Container(),
      ],
    );
  }

  // events.
  return null;
}

Container buildIncomeMarker(int? amount) {
  return Container(
    padding: const EdgeInsets.fromLTRB(0, 25, 0, 0),
    alignment: Alignment.centerRight,
    child: AutoSizeText(
      numberFormat(amount!),
      maxLines: 1,
      overflow: TextOverflow.ellipsis,
      minFontSize: 6,
      maxFontSize: 10,
      style: TextStyle(fontSize: Get.textTheme.bodySmall!.fontSize, color: CommonColors.incomeColor),
    ),
  );
}

Container buildExpenseMarker(int? amount) {
  return Container(
    alignment: Alignment.centerRight,
    child: AutoSizeText(
      numberFormat(amount!),
      maxLines: 1,
      overflow: TextOverflow.ellipsis,
      minFontSize: 6,
      maxFontSize: 10,
      style: TextStyle(fontSize: Get.textTheme.bodySmall!.fontSize, color: CommonColors.expenseColor),
    ),
  );
}

EdgeInsets dayEdgeInsets() => const EdgeInsets.fromLTRB(0, 8, 0, 0);
