import 'package:json_annotation/json_annotation.dart';

import '../../model/base_model.dart';

part 'account_response_dto.g.dart';

@JsonSerializable()
class AccountResponseDto extends BaseModel {
  int? accountId;
  int? parentAccountId;
  String? accountType;
  String? accountName;
  String? description;
  int? level;
  bool? isLeaf;

  AccountResponseDto(
      {this.accountId,
      this.parentAccountId,
      this.accountType,
      this.accountName,
      this.description,
      this.level,
      this.isLeaf});


  factory AccountResponseDto.fromJson(Map<String, dynamic> json) => _$AccountResponseDtoFromJson(json);
  @override
  Map<String, dynamic> toJson() => _$AccountResponseDtoToJson(this);
}