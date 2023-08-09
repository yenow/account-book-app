import 'package:account_book/data/dto/trade/trade_request_dto.dart';
import 'package:account_book/data/model/trade.dart';
import 'package:account_book/get/controller/account_controller.dart';
import 'package:account_book/get/controller/trade_controller.dart';
import 'package:account_book/get/controller/user_controller.dart';
import 'package:account_book/screens/trade/component/asset_bottom_sheet.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../../../common/widget/dialog.dart';
import '../../../common/log_config.dart';
import '../../../data/client/clients.dart';
import '../../../data/dto/single_response.dart';
import '../../../data/dto/trade/trade_response_dto.dart';
import '../../../data/model/account.dart';
import '../../../screens/trade/component/income_expense_account_bottom_sheet.dart';
import '../../../utilities/function/converter.dart';

class TradesScreenController extends GetxController {
  static TradesScreenController get to => Get.find();
  final scroll = ScrollController();
  final formKey = GlobalKey<FormState>();
  bool isClickedSaveButton = false; // 저장 클릭 여부

  final tradeType = ''.obs; // 현재 선택된 거래 타입 (수입, 지출, 이체)

  // TextEditingController
  TextEditingController dateController = TextEditingController();
  TextEditingController amountController = TextEditingController(text: '0');
  TextEditingController incomeExpenseAccountController = TextEditingController();
  TextEditingController assetController = TextEditingController();
  TextEditingController contentController = TextEditingController();
  TextEditingController memoController = TextEditingController();
  TextEditingController depositAssertTextController = TextEditingController();
  TextEditingController withdrawAssertTextController = TextEditingController();
  Trade trade = Trade();

  // 거래 저장
  Future<void> saveTrade() async {
    isClickedSaveButton = true;
    if (formKey.currentState!.validate()) {
      trade.tradeType = tradeType.value;
      trade.content = contentController.text;
      trade.memo = memoController.text;

      log.i('saveTrade = $trade');
      TradeRequestDto tradeRequestDto = TradeRequestDto();
      tradeRequestDto.setTrade(trade);
      tradeRequestDto.userId = UserController.to.user.value.userId;

      tradeClient.saveTrade(trade: tradeRequestDto).then((SingleResponse<TradeResponseDto> value) async {
        await TradeController.to.findTrades();
        dlog.i(value);
        Get.back(result: 'Y');
      });
    }
  }

  // 거래 수정
  void updateTrade() {
    if (formKey.currentState!.validate()) {
      log.i('updateTrade');
    }
  }

  // 거래 삭제
  void deleteTrade() async {
    if (trade.tradeId == null) {
      return;
    }

    bool confirm = await deleteDialog();

    if (confirm) {
      log.i('deleteTrade');
    }
  }

  void validate() {
    if (isClickedSaveButton) {
      formKey.currentState!.validate();
    }
  }

  void radioButtonValue(value) {
    TradesScreenController.to.tradeType(value);
  }

  //region 날짜
  // 날짜 선택
  void onTapToDateInput() async {
    log.i('onTapToDateInput');
    _selectDate(Get.context!);
    validate();
  }

  // 날짜 팝업
  Future _selectDate(BuildContext context) async {
    final DateTime? result = await showDatePicker(
      context: context,
      initialDate: DateTime.parse(trade.tradeDate!),
      firstDate: DateTime(1900),
      lastDate: DateTime.utc(2040),
    );

    if (result != null) {
      dateController.text = DateFormat('yyyy.MM.dd').format(result);
      trade.tradeDate = dateController.text;
    }
  }

  void onSaveToDateInput(String? value) {}

  String? validateToDateInput(String? value) {
    if (value == null || value == '') {
      return '날짜를 입력해주세요.';
    }

    return null;
  }

  //endregion

