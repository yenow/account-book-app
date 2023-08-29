import 'package:json_annotation/json_annotation.dart';

import '../../model/base_model.dart';
import '../../model/user.dart';

part 'login_response.g.dart';

@JsonSerializable()
class LoginResponse extends BaseModel {
  String? accessToken;
  String? refreshToken;
  User? user;

  LoginResponse(this.accessToken, this.refreshToken, this.user);

  factory LoginResponse.fromJson(Map<String, dynamic> json) => _$LoginResponseFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$LoginResponseToJson(this);
}