import 'package:json_annotation/json_annotation.dart';

part 'Application.g.dart';

@JsonSerializable()
class Application {
  final String title;

  @JsonKey(name: "public_identifier")
  final String publicIdentifier;

  @JsonKey(name: "bundle_identifier")
  final String bundleIdentifier;

  Application(this.title, this.publicIdentifier, this.bundleIdentifier);

  factory Application.fromJson(Map<String, dynamic> json) => _$ApplicationFromJson(json);
}

/*
{


            "platform": "Android",
            "release_type": 2,
            "custom_release_type": null,
            "created_at": "2018-05-16T07:12:58Z",
            "updated_at": "2019-03-07T08:57:45Z",
            "featured": false,
            "role": 0,
            "id": 767672,
            "minimum_os_version": "4.4",
            "device_family": null,
            "status": 2,
            "visibility": "private",
            "block_crashes": false,
            "block_personal_data": false,
            "owner": "Anatoliy",
            "owner_token": "758767d6ed4439bf17c2aefb315e47b5c5bdc942",
            "retention_days": "90"
 */