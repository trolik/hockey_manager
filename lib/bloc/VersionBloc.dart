import 'dart:io';

import 'package:dio/dio.dart';
import 'package:hockey_manager/model/Application.dart';
import 'package:hockey_manager/model/Version.dart';
import 'package:path_provider/path_provider.dart';
import 'package:rxdart/rxdart.dart';

class VersionBloc {
  final Version _version;
  final Application _application;

  final _fetcher = PublishSubject<DownloadApkInfo>();
  final _progress = PublishSubject<DownloadProgress>();

  Observable<DownloadApkInfo> get downloadApkInfo => _fetcher.stream;
  Observable<DownloadProgress> get downloadProgress => _progress.stream;

  VersionBloc(this._version, this._application);

  fetchDownloadInfo() async {
    Directory tmpDirectory = await getTemporaryDirectory();
    var tmpFile = File('${tmpDirectory.path}/${_version.shortVersion}.apk');

    print("fetchDownloadInfo: ${_version.downloadApkUrl} to ${tmpFile.path}");

    if (await tmpFile.exists()) {
      _fetcher.sink.add(DownloadApkInfo(false, tmpFile.path));
    } else {
      _fetcher.sink.add(DownloadApkInfo(true, tmpFile.path));

      var response = await Dio().download(
          _version.downloadApkUrl,
          tmpFile.path,
          onReceiveProgress: (count, total) {
            double percent = (count.toDouble() / total.toDouble()) * 100;
            _progress.sink.add(DownloadProgress(
                count: count, total: total, percent: percent.round()));
          });

      print("download complete");

      _fetcher.sink.add(DownloadApkInfo(false, tmpFile.path));
      _progress.sink.add(DownloadProgress(percent: 100));
    }
  }

  dispose() {
    _fetcher.close();
    _progress.close();
  }
}

class DownloadApkInfo {
  bool downloadInProgress;
  String apkPath;

  DownloadApkInfo(this.downloadInProgress, this.apkPath);
}

class DownloadProgress {
  int count;
  int total;
  int percent;

  DownloadProgress({this.count, this.total, this.percent});
}