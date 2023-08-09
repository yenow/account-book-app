import 'package:account_book/data/client/clients.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:flutter_signin_button/button_list.dart';
import 'package:flutter_signin_button/button_view.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';

import '../../common/log_config.dart';
import '../../common/widget/loader.dart';
import '../../get/controller/screen/login_screen_controller.dart';
import '../../main.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);
  static const storage = FlutterSecureStorage(); //flutter_secure_storage 사용을 위한 초기화 작업

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Loader(
          child: Container(
            constraints: const BoxConstraints.expand(),
            decoration: BoxDecoration(
              image: DecorationImage(
                image: const AssetImage('assets/images/login.jpg'),
                fit: BoxFit.fitHeight,
                opacity: 0.9,
                colorFilter: ColorFilter.mode(Get.theme.colorScheme.onBackground, BlendMode.color),
              ),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(vertical: 60),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.home, size: Get.textTheme.headlineMedium?.fontSize, color: Get.theme.colorScheme.background,),
                          Text('가계부 시작하기', style: TextStyle(fontSize: Get.textTheme.headlineMedium!.fontSize, color: Get.theme.colorScheme.background),),
                        ],
                      ),
                    ],
                  ),
                ),
                Container(
                  padding: const EdgeInsets.symmetric(vertical: 60),
                  child: SignInButton(
                    padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 20),
                    Buttons.Google,
                    elevation: 3.0,
                    onPressed: LoginScreenController.to.signIn,   // 로그인
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
