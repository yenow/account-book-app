import 'package:json_annotation/json_annotation.dart';

import 'base_model.dart';

part 'account.g.dart';

@JsonSerializable(explicitToJson: true)
class Account extends BaseModel {
  final int? _accountId;
  final int? _parentAccountId;
  final String? _accountType;
  final String? _accountName;
  final String? _description;
  final int? _level;
  final bool? _isLeaf;

  Account({accountId, parentAccountId, accountType, accountName, description, level, isLeaf})
      : _accountId = accountId,
        _parentAccountId = parentAccountId,
        _accountType = accountType,
        _accountName = accountName,
        _description = description,
        _level = level,
        _isLeaf = isLeaf;


  int? get accountId => _accountId;

  bool? get isLeaf => _isLeaf;

  int? get level => _level;

  String? get description => _description;

  String? get accountName => _accountName;

  String? get accountType => _accountType;

  int? get parentAccountId => _parentAccountId;

  factory Account.fromJson(Map<String, dynamic> json) => _$AccountFromJson(json);
  @override
  Map<String, dynamic> toJson() => _$AccountToJson(this);
}
