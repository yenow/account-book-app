import 'package:json_annotation/json_annotation.dart';
import 'base_response.dart';

@JsonSerializable(genericArgumentFactories: true)
class ListResponse<T> extends BaseResponse {
  List<T>? data;

  ListResponse({
    String? timestamp,
    String? state,
    int? errorCode,
    String? message,
    this.data,
  }) : super(timestamp: timestamp, state: state, message: message, errorCode: errorCode);

  factory ListResponse.fromJson(Map<String, dynamic> json, Function(Map<String, dynamic>) create) {
    var data = <T>[];

    json['data'].forEach((v) {
      data.add(create(v));
    });

    return ListResponse<T>(
      timestamp: json["timestamp"],
      state: json["state"],
      message: json["message"],
      data: data,
    );
  }
}
