// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'notify.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Notify _$NotifyFromJson(Map<String, dynamic> json) => Notify(
      notifyId: json['notifyId'] as int?,
      title: json['title'] as String?,
      content: json['content'] as String?,
      creationDate: json['creationDate'] as String?,
      modificationDate: json['modificationDate'] as String?,
    );

Map<String, dynamic> _$NotifyToJson(Notify instance) => <String, dynamic>{
      'notifyId': instance.notifyId,
      'title': instance.title,
      'content': instance.content,
      'creationDate': instance.creationDate,
      'modificationDate': instance.modificationDate,
    };
