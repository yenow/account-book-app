import 'package:account_book/data/client/clients.dart';
import 'package:account_book/data/dto/login/login_request.dart';
import 'package:account_book/data/dto/login/login_response.dart';
import 'package:account_book/data/dto/single_response.dart';
import 'package:account_book/get/controller/page/is_loading_controller.dart';
import 'package:account_book/get/controller/user_controller.dart';
import 'package:account_book/route.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';

import '../../../common/log_config.dart';
import '../../../main.dart';

class LoginScreenController extends GetxController {
  static LoginScreenController get to => Get.find();

  // 로그인
  Future<void> signIn() async {
    IsLoadingController.to.isLoading(true);

    try {
      await googleLogin();
    } catch(e) {
      log.e(e);
    } finally {
      IsLoadingController.to.isLoading(false);
    }
  }

  /// 구글 로그인
  Future<void> googleLogin() async {
    final GoogleSignInAccount? googleUser = await googleSignIn.signIn();

    // Obtain the auth details from the request
    final GoogleSignInAuthentication? googleAuth = await googleUser?.authentication;

    if (googleUser != null) {
      log.i('로그인 정보 = $googleUser');
    }

    // Create a new credential
    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken,
      idToken: googleAuth?.idToken,
    );

    Future.delayed(const Duration(seconds: 1));

    // 로그인 API
    loginClient.login(
      loginRequest: LoginRequest(
        name: googleUser!.displayName,
        email: googleUser.email,
        accessToken: googleAuth?.accessToken,
        photoUrl: googleUser.photoUrl,
      ),
    ).then((SingleResponse<LoginResponse> response) {
      // 성공
      UserController.to.user(response.data!.user);
      UserController.to.setToken(response.data!.accessToken!, response.data!.refreshToken!);

      Get.toNamed(AppRoute.homeScreen);
    }).catchError((error) {
      // 실패
      throw error;
    });
  }
}
