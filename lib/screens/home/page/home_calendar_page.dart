import 'package:account_book/common/constant/intl.dart';
import 'package:account_book/data/model/account.dart';
import 'package:account_book/get/controller/account_controller.dart';
import 'package:account_book/get/controller/home_controller.dart';
import 'package:account_book/screens/home/component/account_history_row.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:table_calendar/table_calendar.dart';

class HomeCalendarPage extends StatelessWidget {
  const HomeCalendarPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Scaffold(
        appBar: AppBar(
          title: const Text("홈"),
        ),
        body: Column(
          children: [buildTableCalendar(), const SizedBox(height: 10), buildTransactionHistory()],
        ),
      ),
    );
  }

  Widget buildTableCalendar() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: TableCalendar(
        firstDay: HomeController.to.firstDay,
        lastDay: HomeController.to.lastDay,
        focusedDay: HomeController.to.focusedDay.value,
        calendarStyle: const CalendarStyle(
          isTodayHighlighted: false,
          // todayDecoration: BoxDecoration(
          //   color: Colors.white
          // ),
          // todayTextStyle: TextStyle(
          //   color: Colors.black
          // )
        ),
        headerStyle: const HeaderStyle(formatButtonVisible: false, titleCentered: true),
        calendarFormat: CalendarFormat.month,
        onFormatChanged: HomeController.to.onFormatChanged,
        selectedDayPredicate: HomeController.to.selectedDayPredicate,
        onDaySelected: HomeController.to.onDaySelected,
        eventLoader: HomeController.to.eventLoader,
        calendarBuilders: buildCalendarBuilders(),
      ),
    );
  }

  CalendarBuilders<dynamic> buildCalendarBuilders() {
    return CalendarBuilders(
      // defaultBuilder: (context, day, focusedDay) {
        // return Container(
        //   height: 100,
        //     child: Text('${day.day}'));
      // },
      markerBuilder: (context, day, events) {
        if (events.isNotEmpty) {
          bool isIncome = false;
          bool isExpense = false;
          for (Account account in events) {
            if (account.type == 'income') {
              isIncome = true;
            } else if (account.type == 'expense') {
              isExpense = true;
            }
          }

          return Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              isIncome ? buildIncomeMarker() : Container(),
              isExpense ? buildExpenseMarker() : Container(),
            ],
          );
        }

        // events.
        return null;
      },
      // selectedBuilder: (context, day, focusedDay) {
      //   return Container(
      //     width: double.infinity,
      //     height: double.infinity,
      //     margin: const EdgeInsets.symmetric(vertical: 5,horizontal: 5),
      //     color: const Color.fromARGB(77, 144, 202, 249),
      //     alignment: Alignment.center,
      //     child: Text('${day.day}'),
      //   );
      // },
      headerTitleBuilder: (context, day) {
        return Text(yyyyMM.format(day), textAlign: TextAlign.center,);
      },
      dowBuilder: (context, day) {
        if (day.weekday == DateTime.sunday) {
          final text = DateFormat.E().format(day);

          return Center(
            child: Text(
              text,
              style: TextStyle(color: Colors.red),
            ),
          );
        } else if (day.weekday == DateTime.saturday) {
          final text = DateFormat.E().format(day);

          return Center(
            child: Text(
              text,
              style: TextStyle(color: Colors.blue),
            ),
          );
        }
      },
    );
  }

  Container buildIncomeMarker() {
    return Container(
      height: 8,
      width: 8,
      decoration: ShapeDecoration(
        shape: CircleBorder(
          eccentricity: 1,
          // side: BorderSide(style: BorderStyle.solid)
        ),
        color: Colors.red,
      ),
      // margin: EdgeInsets.all(10),
    );
  }

  Container buildExpenseMarker() {
    return Container(
      height: 8,
      width: 8,
      decoration: ShapeDecoration(
        shape: CircleBorder(
          eccentricity: 1,
          // side: BorderSide(style: BorderStyle.solid)
        ),
        color: Colors.blue,
      ),
      // margin: EdgeInsets.all(10),
    );
  }

  Expanded buildTransactionHistory() {
    return Expanded(
      child: ListView(children: [
        buildHeadRow(),
        for (Account account
            in AccountController.to.accountDateMap.value[dateFormat.format(HomeController.to.focusedDay.value)] ?? [])
          AccountHistoryRow(
            account: account,
          )
      ]),
    );
  }

  Container buildHeadRow() {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 10),
      decoration: const BoxDecoration(
        border: Border(
          top: BorderSide(width: 0.5,color: Colors.black45),
          bottom: BorderSide(width: 0.5,color: Colors.black45)
        )
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
