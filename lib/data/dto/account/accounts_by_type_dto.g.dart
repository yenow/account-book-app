// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'accounts_by_type_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AccountsByTypeDto _$AccountsByTypeDtoFromJson(Map<String, dynamic> json) =>
    AccountsByTypeDto(
      incomeAccounts: (json['incomeAccounts'] as List<dynamic>?)
          ?.map((e) => Account.fromJson(e as Map<String, dynamic>))
          .toList(),
      expenseAccounts: (json['expenseAccounts'] as List<dynamic>?)
          ?.map((e) => Account.fromJson(e as Map<String, dynamic>))
          .toList(),
      assetAccounts: (json['assetAccounts'] as List<dynamic>?)
          ?.map((e) => Account.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$AccountsByTypeDtoToJson(AccountsByTypeDto instance) =>
    <String, dynamic>{
      'assetAccounts': instance.assetAccounts?.map((e) => e.toJson()).toList(),
      'expenseAccounts':
          instance.expenseAccounts?.map((e) => e.toJson()).toList(),
      'incomeAccounts':
          instance.incomeAccounts?.map((e) => e.toJson()).toList(),
    };
