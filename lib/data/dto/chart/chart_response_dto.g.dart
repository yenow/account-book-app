// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'chart_response_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ChartResponseDto _$ChartResponseDtoFromJson(Map<String, dynamic> json) =>
    ChartResponseDto(
      incomeChartData: (json['incomeChartData'] as List<dynamic>?)
          ?.map((e) => ChartData.fromJson(e as Map<String, dynamic>))
          .toList(),
      expenseChartData: (json['expenseChartData'] as List<dynamic>?)
          ?.map((e) => ChartData.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$ChartResponseDtoToJson(ChartResponseDto instance) =>
    <String, dynamic>{
      'incomeChartData': instance.incomeChartData,
      'expenseChartData': instance.expenseChartData,
    };
