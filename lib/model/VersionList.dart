import 'package:hockey_manager/model/Version.dart';
import 'package:json_annotation/json_annotation.dart';

part 'VersionList.g.dart';

@JsonSerializable()
class VersionList {
  final String status;

  @JsonKey(name: "app_versions")
  final List<Version> versions;

  VersionList(this.status, this.versions);

  factory VersionList.fromJson(Map<String, dynamic> json) => _$VersionListFromJson(json);
}