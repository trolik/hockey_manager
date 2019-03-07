import 'package:flutter/material.dart';
import 'package:hockey_manager/ui/HomePage.dart';

class App extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Hockewy Manager',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: HomePage(title: 'Flutter Demo Home Page'),
    );
  }
}