import 'package:json_annotation/json_annotation.dart';

import 'base_model.dart';

part 'user.g.dart';

@JsonSerializable()
class User extends BaseModel {
  int? userId;
  String? name;
  String? email;
  String? photoUrl;

  User({this.userId, this.name, this.email, this.photoUrl});

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$UserToJson(this);
}
