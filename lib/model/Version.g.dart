// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'Version.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Version _$VersionFromJson(Map<String, dynamic> json) {
  return Version(
      json['version'] as int,
      json['shortversion'] as String,
      json['download_url'] as String,
      json['appsize'] as int,
      json['timestamp'] as int);
}

Map<String, dynamic> _$VersionToJson(Version instance) => <String, dynamic>{
      'version': instance.version,
      'shortversion': instance.shortVersion,
      'download_url': instance.downloadUrl,
      'appsize': instance.appsize,
      'timestamp': instance.timestamp
    };
