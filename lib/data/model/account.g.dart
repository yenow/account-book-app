// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'account.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Account _$AccountFromJson(Map<String, dynamic> json) => Account(
      accountId: json['accountId'],
      parentAccountId: json['parentAccountId'],
      accountType: json['accountType'],
      accountName: json['accountName'],
      description: json['description'],
      level: json['level'],
      isLeaf: json['isLeaf'],
    );

Map<String, dynamic> _$AccountToJson(Account instance) => <String, dynamic>{
      'accountId': instance.accountId,
      'isLeaf': instance.isLeaf,
      'level': instance.level,
      'description': instance.description,
      'accountName': instance.accountName,
      'accountType': instance.accountType,
      'parentAccountId': instance.parentAccountId,
    };
