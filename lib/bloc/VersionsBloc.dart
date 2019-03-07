import 'package:hockey_manager/model/Version.dart';
import 'package:hockey_manager/network/Api.dart';
import 'package:rxdart/rxdart.dart';

class VersionsBloc {
  final _api = Api();
  final _fetcher = PublishSubject<List<Version>>();

  Observable<List<Version>> get versions => _fetcher.stream;

  fetchVersions(String appIdentifier) async {
    var versions = await _api.getVersions(appIdentifier);
    _fetcher.sink.add(versions);
  }

  dispose() {
    _fetcher.close();
  }
}