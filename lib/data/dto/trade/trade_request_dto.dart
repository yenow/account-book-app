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

  TradeRequestDto(
      {this.tradeId,
        this.userId,
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

  void setTrade(Trade trade) {
    tradeId = trade.tradeId;
    tradeDate = trade.tradeDate;
    realTradeDate = trade.realTradeDate;
    tradeType = trade.tradeType;
    typeName = trade.typeName;
    amount = trade.amount;
    incomeOrExpenseAccountId = trade.incomeOrExpenseAccountId;
    incomeOrExpenseAccountName = trade.incomeOrExpenseAccountName;
    assetAccountId = trade.assetAccountId;
    assetAccountName = trade.assetAccountName;
    depositAccountId = trade.depositAccountId;
    depositAccountName = trade.depositAccountName;
    withdrawAccountId = trade.withdrawAccountId;
    withdrawAccountName = trade.withdrawAccountName;
    content = trade.content;
    memo = trade.memo;
  }

  factory TradeRequestDto.fromJson(Map<String, dynamic> json) => _$TradeRequestDtoFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$TradeRequestDtoToJson(this);
}
