import 'package:json_annotation/json_annotation.dart';
import 'base_model.dart';

part 'asset.g.dart';

@JsonSerializable()
class Asset extends BaseModel {
  int? accountId;
  String? accountName;
  int? groupAccountId;
  String? groupAccountName;
  int? sumAmount;
  int? level;
  AssetType? assetType;

  Asset({this.accountId, this.accountName, this.groupAccountId, this.groupAccountName, this.sumAmount, this.level, this.assetType});

  factory Asset.fromJson(Map<String, dynamic> json) => _$AssetFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$AssetToJson(this);
}

enum AssetType {
  group('그룹'),
  asset('자산');

  const AssetType(this.assetTypeName);

  final String assetTypeName;
}
