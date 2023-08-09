// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'account_request_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AccountRequestDto _$AccountRequestDtoFromJson(Map<String, dynamic> json) =>
    AccountRequestDto(
      userId: json['userId'] as int?,
      userKey: json['userKey'] as String?,
      accountId: json['accountId'] as int?,
      accountName: json['accountName'] as String?,
      groupAccountId: json['groupAccountId'] as int?,
      groupAccountName: json['groupAccountName'] as String?,
      amount: json['amount'] as int?,
      level: json['level'] as int?,
      assetType: $enumDecodeNullable(_$AssetTypeEnumMap, json['assetType']),
    );

Map<String, dynamic> _$AccountRequestDtoToJson(AccountRequestDto instance) =>
    <String, dynamic>{
      'userId': instance.userId,
      'userKey': instance.userKey,
      'accountId': instance.accountId,
      'accountName': instance.accountName,
      'groupAccountId': instance.groupAccountId,
      'groupAccountName': instance.groupAccountName,
      'amount': instance.amount,
      'level': instance.level,
      'assetType': _$AssetTypeEnumMap[instance.assetType],
    };

const _$AssetTypeEnumMap = {
  AssetType.group: 'group',
  AssetType.asset: 'asset',
};
