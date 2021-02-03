import 'package:Test_app/screens/home/detail_medcin.dart';
import 'package:Test_app/models/filter.dart';
import 'package:Test_app/screens/home/main_bottomNavBar.dart';
import 'package:Test_app/screens/home/main_drawer.dart';

import 'package:flutter/material.dart';

class Settings extends StatefulWidget {
  @override
  _SettingsState createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  Widget appBarTitle = new Text("Liste des médecins");
  List<bool> selected = [true, true];

  Icon actionIcon = new Icon(Icons.search);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Parametres'),
        backgroundColor: Colors.blue[400],
        elevation: 0.0,
      ),
      drawer: MainDrawer(),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [],
      ),
    );
  }
}
