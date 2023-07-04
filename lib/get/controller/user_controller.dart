import 'package:get/get.dart';

import '../../data/model/user.dart';

class UserController extends GetxController {
  static UserController get to => Get.find();
  final user = User(userId: 3, userKey: "userKey").obs;

}