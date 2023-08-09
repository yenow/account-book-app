import 'package:account_book/data/model/base_model.dart';
import 'package:account_book/data/model/trade.dart';
import 'package:json_annotation/json_annotation.dart';

part 'chart_request_dto.g.dart';

@JsonSerializable()
class ChartRequestDto extends BaseModel {
  String? month;

  ChartRequestDto({this.month});

  factory ChartRequestDto.fromJson(Map<String, dynamic> json) => _$ChartRequestDtoFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$ChartRequestDtoToJson(this);
}
