import 'package:account_book/data/model/base_model.dart';
import 'package:account_book/data/model/trade.dart';
import 'package:json_annotation/json_annotation.dart';

import '../../model/chart_data.dart';

part 'chart_response_dto.g.dart';

@JsonSerializable()
class ChartResponseDto extends BaseModel {
  List<ChartData>? incomeChartData;
  List<ChartData>? expenseChartData;

  ChartResponseDto({this.incomeChartData, this.expenseChartData});

  factory ChartResponseDto.fromJson(Map<String, dynamic> json) => _$ChartResponseDtoFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$ChartResponseDtoToJson(this);
}
