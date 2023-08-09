import 'package:json_annotation/json_annotation.dart';

import 'base_model.dart';

part 'trade.g.dart';

@JsonSerializable()
class Trade extends BaseModel {
  int? tradeId;
  String? tradeDate;
  DateTime? realTradeDate;
  String? tradeType;
  String? typeName;
  int? amount;
  int? incomeOrExpenseAccountId;
  String? incomeOrExpenseAccountName;
  int? assetAccountId;
  String? assetAccountName;
  int? depositAccountId;
  String? depositAccountName;
  int? withdrawAccountId;
  String? withdrawAccountName;
  String? content;
  String? memo;

  Trade(
      {this.tradeId,
      this.tradeDate,
      this.realTradeDate,
      this.tradeType,
      this.typeName,
      this.amount,
      this.incomeOrExpenseAccountId,
      this.incomeOrExpenseAccountName,
      this.assetAccountId,
      this.assetAccountName,
      this.depositAccountId,
      this.depositAccountName,
      this.withdrawAccountId,
      this.withdrawAccountName,
      this.content,
      this.memo});

  factory Trade.fromJson(Map<String, dynamic> json) => _$TradeFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$TradeToJson(this);
}

enum TradeType {
  income('수입'),
  expense('지출'),
  transfer('이체'); // asset('자산'), debt('빚')

  const TradeType(this.tradeTypeName);

  final String tradeTypeName;
}
