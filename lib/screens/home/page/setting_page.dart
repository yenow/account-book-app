import 'package:account_book/route.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../component/setting_row.dart';

class SettingPage extends StatelessWidget {
  const SettingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("설정"),
      ),
      body: buildBody(),
    );
  }

  Container buildBody() {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 0),
      child: ListView(
        children: [
          Center(
            child: Text('기본', style: Get.textTheme.titleSmall),
          ),
          Container(
            margin: const EdgeInsets.symmetric(vertical: 10),
            decoration: BoxDecoration(
              // border: Border.all(
              //   width: 1,
              //   color: Get.theme.colorScheme.outline,
              // ),
              color: Get.theme.colorScheme.surface,
            ),
            child: ListView(shrinkWrap: true, children: [
              SettingRow(
                text: '택스트',
                icon: const Icon(Icons.add_circle_outline),
                onTap: () {},
              ),
              SettingRow(
                text: '택스트',
                icon: const Icon(Icons.add_circle_outline),
                onTap: () {},
              ),
            ]),
          ),
          Center(
            child: Text('분류/자산', style: Get.textTheme.titleSmall),
          ),
        ],
      ),
    );
  }
}
