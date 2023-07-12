import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SettingRow extends StatelessWidget {
  const SettingRow({super.key, required this.text, required this.icon, this.onTap});
  final String text;
  final Icon icon;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(10),
            child: icon,
          ),
          Text(text, style: Get.textTheme.bodyLarge,),
        ],
      ),
    );
  }
}
