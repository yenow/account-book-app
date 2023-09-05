import 'package:account_book/data/dto/account/account_request_dto.dart';
import 'package:account_book/get/controller/account_controller.dart';
import 'package:account_book/screens/asset/component/account_bottom_sheet.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../common/widget/bottom_sheet.dart';
import '../../../common/widget/dialog/dialog.dart';
import '../../../common/log_config.dart';
import '../../../data/client/clients.dart';
import '../../../data/model/account.dart';
import '../../../data/model/asset.dart';
import '../../../screens/trade/component/asset_bottom_sheet.dart';
import '../../../common/function/converter.dart';

class AssetScreenController extends GetxController {
  static AssetScreenController get to => Get.find();
  final assetType = ''.obs; // 현재 선택된 타입 (그룹,자산)
  final asset = Asset().obs;

  final formKey = GlobalKey<FormState>();
  bool isClickedSaveButton = false; // 저장 클릭 여부

  TextEditingController groupNameController = TextEditingController();
  TextEditingController assetGroupController = TextEditingController();
  TextEditingController assetNameController = TextEditingController();
  TextEditingController amountController = TextEditingController();

  // 저장
  void saveAsset() {
    isClickedSaveButton = true;
    if (formKey.currentState!.validate()) {
      accountClient.saveAsset(accountRequestDto: AccountRequestDto(
      ));
    }
  }

  // 수정
  void updateAsset() {
    if (formKey.currentState!.validate()) {
      log.i('updateTrade');
    }
  }

  // 삭제
  Future<void> deleteAsset() async {
    if (asset.value.accountId == null) {
      return;
    }

    bool confirm = await deleteDialog();

    if (confirm) {
      log.i('deleteTrade');
      accountClient.deleteAsset(asset.value.accountId!);
    }
  }

  // 그룹 유효성 검증
  String? validateToGroupInput(String? value) {
    if (value == null || value == '') {
      return '그룹명을 입력해주세요.';
    }

    return null;
  }

  //region 자산

  // 그룹 선택시
  void onTapToParentAssetInput() async {
    Account? result = await bottomSheet(AccountSheet(accounts: AccountController.to.groupAssetAccounts.value));

    if (result != null) {
      assetGroupController.text = result.accountName!;
      asset.value.accountId = result.accountId;
      asset.value.accountName = result.accountName;
    }
    validate();
  }


  // 그룹 유효성 검증
  String? validateToParentAssetInput(String? value) {
    if (value == null || value == '') {
      return '그룹을 선택해주세요.';
    }

    return null;
  }

  // 자산 유효성 검증
  String? validateToAssetNameInput(String? value) {
    if (value == null || value == '') {
      return '자산명을 압력해주세요.';
    }

    return null;
  }

  //endregion

  //region 금액 관련
  String? validateToAmountInput(String? value) {
    if (value == null || value == '') {
      return '금액를 입력해주세요.';
    } else if (value == '0') {
      return '금액이 0원 입니다.';
    }

    return null;
  }

  // 금액 변경시
  void onChangedToAmountInput(String value) {
    if (value != '') {
      int price = int.parse(value.replaceAll(',', ''));
      amountController.text = AppConverter.numberFormat(price);
      asset.value.sumAmount = price;
    }

    // 커서 위치 변경
    if (amountController.text != '') {
      int somePosition = amountController.text.length;
      amountController.selection = TextSelection.fromPosition(TextPosition(offset: somePosition));
    }
    validate();
  }

  //endregion

  void validate() {
    if (isClickedSaveButton) {
      formKey.currentState!.validate();
    }
  }

  void radioButtonValue(value) {
    assetType(value);
  }
}
