
import 'package:flutter/material.dart';
import 'package:hockey_manager/model/Application.dart';

class ApplicationRow extends StatelessWidget {
  final Application application;

  ApplicationRow(this.application);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          ListTile(
            title: Text(application.title),
            subtitle: Text(application.bundleIdentifier),
          ),
          Divider(
            height: 2,
            color: Colors.grey,
          )
        ],
      ),
      onTap: () {

      },
    );
  }
}