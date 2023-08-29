// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'account_response_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AccountResponseDto _$AccountResponseDtoFromJson(Map<String, dynamic> json) =>
    AccountResponseDto(
      accountId: json['accountId'] as int?,
      parentAccountId: json['parentAccountId'] as int?,
      accountType: json['accountType'] as String?,
      accountName: json['accountName'] as String?,
      description: json['description'] as String?,
      level: json['level'] as int?,
      isLeaf: json['isLeaf'] as bool?,
    );

Map<String, dynamic> _$AccountResponseDtoToJson(AccountResponseDto instance) =>
    <String, dynamic>{
      'accountId': instance.accountId,
      'parentAccountId': instance.parentAccountId,
      'accountType': instance.accountType,
      'accountName': instance.accountName,
      'description': instance.description,
      'level': instance.level,
      'isLeaf': instance.isLeaf,
    };
