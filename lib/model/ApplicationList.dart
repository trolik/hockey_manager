import 'package:json_annotation/json_annotation.dart';

part 'ApplicationList.g.dart';

@JsonSerializable()
class ApplicationList {
  final String status;

  ApplicationList(this.status);


}