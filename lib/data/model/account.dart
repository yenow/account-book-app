class Account {
  int? id;
  String? date;
  int? categoryId;
  String? categoryName;
  String? type;
  String? typeName;
  int? amount;
  String? memo;

  Account(
      {this.id,
      this.date,
      this.categoryId,
      this.type,
      this.amount,
      this.categoryName,
      this.typeName,
      this.memo});

  @override
  String toString() {
    return 'Account{id: $id, date: $date, categoryId: $categoryId, type: $type, amount: $amount, categoryName: $categoryName, typeName: $typeName, memo: $memo}';
  }
}
