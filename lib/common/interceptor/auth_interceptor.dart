import 'package:account_book/get/controller/user_controller.dart';
import 'package:device_info_plus/device_info_plus.dart';
import 'package:dio/dio.dart';

import '../function/device_info.dart';
import '../log_config.dart';
import '../object/device_info.dart';

class AuthInterceptor extends Interceptor {

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) async {
    dlog.d('AuthInterceptor onRequest');
    DeviceInfo deviceInfo = await getDeviceInfo();

    if (UserController.to.accessToken != '') {
      options.headers.addAll({
        "Authorization": "Bearer ${UserController.to.accessToken}",
        "refreshToken": UserController.to.refreshToken,
        "platform" :deviceInfo.platform,
        "device" :deviceInfo.device,
        "version" :deviceInfo.version,
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
