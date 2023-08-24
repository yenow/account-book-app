import 'package:json_annotation/json_annotation.dart';

import 'base_model.dart';

part 'account.g.dart';

@JsonSerializable(explicitToJson: true)
class Account extends BaseModel {
  int? accountId;
  int? parentAccountId;
  String? accountType;
  String? accountName;
  String? description;
  int? level;
  bool? isLeaf;

  Account({
    this.accountId,
    this.parentAccountId,
    this.accountType,
    this.accountName,
    this.description,
    this.level,
    this.isLeaf,
  });

  factory Account.fromJson(Map<String, dynamic> json) => _$AccountFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$AccountToJson(this);
}
