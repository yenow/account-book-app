import 'package:account_book/data/model/base_model.dart';
import 'package:account_book/data/model/trade.dart';
import 'package:json_annotation/json_annotation.dart';

part 'trade_request_dto.g.dart';

@JsonSerializable()
class TradeRequestDto extends BaseModel {
  int? tradeId;
  int? userId;
  String? tradeDate;
  DateTime? realTradeDate;
  String? tradeType;
  String? typeName;
  int? amount;

  int? accountId;
  String? accountName;
  int? assetAccountId;
  String? assetAccountName;
  int? incomeAccountId;
  String? incomeAccountName;
  int? expenseAccountId;
  String? expenseAccountName;
  String? content;
  String? memo;

  TradeRequestDto(
      {this.tradeId,
        this.userId,
        this.tradeDate,
        this.realTradeDate,
        this.tradeType,
        this.typeName,
        this.amount,
        this.accountId,
        this.accountName,
        this.assetAccountId,
        this.assetAccountName,
        this.incomeAccountId,
        this.incomeAccountName,
        this.expenseAccountId,
        this.expenseAccountName,
        this.content,
        this.memo});

  void setTrade(Trade trade) {
    tradeId = trade.tradeId;
    tradeDate = trade.tradeDate;
    realTradeDate = trade.realTradeDate;
    tradeType = trade.tradeType;
    typeName = trade.typeName;
    amount = trade.amount;
    accountId = trade.accountId;
    accountName = trade.accountName;
    assetAccountId = trade.assetAccountId;
    assetAccountName = trade.assetAccountName;
    incomeAccountId = trade.depositAccountId;
    incomeAccountName = trade.depositAccountName;
    expenseAccountId = trade.withdrawAccountId;
    expenseAccountName = trade.withdrawAccountName;
    content = trade.content;
    memo = trade.memo;
  }

  factory TradeRequestDto.fromJson(Map<String, dynamic> json) => _$TradeRequestDtoFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$TradeRequestDtoToJson(this);
}
