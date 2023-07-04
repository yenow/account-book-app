
import 'package:account_book/data/model/trade.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TradesPageController extends GetxController {
  static TradesPageController get to => Get.find();
  final trades = <Trade>[].obs;

  final textController = TextEditingController();
  final formKey = GlobalKey<FormState>();
}