
import 'package:account_book/common/log_config.dart';
import 'package:account_book/data/client/clients.dart';
import 'package:account_book/data/client/trade_client.dart';
import 'package:account_book/get/controller/user_controller.dart';
import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get/get.dart' hide Response;

void main() async {
  Get.put(UserController());

  group('test', () {
    test('test', () async {
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

      Response response = await testDio.get('/test/api', data: {"message": "success"});
      // log.i(response);
    });
  });
}