import 'package:account_book/data/dto/account/account_request_dto.dart';
import 'package:account_book/get/controller/account_controller.dart';
import 'package:account_book/screens/asset/component/account_bottom_sheet.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../common/widget/bottom_sheet.dart';
import '../../../common/widget/dialog/dialog.dart';
import '../../../common/log_config.dart';
import '../../../data/client/clients.dart';
import '../../../data/dto/list_response.dart';
import '../../../data/model/account.dart';
import '../../../data/model/asset.dart';
import '../../../data/model/notify.dart';
import '../../../screens/trade/component/asset_bottom_sheet.dart';
import '../../../common/function/converter.dart';
import '../page/is_loading_controller.dart';

class NotifyScreenController extends GetxController {
  static NotifyScreenController get to => Get.find();
  final notifyList = Rx<List<Notify>>([]);
  final isLoading = true.obs;

  Future<void> findAllNotify() async {
    await notifyClient.findAll().then((value) {
      NotifyScreenController.to.notifyList(value.data);
      isLoading(false);
    });
  }
}
