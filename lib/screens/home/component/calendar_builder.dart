import 'package:account_book/common/constant/colors.dart';
import 'package:account_book/common/constant/fontsize.dart';
import 'package:account_book/common/constant/size.dart';
import 'package:account_book/data/model/trade.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:table_calendar/table_calendar.dart';

import '../../../utilities/function/converter.dart';

// 커스텀 캘린더
CalendarBuilders<dynamic> buildCalendarBuilders() {
  return const CalendarBuilders(
    defaultBuilder: defaultBuilder,
    outsideBuilder: outsiderBuilder,
    markerBuilder: markerBuilder,
    selectedBuilder: selectedBuilder,
    todayBuilder: defaultBuilder,
    dowBuilder: dowBuilder,
    // headerTitleBuilder: headerTitleBuilder,
  );
}

// 요일
Widget? dowBuilder(context, day) {
  final text = DateFormat.E().format(day);
  Color color = Get.theme.colorScheme.onBackground;
  if (day.weekday == DateTime.sunday) {
    color = CommonColors.sundayColor;
  } else if (day.weekday == DateTime.saturday) {
    color = CommonColors.saturdayColor;
  }

  return Text(
    text,
    textAlign: TextAlign.center,
    style: TextStyle(color: color, fontSize: Get.textTheme.bodyMedium!.fontSize),
  );
}

String getDowText(day) {
  switch (day.weekday) {
    case DateTime.sunday:
      return '일';
    case DateTime.saturday:
      return '토';
    case DateTime.friday:
      return '금';
    case DateTime.thursday:
      return '목';
    case DateTime.wednesday:
      return '수';
    case DateTime.tuesday:
      return '화';
    case DateTime.monday:
      return '월';
  }
  return '';
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
  Color color = Get.theme.colorScheme.onBackground;
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
      style: TextStyle(color: color, fontSize: Get.textTheme.bodyMedium!.fontSize),
    ),
  );
}

// 해당 월 제외
Widget? outsiderBuilder(BuildContext context, DateTime day, DateTime focusedDay) {
  return Container(
    padding: dayEdgeInsets(),
    alignment: Alignment.topCenter,
    child: Text('${day.day}', style: const TextStyle(color: Colors.grey)),
  );
}

// 선택 날짜
Widget? selectedBuilder(BuildContext context, DateTime day, DateTime focusedDay) {
  return Container(
    width: double.infinity,
    height: double.infinity,
    padding: dayEdgeInsets(),
    color: Get.theme.colorScheme.onPrimaryContainer,
    alignment: Alignment.topCenter,
    child: Text('${day.day}'),
  );
}

// 마커
Widget? markerBuilder(BuildContext context, DateTime day, events) {
  if (events.isNotEmpty) {
    int income = 0;
    int expense = 0;
    int transfer = 0;
    for (Trade trade in events) {
      if (trade.tradeType == TradeType.income.name) {
        income = income + trade.amount!;
      } else if (trade.tradeType == 'expense') {
        expense = expense + trade.amount!;
      } else if (trade.tradeType == 'transfer') {
        transfer = transfer + trade.amount!;
      }
    }

    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        income == 0 ? Container(height: 10) : buildTradeMarker(income, CommonColors.incomeColor),
        expense == 0 ? Container(height: 10) : buildTradeMarker(expense, CommonColors.expenseColor),
        transfer == 0 ? Container(height: 10) : buildTradeMarker(transfer, CommonColors.transferColor),
        const SizedBox(height: 3,)
      ],
    );
  }

  // events.
  return null;
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

// Container buildExpenseMarker(int? amount) {
//   return Container(
//     alignment: Alignment.centerRight,
//     child: AutoSizeText(
//       numberFormat(amount!),
//       maxLines: 1,
//       overflow: TextOverflow.ellipsis,
//       minFontSize: 6,
//       maxFontSize: 10,
//       style: TextStyle(fontSize: Get.textTheme.bodySmall!.fontSize, color: CommonColors.expenseColor),
//     ),
//   );
// }

// title
Widget? headerTitleBuilder(context, day) {
  return Container();
}

EdgeInsets dayEdgeInsets() => const EdgeInsets.fromLTRB(0, 10, 0, 0);
