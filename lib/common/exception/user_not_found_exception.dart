import 'package:dio/dio.dart';

class AppException  {
  int? errorCode;
  String? errorMessage;

  AppException({this.errorCode, this.errorMessage});
}
