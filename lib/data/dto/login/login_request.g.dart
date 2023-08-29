// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LoginRequest _$LoginRequestFromJson(Map<String, dynamic> json) => LoginRequest(
      email: json['email'] as String?,
      name: json['name'] as String?,
      accessToken: json['accessToken'] as String?,
      photoUrl: json['photoUrl'] as String?,
    );

Map<String, dynamic> _$LoginRequestToJson(LoginRequest instance) =>
    <String, dynamic>{
      'email': instance.email,
      'name': instance.name,
      'accessToken': instance.accessToken,
      'photoUrl': instance.photoUrl,
    };
