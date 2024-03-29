import 'package:flutter/material.dart';
import 'package:hockey_manager/model/Application.dart';
import 'package:hockey_manager/model/Version.dart';
import 'package:hockey_manager/ui/VersionPage.dart';

class VersionRow extends StatelessWidget {
  final Version _version;
  final Application _application;

  VersionRow(this._version, this._application);

  @override
  Widget build(BuildContext context) {
    //bool uninstallRequired = version.versionCode < application.
    return InkWell(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          ListTile(
            title: Text(_version.shortVersion),
            subtitle: Text(_version.modifiedTime),
            trailing: Icon(
                Icons.warning,
                color: Theme.of(context).primaryColor
            ),
          ),
          Divider(
            height: 2,
            color: Colors.grey,
          )
        ],
      ),
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) {
                  return new VersionPage(_version, _application);
                }
            ));
      },
    );
  }
}