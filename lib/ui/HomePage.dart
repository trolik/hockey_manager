import 'package:flutter/material.dart';
import 'package:hockey_manager/bloc/ApplicationsBloc.dart';
import 'package:hockey_manager/model/Application.dart';
import 'package:hockey_manager/ui/ApplicationRow.dart';

class HomePage extends StatefulWidget {
  HomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var _applicationBloc = ApplicationsBloc();

  @override
  Widget build(BuildContext context) {
    _applicationBloc.fetchApplication();
    
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: StreamBuilder<List<Application>>(
          stream: _applicationBloc.applications,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return _applicationList(snapshot.data);
            } else if (snapshot.hasError) {
              return Center(child: Text("error"));
            }

            return Center(child: CircularProgressIndicator());
          }
      )
    );
  }

  Widget _applicationList(List<Application> apps) {
    return ListView.builder(
        itemCount: apps.length,
        itemBuilder: (context, index) {
          return ApplicationRow(apps.elementAt(index));
        });
  }

  @override
  void dispose() {
    _applicationBloc.dispose();
    super.dispose();
  }


}