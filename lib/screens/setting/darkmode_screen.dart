import 'package:account_book/get/controller/app_controller.dart';
import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DarkModeScreen extends StatelessWidget {
  const DarkModeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => SafeArea(
        child: Scaffold(
          appBar: AppBar(
            title: const Text("다크 모드"),
          ),
          body: body(),
        ),
      ),
    );
  }

  Container body() {
    return Container(
      height: 100,
      alignment: Alignment.center,
      child: ToggleButtons(
        isSelected: [AppController.to.isDarkMode.value, !AppController.to.isDarkMode.value],
        color: Get.theme.colorScheme.onBackground,
        selectedColor: Get.theme.colorScheme.primary,
        borderColor: Get.theme.colorScheme.onBackground,
        borderWidth: 0.1,
        borderRadius: const BorderRadius.all(Radius.circular(10)),
        selectedBorderColor: Get.theme.colorScheme.primary,
        onPressed: (index) {
          if (index == 0) {
            AppController.to.toDarkMode();
          } else {
            AppController.to.toWhiteMode();
          }
        },
        children: [
          Container(
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
            child: Row(
              children: const [
                Icon(FluentIcons.dark_theme_20_regular),
                Text('다크 모드'),
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
            child: Row(
              children: const [
                Icon(FluentIcons.dark_theme_20_regular),
                Text('화이트 모드'),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
