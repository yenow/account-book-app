import 'package:account_book/common/constant/colors.dart';
import 'package:account_book/common/constant/size.dart';
import 'package:account_book/get/controller/account_controller.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../data/model/account.dart';
import '../../../get/controller/screen/trade_screen_controller.dart';
import '../../../route.dart';
import '../../../common/function/icon_converter.dart';

class AssetDialog extends StatelessWidget {
  const AssetDialog({super.key, required this.accounts});

  final List<Account> accounts;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ConstrainedBox(
        constraints: BoxConstraints(
          maxWidth: (Get.width * 6) / 7,
          maxHeight: (Get.height * 3) / 4,
        ),
        child: Material(
          type: MaterialType.transparency,
          child: buildSingleChildScrollView(),
        ),
      ),
    );
  }

  SingleChildScrollView buildSingleChildScrollView() {
    return SingleChildScrollView(
      controller: TradesScreenController.to.scroll,
      child: Container(
        decoration: BoxDecoration(
          color: Get.theme.colorScheme.background,
          borderRadius: const BorderRadius.all(Radius.circular(15)),
        ),
        child: Column(
          children: [
            Container(
              alignment: Alignment.center,
              padding: const EdgeInsets.only(top: 20, bottom: 5),
              child: Text(
                '자산 리스트',
                style: TextStyle(
                  color: Get.theme.colorScheme.onBackground,
                  fontSize: Get.textTheme.titleSmall!.fontSize,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            gridView(),
          ],
        ),
      ),
    );
  }

  GridView gridView() {
    return GridView.builder(
      shrinkWrap: true,
      scrollDirection: Axis.vertical,
      controller: TradesScreenController.to.scroll,
      itemCount: accounts.length + 1,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3, // 1 개의 행에 보여줄 item 개수
          childAspectRatio: 2 / 1, //item 의 가로 1, 세로 2 의 비율
          mainAxisSpacing: 1,
          crossAxisSpacing: 1),
      itemBuilder: (context, index) {
        return accounts.length != index ? buildItem(accounts.elementAt(index), index) : buildAddItem();
      },
    );
  }

  Widget buildItem(Account account, int index) {
    return GestureDetector(
      onTap: () {
        Get.back(result: account, closeOverlays: false);
      },
      child: Container(
        alignment: Alignment.center,
        color: Get.theme.colorScheme.background,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              padding: const EdgeInsets.only(bottom: 5, right: 3),
              child: Icon(
                IconConverter.iconConverter(account.accountName!),
                color: CommonColors.typeColors.elementAt(index % CommonColors.typeColors.length),
              ),
            ),
            AutoSizeText(
              account.accountName!,
              maxLines: 1,
              style: TextStyle(
                  color: CommonColors.typeColors.elementAt(index % CommonColors.typeColors.length),
                  fontSize: Get.textTheme.bodyMedium!.fontSize,
                  fontWeight: FontWeight.w400),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildAddItem() {
    return GestureDetector(
      // onTap : 자산 설정 페이지로 이동
      onTap: () async {
        // await Get.toNamed(AppRoute.assetScreen);
        AccountController.to.incomeAccounts();
      },
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            alignment: Alignment.center,
            color: Get.theme.colorScheme.background,
            padding: const EdgeInsets.only(bottom: 5, right: 3),
            child: Icon(
              FluentIcons.add_circle_20_regular,
              color: Get.theme.colorScheme.onBackground,
            ),
          ),
          AutoSizeText(
            '추가',
            maxLines: 1,
            style: TextStyle(fontSize: Get.textTheme.bodyMedium!.fontSize, fontWeight: FontWeight.w400, color: Get.theme.colorScheme.onBackground),
          ),
        ],
      ),
    );
  }
}
