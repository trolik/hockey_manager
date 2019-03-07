import 'package:hockey_manager/model/Application.dart';
import 'package:json_annotation/json_annotation.dart';

part 'ApplicationList.g.dart';

@JsonSerializable()
class ApplicationList {
  final String status;
  final List<Application> apps;

  ApplicationList(this.status, this.apps);

  factory ApplicationList.fromJson(Map<String, dynamic> json) => _$ApplicationListFromJson(json);
}