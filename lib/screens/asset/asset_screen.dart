import 'package:account_book/common/constant/colors.dart';
import 'package:account_book/data/model/trade.dart';
import 'package:account_book/get/controller/screen/asset_screen_controller.dart';
import 'package:account_book/get/controller/screen/trade_screen_controller.dart';
import 'package:custom_radio_grouped_button/custom_radio_grouped_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../../common/log_config.dart';
import '../../data/model/asset.dart';
import '../../utilities/function/converter.dart';

class AssetScreen extends StatelessWidget {
  const AssetScreen({Key? key, required this.asset}) : super(key: key);
  final Asset asset;

  @override
  Widget build(BuildContext context) {
    return SafeArea(child: buildScaffold());
  }

  Scaffold buildScaffold() {
    return Scaffold(
      appBar: buildAppBar(),
      body: Column(
        children: [
          const SizedBox(
            height: 5,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 15),
            child: buildForm(),
          ),
        ],
      ),
    );
  }

  Form buildForm() {
    return Form(
      key: AssetScreenController.to.formKey,
      child: Obx(
        () => Column(
          children: [
            buildRadioButton(),
            AssetScreenController.to.assetType.value == AssetType.group.name ? buildGroupNameInput() : Container(),
            AssetScreenController.to.assetType.value == AssetType.group.name ? Container() : buildParentAssetInput(),
            AssetScreenController.to.assetType.value == AssetType.group.name ? Container() : buildAssetNameInput(),
            AssetScreenController.to.assetType.value == AssetType.group.name || asset.accountId != null ? Container() : buildAmountInput(),
            buildSaveButton(),
          ],
        ),
      ),
    );
  }

  // 앱바
  AppBar buildAppBar() {
    return AppBar(
      title: Obx(() => Text(AssetScreenController.to.assetType.value == 'asset' ? '자산' : '그룹')),
      actions: [
        AssetScreenController.to.asset.value.accountId == null ? Container() : buildDeleteButton(),
      ],
    );
  }

  Padding buildDeleteButton() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(0, 0, 8, 0),
      child: IconButton(
        icon: const Icon(
          Icons.delete,
        ),
        onPressed: AssetScreenController.to.deleteAsset,
        style: ButtonStyle(padding: MaterialStateProperty.all(EdgeInsets.zero)),
      ),
    );
  }

  Widget buildSaveButton() {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10),
      child: ElevatedButton(
        onPressed: asset.accountId == null ? AssetScreenController.to.saveAsset : AssetScreenController.to.updateAsset,
        style: ButtonStyle(padding: MaterialStateProperty.all(EdgeInsets.zero)),
        child: const Text('저장'),
      ),
    );
  }

  CustomRadioButton<Object> buildRadioButton() {
    return CustomRadioButton(
      elevation: 0,
      autoWidth: true,
      wrapAlignment: WrapAlignment.spaceEvenly,
      enableButtonWrap: false,
      height: 45,
      spacing: 5,
      radius: 10,
      shapeRadius: 10,
      enableShape: true,
      selectedColor: Get.theme.colorScheme.background,
      selectedBorderColor: Get.theme.colorScheme.primary,
      unSelectedColor: Get.theme.colorScheme.background,
      unSelectedBorderColor: Get.theme.colorScheme.onBackground,
      defaultSelected: AssetScreenController.to.assetType.value,
      buttonLables: [AssetType.asset.assetTypeName, AssetType.group.assetTypeName],
      buttonValues: [AssetType.asset.name, AssetType.group.name],
      buttonTextStyle: ButtonTextStyle(
        selectedColor: Get.theme.colorScheme.primary,
        unSelectedColor: Get.theme.colorScheme.onBackground,
        // disabledColor: Get.theme.colorScheme.onPrimary,
        textStyle: const TextStyle(fontSize: 16),
      ),
      radioButtonValue: AssetScreenController.to.radioButtonValue,
    );
  }

  //region 자산 그룹 입력
  Container buildGroupNameInput() {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 5),
      child: Row(
        children: [
          buildText(titleText: '그룹'),
          Expanded(child: buildGroupNameInputForm()),
        ],
      ),
    );
  }

  TextFormField buildGroupNameInputForm() {
    return TextFormField(
      onSaved: (newValue) {},
      validator: AssetScreenController.to.validateToGroupInput,
      maxLines: 1,
      maxLength: 50,
      autofocus: false,
      cursorColor: Get.theme.colorScheme.outlineVariant,
      controller: AssetScreenController.to.groupNameController,
      decoration: buildInputDecoration(),
      style: TextStyle(fontSize: Get.textTheme.bodyLarge!.fontSize!),
    );
  }

  //endregion

  //region 부모 자산 그룹 선택
  Container buildParentAssetInput() {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 5),
      child: Row(
        children: [
          buildText(titleText: '그룹'),
          Expanded(child: buildParentAssetInputForm()),
        ],
      ),
    );
  }

  TextFormField buildParentAssetInputForm() {
    return TextFormField(
      onTap: AssetScreenController.to.onTapToParentAssetInput,
      validator: AssetScreenController.to.validateToParentAssetInput,
      maxLines: 1,
      readOnly: true,
      autofocus: false,
      cursorColor: Get.theme.colorScheme.outline,
      style: TextStyle(fontSize: Get.textTheme.bodyLarge!.fontSize!),
      controller: AssetScreenController.to.assetGroupController,
      decoration: buildInputDecoration(),
    );
  }

  //endregion

  //region 자산 입력
  Container buildAssetNameInput() {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 5),
      child: Row(
        children: [
          buildText(titleText: '자산'),
          Expanded(child: buildAssetNameInputForm()),
        ],
      ),
    );
  }

  TextFormField buildAssetNameInputForm() {
    return TextFormField(
      validator: AssetScreenController.to.validateToAssetNameInput,
      maxLines: 1,
      maxLength: 50,
      autofocus: false,
      cursorColor: Get.theme.colorScheme.outlineVariant,
      controller: AssetScreenController.to.assetNameController,
      decoration: buildInputDecoration(),
      style: TextStyle(fontSize: Get.textTheme.bodyLarge!.fontSize!),
    );
  }

  //endregion

  //region 금액 입력
  Container buildAmountInput() {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 5),
      child: Row(
        children: [
          buildText(titleText: '금액'),
          Expanded(
            child: buildAmountInputForm(),
          ),
        ],
      ),
    );
  }

  TextFormField buildAmountInputForm() {
    return TextFormField(
      onSaved: (newValue) {},
      validator: AssetScreenController.to.validateToAmountInput,
      onChanged: AssetScreenController.to.onChangedToAmountInput,
      controller: AssetScreenController.to.amountController,
      maxLines: 1,
      maxLength: 10,
      autofocus: false,
      cursorColor: Get.theme.colorScheme.outlineVariant,
      textInputAction: TextInputAction.next,
      keyboardType: const TextInputType.numberWithOptions(decimal: true),
      inputFormatters: [
        FilteringTextInputFormatter.digitsOnly,
      ],
      style: TextStyle(fontSize: Get.textTheme.bodyLarge!.fontSize!),
      decoration: buildInputDecoration(),
    );
  }

  //endregion

  //region 공통 위젯
  Container buildText({required String titleText}) {
    return Container(
      padding: const EdgeInsets.fromLTRB(5, 0, 15, 0),
      child: Text(
        titleText,
        style: TextStyle(fontSize: Get.textTheme.bodyLarge!.fontSize!, color: Get.theme.colorScheme.onBackground),
      ),
    );
  }

  InputDecoration buildInputDecoration() {
    return InputDecoration(
      counterText: '',
      isDense: true,
      focusColor: Get.theme.colorScheme.outlineVariant,
      errorMaxLines: 1,
      contentPadding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      focusedBorder: UnderlineInputBorder(borderSide: BorderSide(width: 1, color: Get.theme.colorScheme.outlineVariant)),
      enabledBorder: UnderlineInputBorder(borderSide: BorderSide(width: 0.5, color: Get.theme.colorScheme.outlineVariant)),
      disabledBorder: UnderlineInputBorder(borderSide: BorderSide(width: 0.5, color: Get.theme.colorScheme.outlineVariant)),
      errorStyle: TextStyle(color: Get.theme.colorScheme.error),
    );
  }

  InputDecoration buildInputDecorationOutLine() {
    return InputDecoration(
      contentPadding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      counterText: '',
      isDense: true,
      focusColor: Get.theme.colorScheme.outlineVariant,
      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(width: 1, color: Get.theme.colorScheme.outlineVariant),
      ),
      enabledBorder: OutlineInputBorder(
        borderSide: BorderSide(width: 0.5, color: Get.theme.colorScheme.outline),
      ),
      disabledBorder: OutlineInputBorder(
        borderSide: BorderSide(width: 0.5, color: Get.theme.colorScheme.outline),
      ),
    );
  }

  double cursorHeight() => Get.textTheme.bodyLarge!.fontSize! + 5;
}
