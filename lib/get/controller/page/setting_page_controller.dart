import 'package:account_book/get/controller/user_controller.dart';
import 'package:account_book/route.dart';
import 'package:get/get.dart';

import '../../../data/client/clients.dart';
import '../../../data/model/asset.dart';
import '../../../main.dart';

class SettingPageController extends GetxController {
  static SettingPageController get to => Get.find();

  Future<void> singOutGoogle() async {
    await googleSignIn.signOut();
    await UserController.to.logout();
    Get.toNamed(AppRoute.loginScreen);
  }
}