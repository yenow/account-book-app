import 'package:account_book/common/interceptor/auth_interceptor.dart';
import 'package:account_book/common/interceptor/error_interceptor.dart';
import 'package:account_book/data/client/chart_client.dart';
import 'package:account_book/data/client/login_client.dart';
import 'package:account_book/data/client/notify_client.dart';
import 'package:account_book/data/client/trade_client.dart';
import 'package:dio/dio.dart';
import 'package:dio/dio.dart';
import 'package:dio/dio.dart';

import '../../common/interceptor/loading_interceptor.dart';
import '../../common/interceptor/log_interceptor.dart';
import 'account_client.dart';

Dio dio = addInterceptor(Dio(
  BaseOptions(
    baseUrl: 'http://192.168.0.6:8080',
    contentType: Headers.jsonContentType,
    responseType: ResponseType.json,
    connectTimeout: const Duration(seconds: 10),
    receiveTimeout: const Duration(seconds: 10),
    validateStatus: (_) => true,
  ),
));

Dio addInterceptor(Dio dio) {
  dio.interceptors.add(LoadingInterceptor());
  dio.interceptors.add(AuthInterceptor());
  dio.interceptors.add(LoggingInterceptor());
  dio.interceptors.add(ErrorInterceptor());
  return dio;
}

const baseUrl = 'http://192.168.0.6:8080';

final accountClient = AccountClient(dio);
final tradeClient = TradeClient(dio);
final loginClient = LoginClient(dio);
final chartClient = ChartClient(dio);
final notifyClient = NotifyClient(dio);
