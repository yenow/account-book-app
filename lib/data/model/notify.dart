import 'package:json_annotation/json_annotation.dart';

import 'base_model.dart';

part 'notify.g.dart';

@JsonSerializable(explicitToJson: true)
class Notify extends BaseModel {
  int? notifyId;
  String? title;
  String? content;
  String? creationDate;
  String? modificationDate;

  Notify({this.notifyId, this.title, this.content, this.creationDate, this.modificationDate});

  factory Notify.fromJson(Map<String, dynamic> json) => _$NotifyFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$NotifyToJson(this);
}
