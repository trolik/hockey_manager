import 'dart:io';

import 'package:flutter/material.dart';
import 'package:hockey_manager/model/Application.dart';
import 'package:hockey_manager/model/Version.dart';
import 'package:dio/dio.dart';
import 'package:hockey_manager/ui/VersionPage.dart';
import 'package:path_provider/path_provider.dart';
import 'package:android_intent/android_intent.dart';

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

  handleDownload() async {
    Directory tmpDirectory = await getTemporaryDirectory();
    var tmpFile = File('${tmpDirectory.path}/${_version.shortVersion}.apk');

    print("downloading ${_version.downloadApkUrl} to ${tmpFile.path}");


    try {
      if (await tmpFile.exists()) {
        print("exists");
      } else {
        var response = await Dio().download(
            _version.downloadApkUrl,
            tmpFile.path,
            onReceiveProgress: (count, total) {
              double percent = (count.toDouble() / total.toDouble()) * 100;
              print("count $count, total $total, percent ${percent}");
            });
      }

      AndroidIntent intent = AndroidIntent(
        action: 'android.intent.action.UNINSTALL_PACKAGE',
        data: "package:ru.rt.video.app.mobile"
      );
      intent.launch();

      /*
      Uri packageUri = Uri.parse("package:org.klnusbaum.test");
            Intent uninstallIntent =
              new Intent(Intent.ACTION_UNINSTALL_PACKAGE, packageUri);
            startActivity(uninstallIntent);
       */

      /*InstallPlugin.installApk(tmpFile.path, 'com.trolik.hockey_manager')
      .then((result) {
        print('install apk $result');
      }).catchError((error) {
        print('install apk error: $error');
      });*/

    } catch (e) {
      print(e);
    }
  }
}