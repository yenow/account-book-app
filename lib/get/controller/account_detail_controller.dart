
import 'package:account_book/data/model/trade.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AccountDetailController extends GetxController {
  static AccountDetailController get to => Get.find();
  final accounts = <Trade>[].obs;

  final textController = TextEditingController();
  final formKey = GlobalKey<FormState>();
}