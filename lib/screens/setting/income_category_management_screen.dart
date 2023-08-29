import 'package:account_book/data/client/clients.dart';
import 'package:account_book/get/controller/account_controller.dart';
import 'package:account_book/screens/setting/widget/account_management_row.dart';
import 'package:account_book/utilities/function/icon_converter.dart';
import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../common/widget/dialog/dialog.dart';
import '../../data/model/asset.dart';
import '../../route.dart';

class IncomeCategoryManagementScreen extends StatelessWidget {
  IncomeCategoryManagementScreen({Key? key}) : super(key: key);
  final ScrollController _scrollController =  ScrollController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(child: buildScaffold());
  }

  Scaffold buildScaffold() {
    return Scaffold(
      appBar: AppBar(
        title: const Text("수입 관리"),
        actions: [buildAssetAddButton()],
      ),
      body: Obx(
        () => buildBody(),
      ),
    );
  }

  Widget buildBody() {
    return Scrollbar(
      thumbVisibility: true,
      controller: _scrollController,
      child: ListView.separated(
        shrinkWrap: true,
        controller: _scrollController,
        physics: const AlwaysScrollableScrollPhysics(),
        itemCount: AccountController.to.incomeAccounts.value.length,
        separatorBuilder: (context, index) {
          return Divider(
            color: Get.theme.colorScheme.outline,
            height: 0.5,
          );
        },
        itemBuilder: (context, index) {
          return AccountManagementRow(
            account: AccountController.to.incomeAccounts.value.elementAt(index),
            accountType: 'income',
          );
        },
      ),
    );
  }

  // 추가 버튼
  Padding buildAssetAddButton() {
    return Padding(
      padding: const EdgeInsets.only(right: 5),
      child: IconButton(
        icon: const Icon(FluentIcons.add_square_multiple_20_regular),
        onPressed: () async {
          await AccountController.to.accountAddDialog('신규 등록', null, 'income');
        },
      ),
    );
  }
}
