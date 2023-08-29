import 'package:json_annotation/json_annotation.dart';

import 'base_model.dart';

part 'chart_data.g.dart';

@JsonSerializable()
class ChartData extends BaseModel {
  String accountName;
  num amount;
  double percent;

  ChartData({required this.accountName, required this.amount, required this.percent});

  factory ChartData.fromJson(Map<String, dynamic> json) => _$ChartDataFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$ChartDataToJson(this);
}
