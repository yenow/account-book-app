import 'package:account_book/get/controller/account_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
// import 'package:syncfusion_flutter_datepicker/datepicker.dart';

class SearchPage extends StatelessWidget {
  const SearchPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
          appBar: AppBar(
            title: const Text('검색'),
            actions: const [],
          ),
          body: buildBody()),
    );
  }

  Widget buildBody() {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 5),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          Row(
            children: [
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 5),
                child: const Text('기간'),
              ),
              Expanded(
                child: SizedBox(
                  width: 30,
                  height: 30,
                  child: IconButton(
                    icon: const Icon(Icons.date_range),
                    onPressed: () async {
                      final DateTime? selected = await showDatePicker(
                        context: Get.context!,
                        initialDate: DateTime.now(),
                        firstDate: DateTime(1900),
                        lastDate: DateTime(2100),
                        initialEntryMode: DatePickerEntryMode.calendarOnly,
                      );
                      if (selected != null) {}
                    },
                  ),
                ),
              ),
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
          IconButton(
              onPressed: () {
                AccountController.to.initAccounts();
              },
              icon: Icon(Icons.ac_unit))
        ],
      ),
    );
  }
}
