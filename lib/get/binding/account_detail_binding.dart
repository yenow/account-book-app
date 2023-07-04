
import 'package:account_book/get/controller/page/trade_list_page_controller.dart';
import 'package:get/get.dart';

class AccountDetailBinding implements Bindings {

  @override
  void dependencies() {
    Get.put(TradesPageController());
  }
}