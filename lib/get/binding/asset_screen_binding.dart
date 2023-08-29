
import 'package:account_book/get/controller/screen/trade_screen_controller.dart';
import 'package:get/get.dart';

import '../controller/screen/asset_screen_controller.dart';

class AssetScreenBinding implements Bindings {

  @override
  void dependencies() {
    Get.put(AssetScreenController());
  }
}