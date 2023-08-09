// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'trade_request_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TradeRequestDto _$TradeRequestDtoFromJson(Map<String, dynamic> json) =>
    TradeRequestDto(
      tradeId: json['tradeId'] as int?,
      userId: json['userId'] as int?,
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

Map<String, dynamic> _$TradeRequestDtoToJson(TradeRequestDto instance) =>
    <String, dynamic>{
      'tradeId': instance.tradeId,
      'userId': instance.userId,
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
