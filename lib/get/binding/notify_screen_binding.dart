import 'package:account_book/get/controller/screen/notify_screen_controller.dart';
import 'package:account_book/get/controller/screen/trade_screen_controller.dart';
import 'package:get/get.dart';

import '../../data/client/clients.dart';
import '../../data/dto/list_response.dart';
import '../../data/model/notify.dart';
import '../controller/screen/asset_screen_controller.dart';

class NotifyScreenBinding implements Bindings {
  @override
  void dependencies() async {
    Get.put(NotifyScreenController());
    NotifyScreenController.to.findAllNotify();
  }
}
