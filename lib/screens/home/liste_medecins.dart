import 'package:Test_app/Navigation/Destination.dart';
import 'package:Test_app/screens/home/detail_medcin.dart';
import 'package:Test_app/models/filter.dart';
import 'package:Test_app/screens/home/main_bottomNavBar.dart';
import 'package:Test_app/screens/home/main_drawer.dart';
import 'package:Test_app/screens/home/settings_form.dart';

import 'package:flutter/material.dart';

class ListeMedecins extends StatefulWidget {
  ListeMedecins({Key key, this.destination}) : super(key: key);

  final Destination destination;

  @override
  _ListeMedecinsState createState() => _ListeMedecinsState();
}

class _ListeMedecinsState extends State<ListeMedecins> {
  Widget appBarTitle = new Text("Patients");
  List<bool> selected = [true, true];

  Icon actionIcon = new Icon(Icons.search);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(centerTitle: true, title: appBarTitle, actions: <Widget>[
        IconButton(
          icon: actionIcon,
          onPressed: () {
            setState(() {
              if (this.actionIcon.icon == Icons.search) {
                this.actionIcon = new Icon(Icons.close);
                this.appBarTitle = new TextField(
                  style: new TextStyle(
                    color: Colors.white,
                  ),
                  decoration: new InputDecoration(
                      prefixIcon: new Icon(Icons.search, color: Colors.white),
                      hintText: "Search...",
                      hintStyle: new TextStyle(color: Colors.white)),
                );
              } else {
                this.actionIcon = Icon(Icons.search);
                this.appBarTitle = Text("Patients");
              }
            });
          },
        ),
        FlatButton(
          onPressed: null,
          child: Center(
            child: IconButton(
              icon: Icon(
                Icons.tune,
                color: Colors.white,
              ),
              onPressed: () => _filterDialogue(),
            ),
          ),
        ),
      ]),
      drawer: MainDrawer(),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.only(top: 8.0),
            child: Card(
              margin: EdgeInsets.fromLTRB(20.0, 6.0, 20.0, 0.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  ListTile(
                    title: Text('Abdi Souami'),
                    subtitle: Text('Diabétique'),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(15.0, 0, 0, 0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Adresse: Dely Brahim, Alger, Algérie'),
                        Text('Tel: 0750505050'),
                      ],


                    ),

                  ),

                  ButtonBar(
                    children: <Widget>[
                      FlatButton(
                        child: const Text('Details'),
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => DetailMedecin(),
                              ));
                        },
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Future<void> _filterDialogue() async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Select filters'),
          content: SingleChildScrollView(
            child: FilterDialogue(),
          ),
          actions: <Widget>[
            FlatButton(
              child: Text('Apply'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
}
