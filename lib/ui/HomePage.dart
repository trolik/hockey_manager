import 'package:flutter/material.dart';
import 'package:hockey_manager/bloc/ApplicationsBloc.dart';

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
      body: StreamBuilder(
          stream: _applicationBloc.applications,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return Center(child: Text("data"));
            } else if (snapshot.hasError) {
              return Center(child: Text("error"));
            }

            return Center(child: CircularProgressIndicator());
          }
      )
    );
  }
}