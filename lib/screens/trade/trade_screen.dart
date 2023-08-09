import 'package:account_book/common/constant/colors.dart';
import 'package:account_book/data/model/trade.dart';
import 'package:account_book/get/controller/screen/trade_screen_controller.dart';
import 'package:custom_radio_grouped_button/custom_radio_grouped_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../../common/log_config.dart';
import '../../utilities/function/converter.dart';
import 'component/trade_type_radio_button.dart';

class TradeScreen extends StatelessWidget {
  const TradeScreen({Key? key, required this.trade}) : super(key: key);
  final Trade trade;

  @override
  Widget build(BuildContext context) {
    return SafeArea(child: buildScaffold());
  }

  Scaffold buildScaffold() {
    return Scaffold(
      appBar: buildAppBar(),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          children: [
            const SizedBox(height: 5,),
            TradeTypeRadioButton(tradeType: trade.tradeType), //  거래 타입 선택
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 15),
              child: buildForm(),
            ),
          ],
        ),
      ),
    );
  }

  // 앱바
  AppBar buildAppBar() {
    return AppBar(
      title: Obx(() => Text(AppConverter.convertTradeType(TradesScreenController.to.tradeType.value))),
      actions: [
        IconButton(
          icon: const Icon(
            Icons.delete,
          ),
          onPressed: TradesScreenController.to.deleteTrade,
          style: ButtonStyle(
            padding: MaterialStateProperty.all(EdgeInsets.zero)
          ),
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(0, 0, 8, 0),
          child: IconButton(
            icon: const Icon(
              Icons.save,
            ),
            onPressed: trade.tradeId == null ? TradesScreenController.to.saveTrade : TradesScreenController.to.updateTrade,
            style: ButtonStyle(
                padding: MaterialStateProperty.all(EdgeInsets.zero)
            ),
          ),
        ),
      ],
    );
  }

  Form buildForm() {
    return Form(
      key: TradesScreenController.to.formKey,
      child: Obx(() =>
          Column(
          children: [
            buildDateInput(),
            buildAmountInput(),
            TradesScreenController.to.tradeType.value == TradeType.transfer.name ? buildDepositAssetInput() : buildIncomeExpenseAccountInput(),
            TradesScreenController.to.tradeType.value == TradeType.transfer.name ? buildWithdrawAssetInput() : buildAssetInput(),
            buildContentInput(),
            buildMemoInput(),
          ],
        ),
      ),
    );
  }

  //region 날짜 입력
  Container buildDateInput() {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 5),
      child: Row(
        children: [
          buildText(titleText: '날짜'),
          Expanded(
            child: buildDateInputForm(),
          ),
          SizedBox(
            width: 35,
            height: 35,
            child: IconButton(
              icon: const Icon(Icons.date_range, size: 20),
              onPressed: TradesScreenController.to.onTapToDateInput,
            ),
          ),
        ],
      ),
    );
  }

  TextFormField buildDateInputForm() {
    return TextFormField(
      // onSaved: TradesScreenController.to.onSaveToDateInput,
      validator: TradesScreenController.to.validateToDateInput,
      onTap: TradesScreenController.to.onTapToDateInput,
      controller: TradesScreenController.to.dateController,
      maxLines: 1,
      readOnly: true,
      autofocus: false,
      style: TextStyle(fontSize: Get.textTheme.bodyLarge!.fontSize!),
      decoration: buildInputDecoration(),
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
          const SizedBox(
            width: 35,
            height: 35,
            child: Icon(Icons.attach_money),
          ),
        ],
      ),
    );
  }

  TextFormField buildAmountInputForm() {
    return TextFormField(
      onSaved: (newValue) {},
      validator: TradesScreenController.to.validateToAmountInput,
      onChanged: TradesScreenController.to.onChangedToAmountInput,
      controller: TradesScreenController.to.amountController,
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

  //region 분류 입력 (수입, 지출 계정)
  Container buildIncomeExpenseAccountInput() {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 5),
      child: Row(
        children: [
          buildText(titleText: '분류'),
          Expanded(child: buildIncomeExpenseAccountInputForm()),
          SizedBox(
            width: 35,
            height: 35,
            child: IconButton(
              onPressed: TradesScreenController.to.onTapToIncomeExpenseAccountInput,
              icon: const Icon(CupertinoIcons.arrow_counterclockwise_circle_fill),
            ),
          ),
        ],
      ),
    );
  }

  TextFormField buildIncomeExpenseAccountInputForm() {
    return TextFormField(
      onSaved: (newValue) {},
      validator: TradesScreenController.to.validateToTypeInput,
      onTap: TradesScreenController.to.onTapToIncomeExpenseAccountInput,
      controller: TradesScreenController.to.incomeExpenseAccountController,
      maxLines: 1,
      readOnly: true,
      autofocus: false,
      cursorColor: Get.theme.colorScheme.outline,
      style: TextStyle(fontSize: Get.textTheme.bodyLarge!.fontSize!),
      decoration: buildInputDecoration(),
    );
  }

  //endregion

  //region 자산 입력
  Container buildAssetInput() {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 5),
      child: Row(
        children: [
          buildText(titleText: '자산'),
          Expanded(child: buildAssetInputForm()),
          SizedBox(
            width: 35,
            height: 35,
            child: IconButton(
              onPressed: TradesScreenController.to.onTapToAssetInput,
              icon: const Icon(CupertinoIcons.arrow_counterclockwise_circle_fill),
            ),
          ),
        ],
      ),
    );
  }

  TextFormField buildAssetInputForm() {
    return TextFormField(
      onTap: TradesScreenController.to.onTapToAssetInput,
      validator: TradesScreenController.to.validateToAssetInput,
      maxLines: 1,
      readOnly: true,
      autofocus: false,
      cursorColor: Get.theme.colorScheme.outline,
      style: TextStyle(fontSize: Get.textTheme.bodyLarge!.fontSize!),
      controller: TradesScreenController.to.assetController,
      decoration: buildInputDecoration(),

    );
  }

  //endregion

  //region 입금 입력
  Container buildDepositAssetInput() {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 5),
      child: Row(
        children: [
          buildText(titleText: '입금'),
          Expanded(child: buildDepositAssetInputForm()),
          SizedBox(
            width: 35,
            height: 35,
            child: IconButton(
              onPressed: TradesScreenController.to.onTapToAssetInput,
              icon: const Icon(CupertinoIcons.arrow_counterclockwise_circle_fill),
            ),
          ),
        ],
      ),
    );
  }

  TextFormField buildDepositAssetInputForm() {
    return TextFormField(
      onTap: TradesScreenController.to.onTapToDepositAssetInput,
      validator: TradesScreenController.to.validateToDepositAssetInput,
      maxLines: 1,
      readOnly: true,
      autofocus: false,
      cursorColor: Get.theme.colorScheme.outline,
      style: TextStyle(fontSize: Get.textTheme.bodyLarge!.fontSize!),
      controller: TradesScreenController.to.depositAssertTextController,
      decoration: buildInputDecoration(),

    );
  }

  //endregion

  //region 출금 입력
  Container buildWithdrawAssetInput() {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 5),
      child: Row(
        children: [
          buildText(titleText: '출금'),
          Expanded(child: buildWithdrawAssetInputForm()),
          SizedBox(
            width: 35,
            height: 35,
            child: IconButton(
              onPressed: TradesScreenController.to.onTapToAssetInput,
              icon: const Icon(CupertinoIcons.arrow_counterclockwise_circle_fill),
            ),
          ),
        ],
      ),
    );
  }

  TextFormField buildWithdrawAssetInputForm() {
    return TextFormField(
      onTap: TradesScreenController.to.onTapToWithdrawAssetInput,
      validator: TradesScreenController.to.validateToWithdrawAssetInput,
      maxLines: 1,
      readOnly: true,
      autofocus: false,
      cursorColor: Get.theme.colorScheme.outline,
      style: TextStyle(fontSize: Get.textTheme.bodyLarge!.fontSize!),
      controller: TradesScreenController.to.withdrawAssertTextController,
      decoration: buildInputDecoration(),

    );
  }

  //endregion

  //region 내용 입력
  Container buildContentInput() {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 5),
      child: Row(
        children: [
          buildText(titleText: '내용'),
          Expanded(child: buildContentInputForm()),
        ],
      ),
    );
  }

  TextFormField buildContentInputForm() {
    return TextFormField(
      onSaved: (newValue) {},
      validator: (value) {},
      maxLines: 1,
      maxLength: 200,
      autofocus: false,
      cursorColor: Get.theme.colorScheme.outlineVariant,
      controller: TradesScreenController.to.contentController,
      decoration: buildInputDecoration(),
      style: TextStyle(fontSize: Get.textTheme.bodyLarge!.fontSize!),
    );
  }

  //endregion

  //region 메모 입력
  Container buildMemoInput() {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 5),
      child: Row(
        children: [
          buildText(titleText: '메모'),
          Expanded(child: buildMemoInputForm()),
        ],
      ),
    );
  }

  Widget buildMemoInputForm() {
    return ConstrainedBox(
      constraints: const BoxConstraints(
        maxHeight: 100,
        minHeight: 50
      ),
      child: TextFormField(
        onSaved: (newValue) {},
        validator: (value) {},
        maxLines: 10,
        maxLength: 1000,
        autofocus: false,
        cursorColor: Get.theme.colorScheme.outlineVariant,
        controller: TradesScreenController.to.memoController,
        cursorHeight: cursorHeight(),
        style: TextStyle(fontSize: Get.textTheme.bodyLarge!.fontSize!),
        decoration: buildInputDecorationOutLine(),
      ),
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
      focusedBorder:
          UnderlineInputBorder(borderSide: BorderSide(width: 1, color: Get.theme.colorScheme.outlineVariant)),
      enabledBorder:
          UnderlineInputBorder(borderSide: BorderSide(width: 0.5, color: Get.theme.colorScheme.outlineVariant)),
      disabledBorder:
          UnderlineInputBorder(borderSide: BorderSide(width: 0.5, color: Get.theme.colorScheme.outlineVariant)),
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
