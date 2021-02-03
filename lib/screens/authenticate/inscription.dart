import 'dart:io';

import 'package:Test_app/network/RestClient.dart';
import 'package:Test_app/screens/authenticate/inscription.dart';
import 'package:Test_app/screens/authenticate/register.dart';
import 'package:Test_app/screens/authenticate/registerIDE.dart';
import 'package:Test_app/screens/authenticate/registermedecin.dart';
import 'package:Test_app/screens/home/home.dart';
import 'package:Test_app/shared/loading.dart';
import 'package:analyzer/dart/ast/token.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_session/flutter_session.dart';

class Inscription extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    return Scaffold(

      backgroundColor: Colors.blue[600],

      body: Center(




        child: Column(

          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,

          children: <Widget>[

            new Text(
              'Vous êtes un:',
              style: TextStyle(
                color: Colors.white, fontSize: 50
              ),
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
                            builder: (context) => Register(),));
                      },
                      icon: Icon(Icons.group_rounded, size: 70,)
                      ,
                      label: Text("Un patient"))),
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
                              builder: (context) => Registermedecin(),));
                      },
                      icon: Icon(Icons.medical_services, size: 70,),
                      label: Text("Un médecin"))),
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
                            builder: (context) => RegisterIDE(),));
                      },
                      icon: Icon(Icons.medical_services_outlined, size: 70,),
                      label: Text("Un IDE"))),
            ),

          ],

        ),
      ),
      );








  }
}
