
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/get.dart';

import '../../../data/model/user.dart';

class LoginScreenController extends GetxController {
  static LoginScreenController get to => Get.find();

  final user = User().obs;

  @override
  void onInit() async {
    super.onInit();
  }
}