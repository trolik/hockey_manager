import 'dart:io';

import 'package:flutter/material.dart';
import 'package:hockey_manager/model/Version.dart';
import 'package:dio/dio.dart';
import 'package:path_provider/path_provider.dart';

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
            subtitle: Text(version.modifiedTime),
          ),
          Divider(
            height: 2,
            color: Colors.grey,
          )
        ],
      ),
      onTap: () {
        handleDownload();

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

  handleDownload() async {
    Directory tmpDirectory = await getTemporaryDirectory();
    var tmpFile = File('${tmpDirectory.path}/${version.shortVersion}');

    print("downloading ${version.downloadUrl} to ${tmpFile.path}");

    try {
      var response = await Dio().download(version.downloadUrl, tmpFile.path);

      var i = 2;
    } catch (e) {
      print(e);
    }
  }
}