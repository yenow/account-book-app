
import 'package:account_book/get/controller/account_detail_controller.dart';
import 'package:get/get.dart';

class AccountDetailBinding implements Bindings {

  @override
  void dependencies() {
    Get.put(AccountDetailController());
  }
}