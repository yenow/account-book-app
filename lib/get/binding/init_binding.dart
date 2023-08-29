
import 'package:account_book/get/controller/account_controller.dart';
import 'package:account_book/get/controller/page/asset_page_controller.dart';
import 'package:account_book/get/controller/page/chart_page_controller.dart';
import 'package:account_book/get/controller/page/setting_page_controller.dart';
import 'package:account_book/get/controller/screen/home_screen_controller.dart';
import 'package:account_book/get/controller/screen/login_screen_controller.dart';
import 'package:account_book/get/controller/trade_controller.dart';
import 'package:get/get.dart';

import '../controller/page/calendar_page_controller.dart';
import '../controller/page/is_loading_controller.dart';
import '../controller/page/trade_list_page_controller.dart';
import '../controller/user_controller.dart';

class InitBinding implements Bindings {

  @override
  void dependencies() {
    Get.put(HomeScreenController(), permanent: true);
    Get.put(LoginScreenController(), permanent: true);

    // model
    Get.put(UserController(), permanent: true);
    Get.put(TradeController(), permanent: true);
    Get.put(AccountController(), permanent: true);

    // page
    Get.put(CalendarPageController(), permanent: true);
    Get.put(ChartPageController(), permanent: true);
    Get.put(TabBarListController(), permanent: true);
    Get.put(AssetPageController(), permanent: true);
    Get.put(SettingPageController(), permanent: true);
    Get.put(IsLoadingController(), permanent: true);
  }
}