  //region 분류(계정)
  // 분류 선택
  void onTapToIncomeExpenseAccountInput() async {
    TradeType pTradeType;
    List<Account> pAccounts;
    log.i(tradeType.value);

    if (tradeType.value == 'income') {
      pTradeType = TradeType.income;
      pAccounts = AccountController.to.incomeAccounts.value;
    } else if (tradeType.value == 'expense') {
      pTradeType = TradeType.expense;
      pAccounts = AccountController.to.expenseAccounts.value;
    } else {
      return;
    }

    Account? result = await Get.bottomSheet(
      IncomeExpenseAccountBottomSheet(
        tradeType: pTradeType,
        accounts: pAccounts,
      ),
      elevation: 2,
      backgroundColor: Get.theme.colorScheme.background,
      enterBottomSheetDuration: const Duration(microseconds: 1000),
      exitBottomSheetDuration: const Duration(microseconds: 1000),
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(15),
        ),
      ),
    );

    if (result != null) {
      incomeExpenseAccountController.text = result.accountName!;
      trade.incomeOrExpenseAccountId = result.accountId;
      trade.incomeOrExpenseAccountName = result.accountName;
    }
    validate();
  }

  // 분류 유효성 검증
  String? validateToTypeInput(String? value) {
    if (value == null || value == '') {
      return '분류를 입력해주세요.';
    }

    return null;
  }

  //endregion

  //region 금액

  // 금액 변경시
  void onChangedToAmountInput(String value) {
    if (value != '') {
      int price = int.parse(value.replaceAll(',', ''));
      amountController.text = AppConverter.numberFormat(price);
      trade.amount = price;
    }

    // 커서 위치 변경
    if (amountController.text != '') {
      int somePosition = amountController.text.length;
      amountController.selection = TextSelection.fromPosition(TextPosition(offset: somePosition));
    }
    validate();
  }

  // 금액 유효성 검증
  String? validateToAmountInput(String? value) {
    if (value == null || value == '') {
      return '금액를 입력해주세요.';
    } else if (value == '0') {
      return '금액이 0원 입니다.';
    }

    return null;
  }

  //endregion

  //region 자산

  // 자산 선택시
  void onTapToAssetInput() async {
    Account? result = await Get.bottomSheet(
      const AssetBottomSheet(),
      elevation: 2,
      backgroundColor: Get.theme.colorScheme.background,
      enterBottomSheetDuration: const Duration(microseconds: 1000),
      exitBottomSheetDuration: const Duration(microseconds: 1000),
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(15),
        ),
      ),
    );

    if (result != null) {
      assetController.text = result.accountName!;
      trade.assetAccountId = result.accountId;
      trade.assetAccountName = result.accountName;
    }
    validate();
  }

  // 자산 유효성 검증
  String? validateToAssetInput(String? value) {
    if (value == null || value == '') {
      return '자산을 입력해주세요.';
    }

    return null;
  }

  //endregion

  // 입금 선택
  void onTapToDepositAssetInput() async {
    Account? result = await Get.bottomSheet(
      const AssetBottomSheet(),
      elevation: 2,
      backgroundColor: Get.theme.colorScheme.background,
      enterBottomSheetDuration: const Duration(microseconds: 1000),
      exitBottomSheetDuration: const Duration(microseconds: 1000),
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(15),
        ),
      ),
    );

    if (result != null) {
      depositAssertTextController.text = result.accountName!;
      trade.depositAccountId = result.accountId;
      trade.depositAccountName = result.accountName;
    }
    validate();
  }

  // 입금 유효성 검증
  String? validateToDepositAssetInput(String? value) {
    if (value == null || value == '') {
      return '입금을 입력해주세요.';
    }
    return null;
  }

  // 지출 선택
  void onTapToWithdrawAssetInput() async {
    Account? result = await Get.bottomSheet(
      const AssetBottomSheet(),
      elevation: 2,
      backgroundColor: Get.theme.colorScheme.background,
      enterBottomSheetDuration: const Duration(microseconds: 1000),
      exitBottomSheetDuration: const Duration(microseconds: 1000),
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(15),
        ),
      ),
    );

    if (result != null) {
      withdrawAssertTextController.text = result.accountName!;
      trade.withdrawAccountId = result.accountId;
      trade.withdrawAccountName = result.accountName;
    }
    validate();
  }

  // 출금 유효성 검증
  String? validateToWithdrawAssetInput(String? value) {
    if (value == null || value == '') {
      return '출금을 입력해주세요.';
    }
    return null;
  }
}
