import 'dart:io';

import 'package:Test_app/network/RestClient.dart';
import 'package:Test_app/screens/authenticate/inscription.dart';
import 'package:Test_app/screens/authenticate/register.dart';
import 'package:Test_app/screens/authenticate/registermedecin.dart';
import 'package:Test_app/screens/home/Pansements.dart';
import 'package:Test_app/screens/home/home.dart';
import 'package:Test_app/screens/home/notifications.dart';
import 'package:Test_app/shared/loading.dart';
import 'package:analyzer/dart/ast/token.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_session/flutter_session.dart';

class Photoplaie extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    return Scaffold(

      backgroundColor: Colors.blue[600],
      appBar: AppBar(


          flexibleSpace: Image.asset('assets/images/cicat-.PNG',
              height: 100.0,

              alignment: FractionalOffset.bottomCenter),


          elevation: 0.0,
          iconTheme: IconThemeData(color: Colors.blue),
          backgroundColor: Colors.white,
          actions: [
            IconButton(
              icon: Icon(
                Icons.notifications_active_sharp,
                color: Colors.blue,
              ),
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => Notifications(),));
              },
            )]

      ),
      body: Center(




        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,

          children: <Widget>[

            Padding(
              padding: const EdgeInsets.all(8.0),


              child: new Image.asset('assets/images/plaie.jpg'),

              ),

            SizedBox(height: 80.0),
            new Text(
              '15/02/2021:',
              style: TextStyle(
                  color: Colors.white, fontSize: 30
              ),
            ),

            SizedBox(height: 40.0),

            Padding(
              padding: const EdgeInsets.all(8.0),
              child: SizedBox(
                  height: 70,
                  width: 200, // specific value
                  child: RaisedButton.icon(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(40.0)),
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => Pansements(),));
                      },
                      icon: Icon(Icons.group_rounded, size: 0,)
                      ,
                      label: Text("Retour", style: TextStyle(fontSize: 30) ,))),
            ),


          ],

        ),
      ),
    );








  }
}
