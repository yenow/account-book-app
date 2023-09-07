
import 'package:account_book/get/controller/page/is_loading_controller.dart';
import 'package:account_book/get/controller/page/setting_page_controller.dart';
import 'package:account_book/get/controller/user_controller.dart';
import 'package:account_book/route.dart';
import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_profile_picture/flutter_profile_picture.dart';
import 'package:get/get.dart';

import '../../../common/log_config.dart';
import '../component/setting_row.dart';

class SettingPage extends StatelessWidget {
  const SettingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("설정"),
      ),
      body: buildBody(),
    );
  }

  Container buildBody() {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 0),
      child: ListView(
        children: [
          headerRow('계정'),
          googleAccount(),
          headerRow('기본'),
          basicMenu(),
          headerRow('분류/자산'),
          assetMenu(),
        ],
      ),
    );
  }

  /// 기본 메뉴 목록
  Container basicMenu() {
    return Container(
      decoration: BoxDecoration(
        color: Get.theme.colorScheme.tertiary,
        border: Border.all(width: 0.2, color: Get.theme.colorScheme.outline),
      ),
      child: ListView(shrinkWrap: true, children: [
        SettingRow(
          text: '버전 및 공지사항',
          icon: const Icon(FluentIcons.alert_20_regular),
          onTap: () async {
            Get.toNamed(AppRoute.notifyScreen);
          },
        ),
        SettingRow(
          text: '다크모드',
          icon: const Icon(FluentIcons.color_20_regular),
          onTap: () async {
            await Get.toNamed(AppRoute.darkmodeScreen);
          },
        ),
      ]),
    );
  }

  /// 구글 계정
  Container googleAccount() {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
      decoration: BoxDecoration(
        color: Get.theme.colorScheme.tertiary,
        border: Border.all(width: 0.2, color: Get.theme.colorScheme.outline),
      ),
      child: Row(
        children: [
          UserController.to.user.value.photoUrl != null
              ? ProfilePicture(
                  name: UserController.to.user.value.name ?? 'No Name',
                  // img: UserController.to.user.value.photoUrl ?? '',
                  radius: Get.textTheme.headlineSmall!.fontSize!,
                  fontsize: Get.textTheme.bodyLarge!.fontSize!,
                  tooltip: true,
                )
              : const Icon(
                  FluentIcons.person_circle_20_filled,
                  size: 40,
                ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Text(
              UserController.to.user.value.name ?? 'No Name',
              style: Get.textTheme.bodyLarge,
            ),
          ),
          Expanded(
            child: Align(
              alignment: Alignment.centerRight,
              child: SizedBox(
                width: 100,
                height: 30,
                child: ElevatedButton(
                  onPressed: SettingPageController.to.singOutGoogle, // 로그아웃
                  style: ButtonStyle(
                    elevation: MaterialStateProperty.all(2.0),
                    backgroundColor: MaterialStateProperty.all(Get.theme.colorScheme.background),
                    shape: MaterialStateProperty.all(
                      RoundedRectangleBorder(
                        side: BorderSide(color: Get.theme.colorScheme.onBackground, width: 0.2),
                        borderRadius: const BorderRadius.all(
                          Radius.circular(8),
                        ),
                      ),
                    ),
                  ),
                  child: Text(
                    '로그아웃',
                    style: Get.textTheme.bodyLarge,
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  Padding headerRow(String text) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 0),
      child: Center(
        child: Text(text, style: Get.textTheme.titleSmall),
      ),
    );
  }

  // 분류 자산
  Container assetMenu() {
    return Container(
      decoration: BoxDecoration(
        color: Get.theme.colorScheme.tertiary,
        border: Border.all(width: 0.2, color: Get.theme.colorScheme.outline),
      ),
      child: ListView(shrinkWrap: true, children: [
        SettingRow(
          text: '수입 관리',
          icon: const Icon(FluentIcons.channel_add_20_regular),
          onTap: () async {
            Get.toNamed(AppRoute.incomeCategoryManagement);
          },
        ),
        SettingRow(
          text: '지출 관리',
          icon: const Icon(FluentIcons.channel_subtract_20_regular),
          onTap: () {
            Get.toNamed(AppRoute.expenseCategoryManagement);
          },
        ),
        // SettingRow(
        //   text: '자산 관리',
        //   icon: const Icon(FluentIcons.channel_arrow_left_20_regular),
        //   onTap: () {},
        // ),
      ]),
    );
  }
}

SizedBox snackBarTest() {
  return SizedBox(
    width: 100,
    height: 30,
    child: ElevatedButton(
      child: const Text('스낵바 테스트'),
      onPressed: () {
        Get.snackbar(
          '타이틀',
          '메세지 입니다.',
          barBlur: 3.0,
          borderWidth: 0.2,
          borderColor: Get.theme.colorScheme.outline,
          backgroundColor: Get.theme.colorScheme.background,
          colorText: Get.theme.colorScheme.onBackground,
        );
      },
    ),
  );
}

SizedBox circleIndicatorTest() {
  return SizedBox(
    width: 100,
    height: 30,
    child: ElevatedButton(
      child: const Text('circle indicator'),
      onPressed: () async {
        dlog.i('start');
        IsLoadingController.to.isLoading(true);
        await Future.delayed(const Duration(seconds: 2));
        IsLoadingController.to.isLoading(false);
        dlog.i('end');
      },
    ),
  );
}
