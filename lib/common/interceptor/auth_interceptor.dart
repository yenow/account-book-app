import 'package:package_info_plus/package_info_plus.dart';
import 'package:account_book/get/controller/user_controller.dart';
import 'package:dio/dio.dart';

import '../function/device_info_function.dart';
import '../log_config.dart';
import '../object/device_info.dart';

class AuthInterceptor extends Interceptor {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) async {
    dlog.d('AuthInterceptor onRequest');
    DeviceInfo deviceInfo = await getDeviceInfo();
    PackageInfo packageInfo = await PackageInfo.fromPlatform();

    if (UserController.to.accessToken != '') {
      options.headers.addAll({
        "Authorization": "Bearer ${UserController.to.accessToken}",
        "refreshToken": UserController.to.refreshToken,
        "platform": deviceInfo.platform,
        "device": deviceInfo.device,
        "device_version": deviceInfo.version,
        "app_version": packageInfo.version,
        "app_name": packageInfo.appName,
      });
    }
    super.onRequest(options, handler);
  }
}
