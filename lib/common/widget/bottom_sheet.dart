
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../data/model/account.dart';
import '../../get/controller/account_controller.dart';
import '../../screens/asset/component/account_bottom_sheet.dart';

Future<Account?> bottomSheet(Widget wiget) {
  return Get.bottomSheet(
    wiget,
    elevation: 2,
    backgroundColor: Get.theme.colorScheme.background,
    enterBottomSheetDuration: const Duration(microseconds: 1000),
    exitBottomSheetDuration: const Duration(microseconds: 1000),
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(
        top: Radius.circular(15),
      ),
    ),
  );
}