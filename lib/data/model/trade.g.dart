// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'trade.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Trade _$TradeFromJson(Map<String, dynamic> json) => Trade(
      tradeId: json['tradeId'] as int?,
      tradeDate: json['tradeDate'] as String?,
      realTradeDate: json['realTradeDate'] == null
          ? null
          : DateTime.parse(json['realTradeDate'] as String),
      tradeType: json['tradeType'] as String?,
      typeName: json['typeName'] as String?,
      amount: json['amount'] as int?,
      incomeOrExpenseAccountId: json['incomeOrExpenseAccountId'] as int?,
      incomeOrExpenseAccountName: json['incomeOrExpenseAccountName'] as String?,
      assetAccountId: json['assetAccountId'] as int?,
      assetAccountName: json['assetAccountName'] as String?,
      depositAccountId: json['depositAccountId'] as int?,
      depositAccountName: json['depositAccountName'] as String?,
      withdrawAccountId: json['withdrawAccountId'] as int?,
      withdrawAccountName: json['withdrawAccountName'] as String?,
      content: json['content'] as String?,
      memo: json['memo'] as String?,
    );

Map<String, dynamic> _$TradeToJson(Trade instance) => <String, dynamic>{
      'tradeId': instance.tradeId,
      'tradeDate': instance.tradeDate,
      'realTradeDate': instance.realTradeDate?.toIso8601String(),
      'tradeType': instance.tradeType,
      'typeName': instance.typeName,
      'amount': instance.amount,
      'incomeOrExpenseAccountId': instance.incomeOrExpenseAccountId,
      'incomeOrExpenseAccountName': instance.incomeOrExpenseAccountName,
      'assetAccountId': instance.assetAccountId,
      'assetAccountName': instance.assetAccountName,
      'depositAccountId': instance.depositAccountId,
      'depositAccountName': instance.depositAccountName,
      'withdrawAccountId': instance.withdrawAccountId,
      'withdrawAccountName': instance.withdrawAccountName,
      'content': instance.content,
      'memo': instance.memo,
    };
