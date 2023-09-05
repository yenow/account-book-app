import 'package:dio/dio.dart';

import '../../get/controller/page/is_loading_controller.dart';

class LoadingInterceptor extends Interceptor {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    IsLoadingController.to.isLoading(true);
    super.onRequest(options, handler);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    IsLoadingController.to.isLoading(false);
    super.onResponse(response, handler);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    IsLoadingController.to.isLoading(false);
    super.onError(err, handler);
  }
}
