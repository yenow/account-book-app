// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:account_book/common/log_config.dart';
import 'package:account_book/data/client/clients.dart';
import 'package:account_book/data/client/login_client.dart';
import 'package:account_book/data/dto/login/login_request.dart';
import 'package:account_book/data/dto/login/login_response.dart';
import 'package:account_book/data/dto/single_response.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:account_book/main.dart';

void main() async {
  test('login', () async {
    Dio testDio = addInterceptor(Dio(
      BaseOptions(
        baseUrl: 'http://192.168.0.6:8080',
        contentType: Headers.jsonContentType,
        responseType: ResponseType.json,
        connectTimeout: const Duration(seconds: 10),
        receiveTimeout: const Duration(seconds: 10),
        validateStatus: (_) => true,
      ),
    ));

    await testDio.get('/test/api');

    LoginClient loginClient = LoginClient(testDio);
    loginClient.login(
      loginRequest: LoginRequest(
        name: '윤신영',
        email: 'nalraysy3@gmail.com',
        accessToken: '',
        photoUrl: '',
      ),
    ).then((SingleResponse<LoginResponse> response) {
      // 성공
      log.i(response.data!.user);
      log.i(response.data!.accessToken);
      log.i(response.data!.refreshToken);
      expect(response.data!.user!.email, 'nalraysy3@gmail.com');

      // Get.toNamed(AppRoute.root);
    }).catchError((error) {
      // 실패
      log.e(error);
    });
  });

}
