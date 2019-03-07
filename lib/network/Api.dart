import 'package:http/http.dart' as http;
import 'dart:convert';

class Api {
  static final _host = "rink.hockeyapp.net";

  final _hockeyAppToken = "1521603a705c4af18e08d0b9df24b94a";

  Future<dynamic> getApplications() async {
    var uri = Uri.http(_host, "/api/2/apps");

    final response = await http.get(uri, headers: {
      "X-HockeyAppToken": _hockeyAppToken
    });

    if (response.statusCode == 200) {
      var r = json.decode(response.body);
      return null;
    } else {
      throw Exception("failure");
    }
  }
}