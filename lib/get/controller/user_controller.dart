import 'package:account_book/common/exception/user_not_found_exception.dart';
import 'package:account_book/data/client/clients.dart';
import 'package:account_book/route.dart';
import 'package:get/get.dart';

import '../../common/constant/status.dart';
import '../../common/log_config.dart';
import '../../data/client/login_client.dart';
import '../../data/dto/login/login_response.dart';
import '../../data/dto/single_response.dart';
import '../../data/model/user.dart';
import '../../main.dart';

class UserController extends GetxController {
  static UserController get to => Get.find();
  final user = User().obs;
  String accessToken = '';
  String refreshToken = '';

  /// 초기화
  Future<void> initUser() async {
    accessToken = await storage.read(key: 'accessToken') ?? '';
    refreshToken = await storage.read(key: 'refreshToken') ?? '';
    log.i('accessToken = $accessToken');

    // 자동 로그인
    if (accessToken.isNotEmpty) {
      LoginClient loginClient = LoginClient(dio);
      await loginClient.autoLogin().then((SingleResponse<LoginResponse> response) {
        if (response.state == State.error.name) {
          throw AppException(errorCode: response.errorCode, errorMessage: response.message);
        }
        LoginResponse loginResponse = response.data!;
        user(loginResponse.user);
        setToken(loginResponse.accessToken!, loginResponse.refreshToken!);
      }).onError((error, stackTrace) {
        clearToken();
        user(User());
      });
    }
  }

  // 로그아웃
  Future<void> logout() async {
    await loginClient.logout().then((value) {
      clearToken();
    });
  }

  void setToken(String accessToken, String refreshToken) async {
    accessToken = accessToken;
    refreshToken = refreshToken;
    await storage.write(key: 'accessToken', value: accessToken);
    await storage.write(key: 'refreshToken', value: refreshToken);
  }

  void clearToken() async {
    dlog.i('clearToken() 실행');

    accessToken = '';
    refreshToken = '';
    await storage.write(key: 'accessToken', value: '');
    await storage.write(key: 'refreshToken', value: '');
  }
}
