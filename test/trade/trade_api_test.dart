import 'package:account_book/common/log_config.dart';
import 'package:account_book/data/client/clients.dart';
import 'package:account_book/data/client/trade_client.dart';
import 'package:account_book/data/dto/map_response.dart';
import 'package:account_book/data/model/trade.dart';
import 'package:account_book/get/controller/user_controller.dart';
import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

void main() async {
  Get.put(UserController());

  String accessToken = 'eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJwaGFudG9tX3lzeUBuYXZlci5jb20iLCJyb2xlIjoiUk9MRV9VU0VSIiwiaXNzIjoieXN5IiwiaWF0IjoxNjkxNDM1NzgzLCJleHAiOjE2OTIwNDA1ODN9.u65wKOz2JYWWGTY0H0XMFZyzVlGi_j1hwv4tMZXrKR4';

  Dio testDio = addInterceptor(Dio(
    BaseOptions(
      baseUrl: 'http://192.168.0.6:8080',
      contentType: Headers.jsonContentType,
      responseType: ResponseType.json,
      connectTimeout: const Duration(seconds: 10),
      receiveTimeout: const Duration(seconds: 10),
      validateStatus: (_) => true,
      headers: {
        'Authorization' : 'Bearer $accessToken'
      }
    ),
  ));


  group('trade_api_test.dart', () {
    test('trade_api_test.dart', () async {
      final tradeClient = TradeClient(testDio);
      MapResponse<Trade> mapResponse = await tradeClient.findAllTradeOfUser();
      log.i(mapResponse);
    });
  });
}

