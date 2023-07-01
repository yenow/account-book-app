class Trade {
  int? id;
  String? tradeDate;
  int? categoryId;
  String? categoryName;
  String? type;
  String? typeName;
  int? amount;
  String? memo;

  Trade(
      {this.id,
      this.tradeDate,
      this.categoryId,
      this.type,
      this.amount,
      this.categoryName,
      this.typeName,
      this.memo});

  @override
  String toString() {
    return 'Trade{id: $id, tradeDate: $tradeDate, categoryId: $categoryId, categoryName: $categoryName, type: $type, typeName: $typeName, amount: $amount, memo: $memo}';
  }
}

enum TradeType {
  income('수입'), expense('지출');

  const TradeType(this.tradeTypeName);
  final String tradeTypeName;
}