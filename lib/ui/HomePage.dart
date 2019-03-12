import 'package:flutter/material.dart';
import 'package:hockey_manager/bloc/HomeBloc.dart';
import 'package:hockey_manager/model/Application.dart';
import 'package:hockey_manager/ui/row/ApplicationRow.dart';

class HomePage extends StatefulWidget {
  HomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var _homeBloc = HomeBloc();

  @override
  Widget build(BuildContext context) {
    _homeBloc.fetchApplications();
    
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: StreamBuilder<List<Application>>(
          stream: _homeBloc.applications,
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
    _homeBloc.dispose();
    super.dispose();
  }
}