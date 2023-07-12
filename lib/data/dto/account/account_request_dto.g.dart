// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'account_request_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AccountRequestDto _$AccountRequestDtoFromJson(Map<String, dynamic> json) =>
    AccountRequestDto(
      userId: json['userId'] as int?,
      userKey: json['userKey'] as String?,
    );

Map<String, dynamic> _$AccountRequestDtoToJson(AccountRequestDto instance) =>
    <String, dynamic>{
      'userId': instance.userId,
      'userKey': instance.userKey,
    };
