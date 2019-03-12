import 'package:flutter/material.dart';
import 'package:hockey_manager/bloc/VersionBloc.dart';
import 'package:hockey_manager/model/Application.dart';
import 'package:hockey_manager/model/Version.dart';

class VersionPage extends StatefulWidget {
  final Version _version;
  final Application _application;

  VersionPage(this._version, this._application);

  @override
  _VersionPageState createState() => _VersionPageState(_version, _application);
}

class _VersionPageState extends State<VersionPage> {
  final Version _version;
  final Application _application;

  VersionBloc _versionBloc;
  
  _VersionPageState(this._version, this._application) : _versionBloc = VersionBloc(_version, _application);

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
