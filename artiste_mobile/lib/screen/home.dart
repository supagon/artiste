import 'package:artiste_mobile/widgets/appbar.dart';
import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Appbar(),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Icon(Icons.ac_unit),
          Icon(Icons.access_alarms),
        ],
      ),
    );
  }
}
