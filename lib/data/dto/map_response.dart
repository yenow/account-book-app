import 'package:json_annotation/json_annotation.dart';
import '../../common/log_config.dart';
import 'base_response.dart';

@JsonSerializable(genericArgumentFactories: true)
class MapResponse<T> extends BaseResponse {
  Map<String,List<T>> data;

  MapResponse({
    String? timestamp,
    String? state,
    int? errorCode,
    String? message,
    required this.data,
  }) : super(timestamp: timestamp, state: state, message: message, errorCode: errorCode, body: data);

  factory MapResponse.fromJson(Map<String, dynamic> json, Function(Map<String, dynamic>) create) {

    // Map<String,List<T>>? data = Map<String,List<T>>.from(json['data']);
    Map<String, List<T>> data = {};

    var jsonMap = json['data'] as Map<String, dynamic>;

    jsonMap.forEach((String key, value) {
      var listData = <T>[];

      var jsonList = jsonMap[key];
      jsonList.forEach((v) {
        listData.add(create(v));
      });

      data[key] = listData;
    });


    return MapResponse<T>(
      timestamp: json["timestamp"],
      state: json["state"],
      message: json["message"],
      data: data,
    );
  }
}
