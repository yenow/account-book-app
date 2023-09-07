import 'package:dio/dio.dart';

import '../log_config.dart';

class LoggingInterceptor extends Interceptor {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    dlog.i('LoggingInterceptor onRequest');

    String header = '';
    options.headers.forEach((k, v) => header = '$header, $k: $v\n');
    String queryParameters = '';
    options.queryParameters.forEach((k, v) => queryParameters = '$queryParameters, $k: $v\n');

    log.i("--> ${options.method.toUpperCase()} ${options.baseUrl}${options.path}\n"
        "Headers: "
        "$header\n"
        "queryParameters:\n"
        "$queryParameters"
        "Request Body: ${options.data}\n");
    super.onRequest(options, handler);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    log.i("<-- ${err.message} ${err.response?.requestOptions.baseUrl}${err.response?.requestOptions.path}\n"
        "${err.response!.data ?? ''}\n");
    super.onError(err, handler);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    dlog.i('LoggingInterceptor onResponse');

    String header = '';
    response.headers.forEach((k, v) => header = '$header, $k: $v\n');

    log.i("<-- ${response.statusCode} ${response.requestOptions.baseUrl}${response.requestOptions.path}\n"
        "Headers: "
        "$header\n"
        "Response Body: ${response.data}\n");
    super.onResponse(response, handler);
  }
}
