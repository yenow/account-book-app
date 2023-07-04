
import 'package:account_book/get/controller/page/trade_list_page_controller.dart';
import 'package:account_book/get/controller/screen/login_screen_controller.dart';
import 'package:get/get.dart';

class LoginBinding implements Bindings {

  @override
  void dependencies() {
    Get.put(LoginScreenController(), permanent: true);
  }
}