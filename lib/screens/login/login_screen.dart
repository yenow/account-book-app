
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);
  static const storage = FlutterSecureStorage(); //flutter_secure_storage 사용을 위한 초기화 작업

  @override
  Widget build(BuildContext context) {

    return SafeArea(
      child: Scaffold(
        body: Container(
          child: const Text('로그인 페이지'),
        ),
      ),
    );
  }
}
