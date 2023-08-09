import 'dart:convert';

import 'package:account_book/get/controller/page/is_loading_controller.dart';
import 'package:account_book/get/controller/page/setting_page_controller.dart';
import 'package:account_book/get/controller/user_controller.dart';
import 'package:account_book/route.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_profile_picture/flutter_profile_picture.dart';
import 'package:flutter_signin_button/button_list.dart';
import 'package:flutter_signin_button/button_view.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:oauth2_client/access_token_response.dart';
import 'package:oauth2_client/google_oauth2_client.dart';
import 'package:oauth2_client/oauth2_client.dart';
import 'package:oauth2_client/oauth2_helper.dart';

import '../../../common/log_config.dart';
import '../../../common/widget/loader.dart';
import '../../../data/client/clients.dart';
import '../../../main.dart';
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
          Container(
            decoration: BoxDecoration(
              color: Get.theme.colorScheme.surface,
              border: Border.all(width: 0.2, color: Get.theme.colorScheme.outline),
            ),
            child: ListView(shrinkWrap: true, children: [
              SettingRow(
                text: '택스트',
                icon: const Icon(Icons.add_circle_outline),
                onTap: () {},
              ),
              SettingRow(
                text: '택스트',
                icon: const Icon(Icons.add_circle_outline),
                onTap: () {},
              ),
            ]),
          ),
          headerRow('분류/자산'),
          SizedBox(
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
          ),
          SizedBox(
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
          ),
        ],
      ),
    );
  }

  /// 구글 계정
  Container googleAccount() {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
      decoration: BoxDecoration(
        color: Get.theme.colorScheme.surface,
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
                  CupertinoIcons.person_circle_fill,
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
}
