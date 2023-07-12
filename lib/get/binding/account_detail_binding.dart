
import 'package:account_book/get/controller/screen/trade_screen_controller.dart';
import 'package:get/get.dart';

class TradeRegisterScreenBinding implements Bindings {

  @override
  void dependencies() {
    Get.put(TradesScreenController());
  }
}