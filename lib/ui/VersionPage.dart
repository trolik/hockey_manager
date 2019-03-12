import 'package:flutter/material.dart';
import 'package:hockey_manager/bloc/VersionBloc.dart';
import 'package:hockey_manager/model/Application.dart';
import 'package:hockey_manager/model/Version.dart';
import 'package:install_plugin/install_plugin.dart';
import 'package:android_intent/android_intent.dart';

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
    _versionBloc.fetchDownloadInfo();
    _versionBloc.fetchAppInfo();

    return Scaffold(
      appBar: AppBar(
        title: Text(_application.title),
      ),
      body: Padding(
          padding: EdgeInsets.all(16.0),
          child: Column(
            children: <Widget>[
              _buildVersionNameTextField(),

              StreamBuilder<InstalledAppInfo>(
                  stream: _versionBloc.installedAppInfo,
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      return _buildInstalledAppInfo(snapshot.data);
                    }

                    return Container(width: 0, height: 0);
                  }
              ),

              StreamBuilder<DownloadApkInfo>(
                  stream: _versionBloc.downloadApkInfo,
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      return _buildDownloadApkInfo(snapshot.data);
                    }

                    return Container(width: 0, height: 0);
                  }
              ),

              StreamBuilder<DownloadProgress>(
                  stream: _versionBloc.downloadProgress,
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      return _buildDownloadProgress(snapshot.data);
                    }

                    return Container(width: 0, height: 0);
                  }
              ),
            ],
          )
      ),
    );
  }

  TextFormField _buildVersionNameTextField() {
    return TextFormField(
      decoration: const InputDecoration(
          labelText: "Version name",
          labelStyle: TextStyle(fontSize: 20.0)
      ),
      enabled: false,
      style: TextStyle(fontSize: 20.0),
      initialValue: _version.shortVersion,
    );
  }

  @override
  void dispose() {
    _versionBloc.dispose();
    super.dispose();
  }

  Widget _buildDownloadApkInfo(DownloadApkInfo downloadApkInfo) {
    if (downloadApkInfo.downloadInProgress) {
      return Padding(
          padding: EdgeInsets.only(top: 16.0),
          child: Center(
              child: CircularProgressIndicator()
          )
      );
    } else {
      return Column(
        children: <Widget>[
          TextFormField(
            decoration: const InputDecoration(
                labelText: "Apk path",
                labelStyle: TextStyle(fontSize: 20.0)
            ),
            enabled: false,
            style: TextStyle(fontSize: 20.0),
            initialValue: downloadApkInfo.apkPath,
            maxLines: null,
          ),

          RaisedButton(
            onPressed: () {
              installVersion(downloadApkInfo.apkPath);
            },
            child: Text("install version"),
          )
        ],
      );
    }
  }

  Widget _buildDownloadProgress(DownloadProgress downloadProgress) {
    return downloadProgress.percent < 100 ?
      Padding(
        padding: EdgeInsets.only(top: 16.0),
        child: Text("Download in progress: ${downloadProgress.percent}%")
      ) : Container(width: 0, height: 0);
  }

  void installVersion(String apkPath) {
    InstallPlugin.installApk(apkPath, 'com.trolik.hockey_manager')
      .then((result) {
        print('install apk $result');
      }).catchError((error) {
        print('install apk error: $error');
      });
  }

  Widget _buildInstalledAppInfo(InstalledAppInfo data) {
    return data.installed == true ? Column(
      children: <Widget>[
        TextFormField(
          decoration: const InputDecoration(
              labelText: "Installed app version code",
              labelStyle: TextStyle(fontSize: 20.0)
          ),
          enabled: false,
          style: TextStyle(fontSize: 20.0),
          initialValue: data.versionCode.toString(),
          maxLines: null,
        ),

        RaisedButton(
          onPressed: () {
            uninstallApp();
          },
          child: Text("un-install version"),
        )
      ],
    ) : Container(width: 0, height: 0);
  }

  void uninstallApp() async {
    try {
      AndroidIntent intent = AndroidIntent(
          action: 'android.intent.action.UNINSTALL_PACKAGE',
          data: "package:${_application.bundleIdentifier}"
      );
      await intent.launch();

    } catch (e) {
      print(e);
    }
  }
}
