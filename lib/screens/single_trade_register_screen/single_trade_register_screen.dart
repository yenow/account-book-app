import 'package:account_book/data/model/trade.dart';
import 'package:account_book/get/controller/account_detail_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class SingleTradeRegisterScreen extends StatelessWidget {
  const SingleTradeRegisterScreen({Key? key, required this.account}) : super(key: key);
  final Trade account;

  @override
  Widget build(BuildContext context) {
    return SafeArea(child: buildScaffold());
  }

  Scaffold buildScaffold() {
    return Scaffold(
      appBar: AppBar(
        title: Text(account.typeName ?? '가계부 등록'),
        actions: [
          IconButton(
            icon: Icon(Icons.delete,),
            onPressed: deleteAccount,
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(0, 0, 5, 0),
            child: IconButton(
              icon: Icon(Icons.save,),
              onPressed: account.id == null ? saveAccount : updateAccount,
            ),
          ),
        ],
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 5),
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            children: [
              buildCard(),
              buildForm(),
            ],
          ),
        ),
      ),
    );
  }

  void deleteAccount() {

  }
  void saveAccount() {}
  void updateAccount() {}

  Container buildCard() {
    return Container(
      margin: EdgeInsets.all(5),
      height: 200,
      decoration: BoxDecoration(
          // color: Colors.grey,
          border: Border.all(width: 1, color: Colors.grey),
          borderRadius: BorderRadius.all(Radius.circular(10))),
    );
  }

  Form buildForm() {
    return Form(
      key: AccountDetailController.to.formKey,
      child: Column(
        children: [
          Container(
            margin: const EdgeInsets.symmetric(vertical: 5),
            child: Row(
              children: [
                buildText(titleText: '날짜'),
                Expanded(
                  child: buildTextFormForDate(inputText: account.tradeDate ?? '', onSaved: (val) {}, validator: (val) {}),
                )
              ],
            ),
          ),
          Container(
            margin: const EdgeInsets.symmetric(vertical: 5),
            child: Row(
              children: [
                buildText(titleText: '금액'),
                Expanded(
                  child: buildTextFormFieldForAmount(
                      inputText: '${account.amount ?? 0}', onSaved: (val) {}, validator: (val) {}),
                )
              ],
            ),
          ),
          Container(
            margin: const EdgeInsets.symmetric(vertical: 5),
            child: Row(
              children: [
                buildText(titleText: '메모'),
                Expanded(
                  child: buildTextFormForMemo(inputText: account.memo ?? '', onSaved: (val) {}, validator: (val) {}),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }

  Container buildText({required String titleText}) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 15),
      child: Text(
        titleText,
        style: TextStyle(fontSize: Get.textTheme.titleMedium!.fontSize!),
      ),
    );
  }

  TextFormField buildTextFormForDate(
      {required String inputText, Function(String?)? onSaved, String? Function(String?)? validator}) {
    return TextFormField(
      onSaved: onSaved,
      validator: validator,
      controller: TextEditingController(text: inputText),
      maxLines: 1,
      autofocus: false,
      style: TextStyle(fontSize: Get.textTheme.bodyMedium!.fontSize!),
      decoration: const InputDecoration(
          contentPadding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
          isDense: true,
          border: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(10)),
              borderSide: BorderSide(width: 1, color: Colors.black))),
    );
  }

  TextFormField buildTextFormFieldForAmount(
      {required String inputText, Function(String?)? onSaved, String? Function(String?)? validator}) {
    return TextFormField(
      onSaved: onSaved,
      validator: validator,
      controller: TextEditingController(text: inputText),
      maxLines: 1,
      autofocus: false,
      textInputAction: TextInputAction.next,
      keyboardType: const TextInputType.numberWithOptions(decimal: true),
      inputFormatters: [
        FilteringTextInputFormatter.allow(RegExp(r'^\d+\.?\d{0,2}')),
      ],
      style: TextStyle(fontSize: Get.textTheme.bodyMedium!.fontSize!),
      decoration: const InputDecoration(
          contentPadding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
          isDense: true,
          border: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(10)),
              borderSide: BorderSide(width: 1, color: Colors.black))),
    );
  }

  TextFormField buildTextFormForMemo(
      {required String inputText, Function(String?)? onSaved, String? Function(String?)? validator}) {
    return TextFormField(
      onSaved: onSaved,
      validator: validator,
      controller: TextEditingController(text: inputText),
      maxLines: 10,
      maxLength: 1000,
      autofocus: false,
      style: TextStyle(fontSize: Get.textTheme.bodyMedium!.fontSize!),
      cursorHeight: Get.textTheme.bodyMedium!.fontSize! + 5,
      decoration: const InputDecoration(
          contentPadding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
          isDense: true,
          border: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(10)),
              borderSide: BorderSide(width: 1, color: Colors.black))),
    );
  }
}
