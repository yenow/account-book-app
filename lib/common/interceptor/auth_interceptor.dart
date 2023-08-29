import 'package:account_book/get/controller/user_controller.dart';
import 'package:dio/dio.dart';

import '../log_config.dart';

class AuthInterceptor extends Interceptor {

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    dlog.i('AuthInterceptor onRequest');

    if (UserController.to.accessToken != '') {
      options.headers.addAll({
        "Authorization": "Bearer ${UserController.to.accessToken}",
        "refreshToken": UserController.to.refreshToken,
      });
    }
    super.onRequest(options, handler);
  }
}

    // if (response.headers.value("isRefresh") == "Y") {
    //   String? refreshToken = response.headers.value("refreshToken");
    //   String? accessToken = response.headers.value("accessToken");
    //
    //   if (refreshToken == null) {
    //     log.i("not found refreshToken");
    //     handler.reject(DioException(requestOptions: response.requestOptions, message: "인증 오류 발생"));
    //   } else if (accessToken == null) {
    //     log.i("not found accessToken");
    //     handler.reject(DioException(requestOptions: response.requestOptions, message: "인증 오류 발생"));
    //   }
    //
    //   UserController.to.setToken(accessToken!, refreshToken!);
    // }
