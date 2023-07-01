import 'package:account_book/common/navigationbar_enum.dart';
import 'package:account_book/constants.dart';
import 'package:account_book/data/model/trade.dart';
import 'package:account_book/get/controller/home_controller.dart';
import 'package:account_book/route.dart';
import 'package:account_book/screens/home/page/home_calendar_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import 'page/setting_page.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context, designSize: const Size(411,820));

    return Obx(() => SafeArea(
          child: buildScaffold(),
        ));
  }

  Scaffold buildScaffold() {
    log.i('height : ${Get.height}, width ${Get.width}');

    return Scaffold(
      body: PageView(
        controller: HomeController.to.pageController,
        children: const <Widget>[
          HomeCalendarPage(),
          Center(
            child: Text('list'),
          ),
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
    return HomeController.to.selectIndex.value == NavigationBarEnum.home.index
        ? FloatingActionButton(
            child: const Icon(
              Icons.edit,
            ),
            onPressed: goToSingleTradeRegisterScreen,
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
    return BottomNavigationBar(
      currentIndex: HomeController.to.selectIndex.value,
      onTap: HomeController.to.onTap,
      // showSelectedLabels: false,
      // showUnselectedLabels: false,
      // fixedColor: Colors.deepPurple,
      items: const <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: Icon(Icons.calendar_today),
          label: '홈',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.list_alt),
          label: '리스트',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.poll),
          label: '차트',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.list_alt),
          label: 'Chats',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.more_horiz),
          label: 'Chats',
        ),
      ],
      selectedItemColor: Colors.blueAccent,
    );
  }
}
