import 'package:account_book/common/widget/dialog/dialog.dart';
import 'package:account_book/get/controller/user_controller.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart' hide Response;

import '../../data/dto/single_response.dart';
import '../constant/status.dart';
import '../exception/user_not_found_exception.dart';
import '../log_config.dart';

class ErrorInterceptor extends Interceptor {


  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    // dlog.i('${response.requestOptions.uri} : ErrorInterceptor onResponse, statusCode = ${response.statusCode}');

    if (response.statusCode == 500 || response.statusCode == 400) {
      String errorMessage = response.data["message"] as String;
      errorDialog(errorMessage);

      var dioException = DioException(requestOptions: response.requestOptions, message: errorMessage, response: response, error: errorMessage, type: DioExceptionType.badResponse);
      dioException.printError();
      throw dioException;
    }
    super.onResponse(response, handler);
  }
}
