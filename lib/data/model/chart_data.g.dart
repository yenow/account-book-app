// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'chart_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ChartData _$ChartDataFromJson(Map<String, dynamic> json) => ChartData(
      accountName: json['accountName'] as String,
      amount: json['amount'] as num,
      percent: (json['percent'] as num).toDouble(),
    );

Map<String, dynamic> _$ChartDataToJson(ChartData instance) => <String, dynamic>{
      'accountName': instance.accountName,
      'amount': instance.amount,
      'percent': instance.percent,
    };
