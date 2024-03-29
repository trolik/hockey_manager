import 'package:rxdart/rxdart.dart';
import 'package:hockey_manager/model/Application.dart';
import 'package:hockey_manager/network/Api.dart';

class HomeBloc {
  final _api = Api();
  final _fetcher = PublishSubject<List<Application>>();

  Observable<List<Application>> get applications => _fetcher.stream;

  fetchApplications() async {
    var apps = await _api.getApplications();
    _fetcher.sink.add(apps);
  }

  dispose() {
    _fetcher.close();
  }
}