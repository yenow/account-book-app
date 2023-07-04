
import 'package:account_book/constants.dart';
import 'package:account_book/data/model/trade.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeScreenController extends GetxController {
  static HomeScreenController get to => Get.find();
  final PageController pageController = PageController();
  final selectIndex = 0.obs;

  void onTap(int index) {
    selectIndex(index);
    pageController.animateToPage(index, duration: const Duration(milliseconds: 500), curve: Curves.ease);
  }

  void onPageChanged(int index) {
    log.i('pageIndex = $index');
    selectIndex(index);
  }
}