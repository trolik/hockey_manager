// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'Application.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Application _$ApplicationFromJson(Map<String, dynamic> json) {
  return Application(json['title'] as String,
      json['public_identifier'] as String, json['bundle_identifier'] as String);
}

Map<String, dynamic> _$ApplicationToJson(Application instance) =>
    <String, dynamic>{
      'title': instance.title,
      'public_identifier': instance.publicIdentifier,
      'bundle_identifier': instance.bundleIdentifier
    };
