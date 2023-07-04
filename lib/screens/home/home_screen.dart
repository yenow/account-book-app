import 'package:account_book/common/constant/colors.dart';
import 'package:account_book/common/constant/size.dart';
import 'package:account_book/common/navigationbar_enum.dart';
import 'package:account_book/constants.dart';
import 'package:account_book/data/model/trade.dart';
import 'package:account_book/get/controller/screen/home_screen_controller.dart';
import 'package:account_book/get/controller/page/calendar_page_controller.dart';
import 'package:account_book/route.dart';
import 'package:account_book/screens/home/page/calendar_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import 'page/setting_page.dart';
import 'page/trade_list_page.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(() => SafeArea(
          child: buildScaffold(),
        ));
  }

  Scaffold buildScaffold() {

    return Scaffold(
      body: PageView(
        onPageChanged: HomeScreenController.to.onPageChanged,
        controller: HomeScreenController.to.pageController,
        children: const <Widget>[
          CalendarPage(),
          TradeListPage(),
          Center(
            child: Text('Second Page'),
          ),
          Center(
            child: Text('Third Page'),
          ),
          SettingPage(),
        ],
      ),
      floatingActionButton: floatingActionButton(),
      bottomNavigationBar: buildNavigationBar(),
    );
  }

  FloatingActionButton? floatingActionButton() {
    return HomeScreenController.to.selectIndex.value == NavigationBarEnum.home.index
        ? FloatingActionButton(
            onPressed: goToSingleTradeRegisterScreen,
            child: const Icon(
              Icons.edit,
            ),
          )
        : null;
  }

  /// 가계부 등록 페이지로 이동
  void goToSingleTradeRegisterScreen() {
    log.d('goToAccountDetailScreen()');
    Get.toNamed(AppRoute.singleTradeRegisterScreen, arguments: Trade(), preventDuplicates: true);
  }

  /// 네비게이션바
  Widget buildNavigationBar() {
    return SizedBox(
      // height: Get.height / 15 < 55 ? 55 : Get.height / 15,
      height: CommonSize.bottomNavigationHeight,
      child: BottomNavigationBar(
        currentIndex: HomeScreenController.to.selectIndex.value,
        onTap: HomeScreenController.to.onTap,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Padding(
              padding: EdgeInsets.all(2),
              child: Icon(Icons.calendar_today),
            ),
            label: '홈',
          ),
          BottomNavigationBarItem(
            icon: Padding(
              padding: EdgeInsets.all(2),
              child: Icon(Icons.find_in_page),
            ),
            label: '리스트',
          ),
          BottomNavigationBarItem(
            icon: Padding(
              padding: EdgeInsets.all(2),
              child: Icon(Icons.poll),
            ),
            label: '차트',
          ),
          BottomNavigationBarItem(
            icon: Padding(
              padding: EdgeInsets.all(2),
              child: Icon(Icons.list_alt),
            ),
            label: 'Chats',
          ),
          BottomNavigationBarItem(
            icon: Padding(
              padding: EdgeInsets.all(2),
              child: Icon(Icons.more_horiz),
            ),
            label: 'Chats',
          ),
        ],
      ),
    );
  }
}
