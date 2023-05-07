import 'package:account_book/common/navigationbar_enum.dart';
import 'package:account_book/constants.dart';
import 'package:account_book/data/model/account.dart';
import 'package:account_book/get/controller/home_controller.dart';
import 'package:account_book/route.dart';
import 'package:account_book/screens/home/page/home_calendar_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'page/setting_page.dart';

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
        controller: HomeController.to.pageController,
        children: const <Widget>[
          HomeCalendarPage(),
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
            onPressed: goToSaveAccountPage,
          )
        : null;
  }

  void goToSaveAccountPage() {
    log.d('goToAccountDetailScreen()');
    Get.toNamed(AppRoute.accountDetail, arguments: Account(), preventDuplicates: true);
  }

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
