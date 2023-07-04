
import 'package:flutter/material.dart';
import 'package:get/get.dart';
// import 'package:syncfusion_flutter_datepicker/datepicker.dart';

class TradeListPage extends StatelessWidget {
  const TradeListPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('검색'),
          actions: const [],
        ),
        body: buildBody());
  }

  Column buildBody() {
    return Column(
      mainAxisSize: MainAxisSize.max,
      children: [
        Row(
          children: [
            Text('기간'),
            IconButton(
              icon: const Icon(Icons.date_range),
              onPressed: () async {

                final DateTime? selected = await showDatePicker(
                  context: Get.context!,
                  initialDate: DateTime.now(),
                  firstDate: DateTime(1900),
                  lastDate: DateTime(2100),
                  initialEntryMode: DatePickerEntryMode.calendarOnly,

                );
                if (selected != null) {

                }
              },
            )
          ],
        ),
        Row(
          children: [
            Text('카테고리'),
          ],
        ),
        Row(
          children: [
            Text('지불방식'),
          ],
        ),
      ],
    );
  }
}
