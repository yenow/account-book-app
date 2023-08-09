import 'package:json_annotation/json_annotation.dart';

import '../../model/base_model.dart';

part 'login_request.g.dart';

@JsonSerializable()
class LoginRequest extends BaseModel {
  String? email;
  String? name;
  String? accessToken;
  String? photoUrl;


  LoginRequest({this.email, this.name, this.accessToken, this.photoUrl});

  factory LoginRequest.fromJson(Map<String, dynamic> json) => _$LoginRequestFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$LoginRequestToJson(this);
}