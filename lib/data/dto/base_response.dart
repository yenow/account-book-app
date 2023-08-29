import 'package:json_annotation/json_annotation.dart';
import '../model/base_model.dart';

part 'base_response.g.dart';

@JsonSerializable()
class BaseResponse extends BaseModel {
  String? timestamp;
  String? state;
  int? errorCode;
  String? message;
  Object? body;

  BaseResponse({this.timestamp, this.state, this.message, this.errorCode, this.body});

  factory BaseResponse.fromJson(Map<String, dynamic> json) => _$BaseResponseFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$BaseResponseToJson(this);
}