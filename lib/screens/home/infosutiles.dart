import 'dart:io';

import 'package:Test_app/network/RestClient.dart';
import 'package:Test_app/pages/doctor-list.dart';
import 'package:Test_app/screens/authenticate/inscription.dart';
import 'package:Test_app/screens/authenticate/register.dart';
import 'package:Test_app/screens/authenticate/registermedecin.dart';
import 'package:Test_app/screens/home/Pansements.dart';
import 'package:Test_app/screens/home/home.dart';
import 'package:Test_app/shared/loading.dart';
import 'package:analyzer/dart/ast/token.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_session/flutter_session.dart';

class Infosutiles extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    return Scaffold( resizeToAvoidBottomPadding: false,


      backgroundColor: Colors.blue[600],

      body: Center(




        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,

          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: SizedBox(
                  height: 70,
                  width: 300, // specific value
                  child: RaisedButton.icon(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(40.0)),
                      onPressed: () {
                      },
                      icon: Icon(Icons.book_rounded, size: 70,)
                      ,
                      label: Text("Infos utiles",
                      style: TextStyle(color: Colors.blue,fontSize: 30),)

                  )),
            ),
            SizedBox(height: 80.0),

            Padding(
              padding: const EdgeInsets.all(8.0),
              child: SizedBox(
                  height: 100,
                  width: 300, // specific value
                  child: RaisedButton.icon(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(40.0)),
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => Pansements(),));
                      },
                      icon: Icon(Icons.sick_outlined, size: 40,)
                      ,
                      label: Text("Pied diabétique",
                          style: TextStyle(color: Colors.blue,fontSize: 25),))),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: SizedBox(
                  height: 100,
                  width: 300, // specific value
                  child: RaisedButton.icon(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(40.0)),
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => Pansements(),));
                      },
                      icon: Icon(Icons.sick, size: 40,),
                      label: Text("Plaies chroniques",
                        style: TextStyle(color: Colors.blue,fontSize: 25),))),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: SizedBox(
                  height: 100,
                  width: 300, // specific value
                  child: RaisedButton.icon(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(40.0)),
                      onPressed: () { Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => DoctorList(),));},
                      icon: Icon(Icons.cloud_download_outlined, size: 70,),
                      label: Text("Un IDE",
                        style: TextStyle(color: Colors.blue,fontSize: 30),))),
            ),
SizedBox(height: 40,),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: SizedBox(
                  height: 80,
                  width: 250, // specific value
                  child: RaisedButton.icon(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(40.0)),
                      onPressed: () {Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => Home(),));
                      },
                      icon: Icon(Icons.medical_services_outlined, size: 0,),
                      label: Text("Retour",
                        style: TextStyle(color: Colors.black,fontSize: 30),))),
            ),
          ],

        ),
      ),
    );








  }
}
