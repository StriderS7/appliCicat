import 'package:Test_app/screens/home/detail_medcin.dart';
import 'package:Test_app/models/filter.dart';
import 'package:Test_app/screens/home/main_bottomNavBar.dart';
import 'package:Test_app/screens/home/main_drawer.dart';
import 'package:Test_app/screens/home/settings_form.dart';

import 'package:flutter/material.dart';

import '../../models/back_button.dart';

class DetailConsultation extends StatefulWidget {
  @override
  _DetailConsultationState createState() => _DetailConsultationState();
}

class _DetailConsultationState extends State<DetailConsultation> {
  Widget appBarTitle = new Text("Details Consultation");
  Icon actionIcon = new Icon(Icons.search);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Details Consultation'),
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
                Padding(
                  padding: const EdgeInsets.fromLTRB(15.0, 0, 0, 0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 7,
                      ),
                      Text(
                        'Type de Consultation',
                        style: TextStyle(
                          fontSize: 20.0,
                        ),
                      ),
                      SizedBox(
                        height: 7,
                      ),
                      Text(
                        'Date',
                        style: TextStyle(
                          fontSize: 20.0,
                        ),
                      ),
                      SizedBox(
                        height: 7,
                      ),
                      Text(
                        'Infos',
                        style: TextStyle(
                          fontSize: 20.0,
                        ),
                      ),
                      SizedBox(
                        height: 7,
                      ),
                      Text(
                        'Médecin / Infermier / Structure',
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
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.file_download),
        onPressed: () {},
      ),
    );
  }
}
