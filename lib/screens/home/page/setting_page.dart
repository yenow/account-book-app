import 'package:account_book/route.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

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
      padding: EdgeInsets.symmetric(vertical: 10, horizontal: 0),
      child: ListView(
        children: [
          Center(
              child: Text(
            '기본',
            style: TextStyle(fontSize: Get.textTheme.titleLarge?.fontSize),
          )),
          Container(
            margin: EdgeInsets.symmetric(vertical: 10),
            decoration: BoxDecoration(border: Border.all(width: 1, color: Colors.grey), color: Colors.grey.shade200),
            child: ListView(shrinkWrap: true, children: [
              buildSettingRow(
                  onTap: () {},
                  text: '공지사항',
                  icon: Icon(
                    Icons.notifications,
                    color: Colors.grey,
                  )),
              buildSettingRow(
                onTap: () {},
                text: '도움말',
                icon: Icon(
                  Icons.help,
                  color: Colors.grey,
                ),
              ),
            ]),
          ),
          Center(
              child: Text(
            '카테고리/자산',
            style: TextStyle(fontSize: Get.textTheme.titleLarge?.fontSize),
          )),
          Container(
            margin: EdgeInsets.symmetric(vertical: 10),
            decoration: BoxDecoration(border: Border.all(width: 1, color: Colors.grey), color: Colors.grey.shade200),
            child: ListView(shrinkWrap: true, children: [
              buildSettingRow(
                onTap: () {
                  Get.toNamed(AppRoute.incomeCategoryManagement);
                },
                text: '수입 카테고리 관리',
                icon: Icon(
                  Icons.category,
                  color: Colors.grey,
                ),
              ),
              buildSettingRow(
                onTap: () {
                  Get.toNamed(AppRoute.expenseCategoryManagement);
                },
                text: '지출 카테고리 관리',
                icon: Icon(
                  Icons.category,
                  color: Colors.grey,
                ),
              ),
            ]),
          ),
        ],
      ),
    );
  }

  GestureDetector buildSettingRow({void Function()? onTap, required Icon icon, required String text}) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          mainAxisSize: MainAxisSize.max,
          textBaseline: TextBaseline.ideographic,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(width: 10),
            icon,
            SizedBox(width: 10),
            Text(text, style: TextStyle(fontSize: Get.textTheme.titleSmall?.fontSize),)
          ],
        ),
      ),
    );
  }
}
