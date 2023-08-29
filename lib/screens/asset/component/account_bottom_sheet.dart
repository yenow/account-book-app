import 'package:account_book/data/model/asset.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../data/model/account.dart';

class AccountSheet extends StatelessWidget {
  const AccountSheet({super.key, required this.accounts});
  final List<Account> accounts;

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: const BoxConstraints(
        minHeight: 200,
        maxHeight: 400,
      ),
      child: SingleChildScrollView(
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
                  '자산 그룹 리스트',
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
                   itemCount: accounts.length + 1,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3, // 1 개의 행에 보여줄 item 개수
                      childAspectRatio: 2 / 1, //item 의 가로 1, 세로 2 의 비율
                      mainAxisSpacing: 1,
                      crossAxisSpacing: 1),
                  itemBuilder: (context, index) {
                    return accounts.length != index
                        ? buildItem(accounts.elementAt(index))
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
