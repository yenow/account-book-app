import 'package:account_book/data/model/base_model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'account_request_dto.g.dart';

@JsonSerializable()
class AccountRequestDto extends BaseModel {
  int? userId;
  String? userKey;

  AccountRequestDto({this.userId, this.userKey});

  factory AccountRequestDto.fromJson(Map<String, dynamic> json) => _$AccountRequestDtoFromJson(json);
  @override
  Map<String, dynamic> toJson() => _$AccountRequestDtoToJson(this);
}