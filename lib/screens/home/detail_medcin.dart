import 'package:Test_app/screens/home/detail_medcin.dart';
import 'package:Test_app/models/filter.dart';
import 'package:Test_app/screens/home/main_bottomNavBar.dart';
import 'package:Test_app/screens/home/main_drawer.dart';
import 'package:Test_app/screens/home/settings_form.dart';

import 'package:flutter/material.dart';

import '../../models/back_button.dart';

class DetailMedecin extends StatefulWidget {
  @override
  _DetailMedecinState createState() => _DetailMedecinState();
}

class _DetailMedecinState extends State<DetailMedecin> {
  Widget appBarTitle = new Text("Liste des médecins");
  Icon actionIcon = new Icon(Icons.search);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Details médecin'),
        backgroundColor: Colors.blue[400],
        elevation: 0.0,
        actions: <Widget>[],
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.only(top: 8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                ListTile(
                  title: Text(
                    'Samir Douib',
                    style: TextStyle(
                      fontSize: 25.0,
                    ),
                  ),
                  subtitle: Text(
                    'médecin généraliste',
                    style: TextStyle(
                      fontSize: 20.0,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(15.0, 0, 0, 0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Adresse: Kouba, Alger, Algérie',
                        style: TextStyle(
                          fontSize: 20.0,
                        ),
                      ),
                      SizedBox(
                        height: 7,
                      ),
                      Text(
                        'Tel: 0750505050',
                        style: TextStyle(
                          fontSize: 20.0,
                        ),
                      ),
                      SizedBox(
                        height: 7,
                      ),
                      Text(
                        'Email: samirdouib@hotmail.com',
                        style: TextStyle(
                          fontSize: 20.0,
                        ),
                      ),
                      SizedBox(
                        height: 7,
                      ),
                      Text(
                        'Pays: Algérie',
                        style: TextStyle(
                          fontSize: 20.0,
                        ),
                      ),
                      SizedBox(
                        height: 7,
                      ),
                      Text(
                        'Ville: Alger',
                        style: TextStyle(
                          fontSize: 20.0,
                        ),
                      ),
                      SizedBox(
                        height: 7,
                      ),
                      Text(
                        'Horaires de consultations: 8h30/15h00',
                        style: TextStyle(
                          fontSize: 20.0,
                        ),
                      ),
                      SizedBox(
                        height: 7,
                      ),
                      Text(
                        'Type d interventions prises en charge: Divers',
                        style: TextStyle(
                          fontSize: 20.0,
                        ),
                      ),
                    ],

                  ),
                ),
              ],

            ),
          ),
        ],
      ),
    );
  }
}
