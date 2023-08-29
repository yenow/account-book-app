// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'asset.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Asset _$AssetFromJson(Map<String, dynamic> json) => Asset(
      accountId: json['accountId'] as int?,
      accountName: json['accountName'] as String?,
      groupAccountId: json['groupAccountId'] as int?,
      groupAccountName: json['groupAccountName'] as String?,
      sumAmount: json['sumAmount'] as int?,
      level: json['level'] as int?,
      assetType: $enumDecodeNullable(_$AssetTypeEnumMap, json['assetType']),
    );

Map<String, dynamic> _$AssetToJson(Asset instance) => <String, dynamic>{
      'accountId': instance.accountId,
      'accountName': instance.accountName,
      'groupAccountId': instance.groupAccountId,
      'groupAccountName': instance.groupAccountName,
      'sumAmount': instance.sumAmount,
      'level': instance.level,
      'assetType': _$AssetTypeEnumMap[instance.assetType],
    };

const _$AssetTypeEnumMap = {
  AssetType.group: 'group',
  AssetType.asset: 'asset',
};
