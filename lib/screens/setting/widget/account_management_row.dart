import 'package:account_book/common/constant/colors.dart';
import 'package:account_book/get/controller/account_controller.dart';
import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../common/log_config.dart';
import '../../../common/widget/dialog/dialog.dart';
import '../../../data/client/clients.dart';
import '../../../data/model/account.dart';
import '../../../utilities/function/icon_converter.dart';

class AccountManagementRow extends StatelessWidget {
  const AccountManagementRow({super.key, required this.account, required this.accountType});

  final String accountType;
  final Account account;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 10),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.fromLTRB(7, 0, 7, 3),
            child: Icon(IconConverter.iconConverter(account.accountName ?? '')),
          ),
          Text('${account.accountName}'),
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                editIcon(),
                deleteIcon(),
              ],
            ),
          ),
        ],
      ),
    );
  }

  InkWell editIcon() {
    return InkWell(
      splashColor: Get.theme.colorScheme.onPrimaryContainer,
      focusColor: Get.theme.colorScheme.onPrimaryContainer,
      hoverColor: Get.theme.colorScheme.onPrimaryContainer,
      highlightColor: Get.theme.colorScheme.onPrimaryContainer,
      child: Container(
        padding: const EdgeInsets.fromLTRB(7, 0, 7, 3),
        child: const Icon(FluentIcons.edit_20_regular, color: CommonColors.purpleBold),
      ),
      onTap: () async {
        await AccountController.to.accountAddDialog('수정', account, accountType);
      },
    );
  }

  InkWell deleteIcon() {
    return InkWell(
      splashColor: Get.theme.colorScheme.onPrimaryContainer,
      focusColor: Get.theme.colorScheme.onPrimaryContainer,
      hoverColor: Get.theme.colorScheme.onPrimaryContainer,
      highlightColor: Get.theme.colorScheme.onPrimaryContainer,
      onTap: () async {
        bool? result = await deleteDialog();
        log.i(result);

        if (result == true) {
          await accountClient.deleteAsset(account.accountId!);

          if (accountType == 'income') {
            AccountController.to.incomeAccounts.value.remove(account);
            AccountController.to.incomeAccounts(AccountController.to.incomeAccounts.value.toList());
          } else if (accountType == 'expense') {
            AccountController.to.expenseAccounts.value.remove(account);
            AccountController.to.expenseAccounts(AccountController.to.expenseAccounts.value.toList());
          }
        }
      },
      child: Container(
        padding: const EdgeInsets.fromLTRB(5, 0, 5, 3),
        child: const Icon(FluentIcons.delete_20_regular, color: CommonColors.redBold,),
      ),
    );
  }
}
