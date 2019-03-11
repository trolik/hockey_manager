import 'package:flutter/material.dart';
import 'package:hockey_manager/model/Version.dart';

class VersionPage extends StatefulWidget {
  final Version _version;

  VersionPage(this._version);

  @override
  _VersionPageState createState() => _VersionPageState(_version);
}

class _VersionPageState extends State<VersionPage> {
  final Version _version;
  
  _VersionPageState(this._version);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(_version.shortVersion),
        ),
      body: Center(
        child: Text(_version.versionCode.toString())),
    );
  }
}
