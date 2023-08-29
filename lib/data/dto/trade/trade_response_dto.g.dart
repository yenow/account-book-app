// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'trade_response_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TradeResponseDto _$TradeResponseDtoFromJson(Map<String, dynamic> json) =>
    TradeResponseDto(
      tradeId: json['tradeId'] as int?,
      userId: json['userId'] as int?,
      tradeDate: json['tradeDate'] as String?,
      realTradeDate: json['realTradeDate'] == null
          ? null
          : DateTime.parse(json['realTradeDate'] as String),
      tradeType: json['tradeType'] as String?,
      typeName: json['typeName'] as String?,
      amount: json['amount'] as int?,
      accountId: json['accountId'] as int?,
      accountName: json['accountName'] as String?,
      assetAccountId: json['assetAccountId'] as int?,
      assetAccountName: json['assetAccountName'] as String?,
      incomeAccountId: json['incomeAccountId'] as int?,
      incomeAccountName: json['incomeAccountName'] as String?,
      expenseAccountId: json['expenseAccountId'] as int?,
      expenseAccountName: json['expenseAccountName'] as String?,
      content: json['content'] as String?,
      memo: json['memo'] as String?,
    );

Map<String, dynamic> _$TradeResponseDtoToJson(TradeResponseDto instance) =>
    <String, dynamic>{
      'tradeId': instance.tradeId,
      'userId': instance.userId,
      'tradeDate': instance.tradeDate,
      'realTradeDate': instance.realTradeDate?.toIso8601String(),
      'tradeType': instance.tradeType,
      'typeName': instance.typeName,
      'amount': instance.amount,
      'accountId': instance.accountId,
      'accountName': instance.accountName,
      'assetAccountId': instance.assetAccountId,
      'assetAccountName': instance.assetAccountName,
      'incomeAccountId': instance.incomeAccountId,
      'incomeAccountName': instance.incomeAccountName,
      'expenseAccountId': instance.expenseAccountId,
      'expenseAccountName': instance.expenseAccountName,
      'content': instance.content,
      'memo': instance.memo,
    };
