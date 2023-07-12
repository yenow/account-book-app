class Trade {
  int? tradeId;
  String? tradeDate;
  DateTime? realTradeDate;
  String? tradeType;
  String? typeName;
  int? amount;
  int? accountId;
  String? accountName;
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
      this.accountId,
      this.accountName,
      this.assetAccountId,
      this.assetAccountName,
      this.depositAccountId,
      this.depositAccountName,
      this.withdrawAccountId,
      this.withdrawAccountName,
      this.content,
      this.memo});

  @override
  String toString() {
    return 'Trade{tradeId: $tradeId, tradeDate: $tradeDate, realTradeDate: $realTradeDate, tradeType: $tradeType, typeName: $typeName, amount: $amount, accountId: $accountId, accountName: $accountName, assetAccountId: $assetAccountId, assetAccountName: $assetAccountName, incomeAccountId: $depositAccountId, incomeAccountName: $depositAccountName, expenseAccountId: $withdrawAccountId, expenseAccountName: $withdrawAccountName, content: $content, memo: $memo}';
  }
}

enum TradeType {
  income('수입'),
  expense('지출'),
  transfer('이체'); // asset('자산'), debt('빚')

  const TradeType(this.tradeTypeName);

  final String tradeTypeName;
}
