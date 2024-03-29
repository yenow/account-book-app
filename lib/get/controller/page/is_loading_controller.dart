import 'package:account_book/get/controller/user_controller.dart';
import 'package:get/get.dart';

import '../../../common/log_config.dart';
import '../../../data/model/asset.dart';
import '../../../main.dart';

class IsLoadingController extends GetxController {
  static IsLoadingController get to => Get.find();
  final isLoading = false.obs;

  void setIsLoading(bool value) {
    dlog.i('isLoading = $value');
    isLoading(value);
  }
}