// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'VersionList.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

VersionList _$VersionListFromJson(Map<String, dynamic> json) {
  return VersionList(
      json['status'] as String,
      (json['app_versions'] as List)
          ?.map((e) =>
              e == null ? null : Version.fromJson(e as Map<String, dynamic>))
          ?.toList());
}

Map<String, dynamic> _$VersionListToJson(VersionList instance) =>
    <String, dynamic>{
      'status': instance.status,
      'app_versions': instance.versions
    };
