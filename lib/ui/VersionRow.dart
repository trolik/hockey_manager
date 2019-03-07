import 'package:flutter/material.dart';
import 'package:hockey_manager/model/Version.dart';

class VersionRow extends StatelessWidget {
  final Version version;

  VersionRow(this.version);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          ListTile(
            title: Text(version.shortVersion),
            subtitle: Text(version.downloadUrl),
          ),
          Divider(
            height: 2,
            color: Colors.grey,
          )
        ],
      ),
      onTap: () {
        /*Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) {
                  return new ApplicationPage(version);
                }
            ));*/
      },
    );
  }
}