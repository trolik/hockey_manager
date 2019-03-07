// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ApplicationList.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ApplicationList _$ApplicationListFromJson(Map<String, dynamic> json) {
  return ApplicationList(
      json['status'] as String,
      (json['apps'] as List)
          ?.map((e) => e == null
              ? null
              : Application.fromJson(e as Map<String, dynamic>))
          ?.toList());
}

Map<String, dynamic> _$ApplicationListToJson(ApplicationList instance) =>
    <String, dynamic>{'status': instance.status, 'apps': instance.apps};
