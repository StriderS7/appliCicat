import 'dart:io';

import 'package:Test_app/network/RestClient.dart';
import 'package:Test_app/screens/authenticate/inscription.dart';
import 'package:Test_app/screens/authenticate/register.dart';
import 'package:Test_app/screens/authenticate/registermedecin.dart';
import 'package:Test_app/screens/home/home.dart';
import 'package:Test_app/screens/home/notifications.dart';
import 'package:Test_app/shared/loading.dart';
import 'package:analyzer/dart/ast/token.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_session/flutter_session.dart';

class Pansements extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    return Scaffold(

      backgroundColor: Colors.blue[600],
      appBar: AppBar(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(
              bottom: Radius.circular(30),
            ),
          ),

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
      body: SingleChildScrollView(




        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,

          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: SizedBox(
                  height: 100,
                  width: 300, // specific value
                  child: RaisedButton.icon(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(40.0)),
                      onPressed: () {
                      },
                      icon: Icon(Icons.healing, size: 70,)
                      ,
                      label: Text("Pansements", style: TextStyle(fontSize: 20),))),
            ),
            SizedBox(height: 80.0),
            new Text(
              'Les hydroclloîdes:',
              style: TextStyle(
                  color: Colors.white, fontSize: 30
              ),
            ),
            SizedBox(height: 30.0),

            new Text(
              'Les hydrogels:',
              style: TextStyle(
                  color: Colors.white, fontSize: 30
              ),
            ),
            SizedBox(height: 30.0),

            new Text(
              '  Les pansements au charbon:',
              style: TextStyle(
                  color: Colors.white, fontSize: 30
              ),
            ),
            SizedBox(height: 30.0),

            new Text(
              'Les hydocellulaires:',
              style: TextStyle(
                  color: Colors.white, fontSize: 30
              ),
            ),
            SizedBox(height: 30.0),

            new Text(
              'Les alginates:',
              style: TextStyle(
                  color: Colors.white, fontSize: 30
              ),
            ),
            SizedBox(height: 30.0),

            new Text(
              'Les films dermiques:',
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
                              builder: (context) => Home(),));
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
