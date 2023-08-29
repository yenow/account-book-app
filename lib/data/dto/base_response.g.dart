// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'base_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BaseResponse _$BaseResponseFromJson(Map<String, dynamic> json) => BaseResponse(
      timestamp: json['timestamp'] as String?,
      state: json['state'] as String?,
      message: json['message'] as String?,
      errorCode: json['errorCode'] as int?,
      body: json['body'],
    );

Map<String, dynamic> _$BaseResponseToJson(BaseResponse instance) =>
    <String, dynamic>{
      'timestamp': instance.timestamp,
      'state': instance.state,
      'errorCode': instance.errorCode,
      'message': instance.message,
      'body': instance.body,
    };
