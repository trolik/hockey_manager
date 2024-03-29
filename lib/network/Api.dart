import 'package:hockey_manager/model/Application.dart';
import 'package:hockey_manager/model/ApplicationList.dart';
import 'package:hockey_manager/model/Version.dart';
import 'package:hockey_manager/model/VersionList.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class Api {
  static final _host = "rink.hockeyapp.net";

  final _hockeyAppToken = "1521603a705c4af18e08d0b9df24b94a";

  Future<List<Application>> getApplications() async {
    var uri = Uri.http(_host, "/api/2/apps");

    final response = await http.get(uri, headers: {
      "X-HockeyAppToken": _hockeyAppToken
    });

    if (response.statusCode == 200) {
      var body = json.decode(response.body);
      return ApplicationList.fromJson(body).apps;
    } else {
      throw Exception("failure");
    }
  }

  Future<List<Version>> getVersions(String appIdentifier) async {
    var uri = Uri.http(_host, "/api/2/apps/$appIdentifier/app_versions");

    final response = await http.get(uri, headers: {
      "X-HockeyAppToken": _hockeyAppToken
    });

    if (response.statusCode == 200) {
      var body = json.decode(response.body);
      return VersionList.fromJson(body).versions;
    } else {
      throw Exception("failure");
    }
  }
}