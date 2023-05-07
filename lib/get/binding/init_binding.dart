
import 'package:account_book/get/controller/account_category_controller.dart';
import 'package:account_book/get/controller/account_controller.dart';
import 'package:get/get.dart';

import '../controller/home_controller.dart';

class InitBinding implements Bindings {

  @override
  void dependencies() {
    Get.put(HomeController(), permanent: true);
    Get.put(AccountController(), permanent: true);
    Get.put(AccountCategoryController(), permanent: true);
  }
}