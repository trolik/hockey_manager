import 'package:rxdart/rxdart.dart';
import 'package:hockey_manager/model/Application.dart';
import 'package:hockey_manager/network/Api.dart';

class ApplicationsBloc {
  final _api = Api();
  final _fetcher = PublishSubject<Application>();

  Observable<Application> get applications => _fetcher.stream;

  fetchApplication() async {
    Application app = await _api.getApplications();
    _fetcher.sink.add(app);
  }

  dispose() {
    _fetcher.close();
  }
}