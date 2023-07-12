import 'package:account_book/common/constant/size.dart';
import 'package:account_book/get/controller/account_controller.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../data/model/account.dart';
import '../../../get/controller/screen/trade_screen_controller.dart';

class AssertBottomSheet extends StatelessWidget {
  const AssertBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: const BoxConstraints(
        minHeight: 200,
        maxHeight: 400,
      ),
      child: SingleChildScrollView(
        controller: TradesScreenController.to.scroll,
        child: Container(
          decoration: BoxDecoration(
            color: Get.theme.colorScheme.background,
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(15),
              topRight: Radius.circular(15),
            ),
          ),
          child: Column(
            children: [
              Container(
                alignment: Alignment.center,
                padding: const EdgeInsets.symmetric(vertical: 20),
                child: Text(
                  '자산 리스트',
                  style: TextStyle(
                    color: Get.theme.colorScheme.onBackground,
                    fontSize: Get.textTheme.titleSmall!.fontSize,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              Container(
                decoration: BoxDecoration(
                  color: Get.theme.colorScheme.outline,
                  border: Border(
                    top: BorderSide(
                      width: 1,
                      color: Get.theme.colorScheme.outline,
                    ),
                  ),
                ),
                child: GridView.builder(
                  shrinkWrap: true,
                  scrollDirection: Axis.vertical,
                  controller: TradesScreenController.to.scroll,
                  itemCount: AccountController.to.assetAccounts.value.length + 1,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3, // 1 개의 행에 보여줄 item 개수
                      childAspectRatio: 2 / 1, //item 의 가로 1, 세로 2 의 비율
                      mainAxisSpacing: 1,
                      crossAxisSpacing: 1),
                  itemBuilder: (context, index) {
                    return AccountController.to.assetAccounts.value.length != index
                        ? buildItem(AccountController.to.assetAccounts.value.elementAt(index))
                        : buildAddItem();
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildItem(Account account) {
    return GestureDetector(
      onTap: () {
        Get.back(result: account, closeOverlays: false);
      },
      child: Container(
        alignment: Alignment.center,
        color: Get.theme.colorScheme.background,
        padding: const EdgeInsets.symmetric(vertical: 20),
        child: AutoSizeText(
          account.accountName!,
          maxLines: 1,
          style: TextStyle(color: Get.theme.colorScheme.onBackground, fontSize: Get.textTheme.bodyLarge!.fontSize),
        ),
      ),
    );
  }

  Widget buildAddItem() {
    return GestureDetector(
      // onTap : 자산 설정 페이지로 이동
      onTap: () {},
      child: Container(
        alignment: Alignment.center,
        color: Get.theme.colorScheme.background,
        padding: const EdgeInsets.symmetric(vertical: 20),
        child: Icon(
          Icons.add,
          color: Get.theme.colorScheme.onBackground,
        ),
      ),
    );
  }
}
