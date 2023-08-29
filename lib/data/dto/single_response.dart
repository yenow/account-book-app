import 'package:json_annotation/json_annotation.dart';
import '../../common/log_config.dart';
import 'base_response.dart';

@JsonSerializable(genericArgumentFactories: true)
class SingleResponse<T> extends BaseResponse {
  T? data;

  SingleResponse({
    String? timestamp,
    String? state,
    int? errorCode,
    String? message,
    this.data,
  }) : super(timestamp: timestamp, state: state, message: message, errorCode: errorCode, body: data);

  factory SingleResponse.fromJson(Map<String, dynamic> json, Function(Map<String, dynamic>) create) {

    return SingleResponse<T>(
      timestamp: json["timestamp"],
      state: json["state"],
      message: json["message"],
      data: json["data"] is Map<String, dynamic> ? create(json["data"]) : null,
    );
  }
}
