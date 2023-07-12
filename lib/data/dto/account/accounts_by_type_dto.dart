import 'package:json_annotation/json_annotation.dart';
import '../../model/account.dart';
import '../../model/base_model.dart';

part 'accounts_by_type_dto.g.dart';

@JsonSerializable(explicitToJson: true)
class AccountsByTypeDto extends BaseModel {
  List<Account>? _incomeAccounts;
  List<Account>? _expenseAccounts;
  List<Account>? _assetAccounts;

  AccountsByTypeDto({
    required List<Account>? incomeAccounts,
    required List<Account>? expenseAccounts,
    required List<Account>? assetAccounts,
  })  : _incomeAccounts = incomeAccounts,
        _expenseAccounts = expenseAccounts,
        _assetAccounts = assetAccounts;

  List<Account>? get assetAccounts => _assetAccounts;

  List<Account>? get expenseAccounts => _expenseAccounts;

  List<Account>? get incomeAccounts => _incomeAccounts;



  factory AccountsByTypeDto.fromJson(Map<String, dynamic> json) => _$AccountsByTypeDtoFromJson(json);
  @override
  Map<String, dynamic> toJson() => _$AccountsByTypeDtoToJson(this);
}
