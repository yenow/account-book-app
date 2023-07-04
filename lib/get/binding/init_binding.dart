
import 'package:account_book/get/controller/category_controller.dart';
import 'package:account_book/get/controller/screen/home_screen_controller.dart';
import 'package:account_book/get/controller/trade_controller.dart';
import 'package:get/get.dart';

import '../controller/page/calendar_page_controller.dart';
import '../controller/user_controller.dart';

class InitBinding implements Bindings {

  @override
  void dependencies() {
    Get.put(UserController(), permanent: true);
    Get.put(HomeScreenController(), permanent: true);
    Get.put(CalendarPageController(), permanent: true);
    Get.put(TradeController(), permanent: true);
    Get.put(CategoryController(), permanent: true);
  }
}