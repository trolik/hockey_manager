import 'package:flutter/material.dart';
import 'package:hockey_manager/bloc/VersionsBloc.dart';
import 'package:hockey_manager/model/Application.dart';
import 'package:hockey_manager/model/Version.dart';
import 'package:hockey_manager/ui/VersionRow.dart';

class ApplicationPage extends StatefulWidget {
  final Application _application;

  ApplicationPage(this._application);

  @override
  _ApplicationPageState createState() => _ApplicationPageState(_application);
}

class _ApplicationPageState extends State<ApplicationPage> {
  final Application _application;
  var _versionsBloc = VersionsBloc();

  _ApplicationPageState(this._application);

  @override
  Widget build(BuildContext context) {
    _versionsBloc.fetchVersions(_application.publicIdentifier);

    return Scaffold(
        appBar: AppBar(
          title: Text(_application.title),
        ),
        body: StreamBuilder<List<Version>>(
            stream: _versionsBloc.versions,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return _versionList(snapshot.data);
              } else if (snapshot.hasError) {
                return Center(child: Text("error"));
              }

              return Center(child: CircularProgressIndicator());
            }
        )
    );
  }

  Widget _versionList(List<Version> versions) {
    return ListView.builder(
        itemCount: versions.length,
        itemBuilder: (context, index) {
          return VersionRow(versions.elementAt(index), _application);
        });
  }

  @override
  void dispose() {
    _versionsBloc.dispose();
    super.dispose();
  }
}