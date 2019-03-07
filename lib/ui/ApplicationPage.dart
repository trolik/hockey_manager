import 'package:flutter/material.dart';
import 'package:hockey_manager/model/Application.dart';

class ApplicationPage extends StatefulWidget {
  final Application application;

  ApplicationPage(this.application);

  @override
  _ApplicationPageState createState() => _ApplicationPageState(application);
}

class _ApplicationPageState extends State<ApplicationPage> {
  final Application application;

  _ApplicationPageState(this.application);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(application.title),
        ),
        body: Center(child: Text(application.bundleIdentifier))
    );
  }
}