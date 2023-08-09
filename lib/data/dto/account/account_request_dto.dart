import 'package:account_book/data/model/base_model.dart';
import 'package:json_annotation/json_annotation.dart';

import '../../model/asset.dart';

part 'account_request_dto.g.dart';

@JsonSerializable()
class AccountRequestDto extends BaseModel {
  int? userId;
  String? userKey;
  int? accountId;
  String? accountName;
  int? groupAccountId;
  String? groupAccountName;
  int? amount;
  int? level;
  AssetType? assetType;

  AccountRequestDto(
      {this.userId, this.userKey, this.accountId, this.accountName, this.groupAccountId, this.groupAccountName, this.amount, this.level, this.assetType});

  factory AccountRequestDto.fromJson(Map<String, dynamic> json) => _$AccountRequestDtoFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$AccountRequestDtoToJson(this);
}
