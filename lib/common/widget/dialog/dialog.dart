import 'package:flutter/material.dart';
import 'package:get/get.dart';

Future<dynamic> deleteDialog() {
  return Get.defaultDialog(
    title: '알림',
    titlePadding: const EdgeInsets.symmetric(vertical: 15),
    titleStyle: TextStyle(fontSize: Get.textTheme.titleMedium!.fontSize, color: Get.theme.colorScheme.onBackground),
    backgroundColor: Get.theme.colorScheme.background,
    buttonColor: Get.theme.colorScheme.primary,
    content: Container(
      padding: const EdgeInsets.fromLTRB(0, 0, 0, 10),
      child: Text(
        '삭제하시겠습니까?',
        style: TextStyle(fontSize: Get.textTheme.bodyLarge!.fontSize, color: Get.theme.colorScheme.onBackground),
      ),
    ),
    textConfirm: '예',
    confirmTextColor: Get.theme.colorScheme.onPrimary,
    onConfirm: () {
      Get.back(result: true);
    },
    textCancel: '아니요',
    cancelTextColor: Get.theme.colorScheme.primary,
    onCancel: () {
    }
  );
}

Future<dynamic> errorDialog(String message) {
  return Get.defaultDialog(
    title: '오류',
    titlePadding: const EdgeInsets.symmetric(vertical: 15),
    titleStyle: TextStyle(fontSize: Get.textTheme.titleMedium!.fontSize, color: Get.theme.colorScheme.onBackground),
    backgroundColor: Get.theme.colorScheme.background,
    buttonColor: Get.theme.colorScheme.primary,
    content: Text(
      message,
      style: TextStyle(fontSize: Get.textTheme.bodyLarge!.fontSize, color: Get.theme.colorScheme.onBackground),
    ),
  );
}

