
import 'package:custom_radio_grouped_button/custom_radio_grouped_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../data/model/trade.dart';
import '../../../get/controller/screen/trade_screen_controller.dart';

class TradeTypeRadioButton extends StatelessWidget {
  const TradeTypeRadioButton({super.key, required this.tradeType});
  final String? tradeType;

  @override
  Widget build(BuildContext context) {
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
      defaultSelected: tradeType ?? TradeType.expense.name,
      buttonLables: [
        TradeType.expense.tradeTypeName,
        TradeType.income.tradeTypeName,
        TradeType.transfer.tradeTypeName,
      ],
      buttonValues: [
        TradeType.expense.name,
        TradeType.income.name,
        TradeType.transfer.name,
      ],
      buttonTextStyle: ButtonTextStyle(
        selectedColor: Get.theme.colorScheme.primary,
        unSelectedColor: Get.theme.colorScheme.onBackground,
        // disabledColor: Get.theme.colorScheme.onPrimary,
        textStyle: const TextStyle(fontSize: 16),
      ),
      radioButtonValue: TradesScreenController.to.radioButtonValue,
    );
  }
}
