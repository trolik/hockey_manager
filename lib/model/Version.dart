import 'package:json_annotation/json_annotation.dart';
import 'package:timeago/timeago.dart' as timeago;

part "Version.g.dart";

@JsonSerializable()
class Version {
  final String version;

  @JsonKey(name: "shortversion")
  final String shortVersion;

  @JsonKey(name: "download_url")
  final String downloadUrl;

  final int appsize;
  final int timestamp;

  Version(this.version, this.shortVersion, this.downloadUrl, this.appsize, this.timestamp);

  get updatedDate => DateTime.fromMillisecondsSinceEpoch(timestamp * 1000);

  get modifiedTime => timeago.format(updatedDate);

  get downloadApkUrl => downloadUrl.replaceAll("/apps/", "/api/2/apps/") + "?format=apk";

  get versionCode => int.parse(version);

  factory Version.fromJson(Map<String, dynamic> map) => _$VersionFromJson(map);
}

/*\
{
            "version": "208",
            "mandatory": false,
            "config_url": "https://rink.hockeyapp.net/manage/apps/1266/app_versions/208",
            "download_url":"https://rink.hockeyapp.net/apps/0873e2b98ad046a92c170a243a8515f6/app_versions/208
            "appsize": 157547,
            "device_family": null,
            "notes": "<p>Fixed bug when users could not sign in.</p>\n",
            "status": 2,
            "minimum_os_version": null,
            "title": "HockeyApp"
        },
 */