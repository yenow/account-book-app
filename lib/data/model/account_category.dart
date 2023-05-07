import 'package:account_book/data/model/account_type.dart';

class AccountCategory {
  int? id;
  int? parentId;
  int? level;
  AccountType? type;
  String? typeName;
  String? name;

  AccountCategory({this.id, this.parentId, this.level, this.type, this.typeName, this.name});
}
