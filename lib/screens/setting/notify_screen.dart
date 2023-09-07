import 'package:account_book/data/model/notify.dart';
import 'package:account_book/get/controller/screen/notify_screen_controller.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class NotifyScreen extends StatelessWidget {
  const NotifyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text("공지사항"),
        ),
        body: Obx(() => isLoading()),
      ),
    );
  }

  Widget isLoading() {
    return NotifyScreenController.to.isLoading.value ? Center(
      child: CircularProgressIndicator(
        color: Get.theme.colorScheme.primary,

      ),
    ) : body();
  }

  Widget body() {
    if (NotifyScreenController.to.notifyList.value.isEmpty) {
      return Container(
        alignment: Alignment.center,
        child: const Text('공지사항이 없습니다.'),
      );
    }

    return ListView.separated(
      shrinkWrap: true,
      itemCount: NotifyScreenController.to.notifyList.value.length,
      itemBuilder: (context, index) {
        Notify notify = NotifyScreenController.to.notifyList.value.elementAt(index);

        return Container(
          color: Get.theme.colorScheme.tertiary,
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              SizedBox(
                width: double.infinity,
                child: Padding(
                  padding: const EdgeInsets.only(top: 5, bottom: 5),
                  child: Text(
                    notify.title!,
                    textAlign: TextAlign.left,
                    style: Get.textTheme.titleSmall,
                  ),
                ),
              ),
              SizedBox(
                width: double.infinity,
                child: AutoSizeText(
                  notify.content!,
                  maxLines: 3,
                  overflow: TextOverflow.ellipsis,
                  textAlign: TextAlign.left,
                  style: Get.textTheme.bodyMedium,
                ),
              ),
              SizedBox(
                width: double.infinity,
                child: Text(
                  notify.modificationDate!,
                  textAlign: TextAlign.right,
                  style: Get.textTheme.bodySmall,
                ),
              ),
            ],
          ),
        );
      },
      separatorBuilder: (context, index) {
        return Divider(
          color: Get.theme.colorScheme.outline,
          height: 0.5,
        );
      },
    );
  }
}
