import 'dart:io';

import 'package:Test_app/network/RestClient.dart';
import 'package:Test_app/screens/authenticate/inscription.dart';
import 'package:Test_app/screens/authenticate/register.dart';
import 'package:Test_app/screens/authenticate/registermedecin.dart';
import 'package:Test_app/screens/home/Photoplaie.dart';
import 'package:Test_app/screens/home/home.dart';
import 'package:Test_app/screens/home/notifications.dart';
import 'package:Test_app/shared/loading.dart';
import 'package:analyzer/dart/ast/token.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_session/flutter_session.dart';

class Dossiermedicale extends StatelessWidget {
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
      resizeToAvoidBottomPadding: false,

      body:
    SingleChildScrollView(child:
      Center(




        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,

          children: <Widget>[

            Padding(
              padding: const EdgeInsets.all(8.0),
              child: SizedBox(
                  height: 70,
                  width: 300, // specific value
                  child: RaisedButton.icon(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(40.0)),
                      onPressed: () {
                      },
                      icon: Icon(Icons.healing, size: 70,)
                      ,
                      label: Text("Dossier médicale", style: TextStyle(fontSize: 20),))),
            ),
            SizedBox(height: 30.0),
            new Text(
              'Nom:',
              style: TextStyle(
                  color: Colors.white, fontSize: 15
              ),
            ),
            SizedBox(height: 15.0),

            new Text(
              'Prénom:',
              style: TextStyle(
                  color: Colors.white, fontSize: 15
              ),
            ),
            SizedBox(height: 15.0),

            new Text(
              'Age:',
              style: TextStyle(
                  color: Colors.white, fontSize: 15
              ),
            ),
            SizedBox(height: 15.0),

            new Text(
              'Allergies:',
              style: TextStyle(
                  color: Colors.white, fontSize: 15
              ),
            ),
            SizedBox(height: 15.0),

            new Text(
              'Tabac:',
              style: TextStyle(
                  color: Colors.white, fontSize: 15
              ),
            ),
            SizedBox(height: 15.0),

            new Text(
              'Antécedents Médicaux:',
              style: TextStyle(
                  color: Colors.white, fontSize: 15
              ),
            ),
            SizedBox(height: 15.0),
            new Text(
              'Date de début de la plaie:',
              style: TextStyle(
                  color: Colors.white, fontSize: 15
              ),
            ),
            SizedBox(height: 15.0),

            new Text(
              'Rougeur:',
              style: TextStyle(
                  color: Colors.white, fontSize: 15
              ),
            ),
            SizedBox(height: 15.0),

            new Text(
              'Chaleur:',
              style: TextStyle(
                  color: Colors.white, fontSize: 15
              ),
            ),
            SizedBox(height: 15.0),

            new Text(
              'Douleur:',
              style: TextStyle(
                  color: Colors.white, fontSize: 15
              ),
            ),
            SizedBox(height: 15.0),

            new Text(
              'Odeur:',
              style: TextStyle(
                  color: Colors.white, fontSize: 15
              ),
            ),
            SizedBox(height: 15.0),

            new Text(
              'Ecoulement:',
              style: TextStyle(
                  color: Colors.white, fontSize: 15
              ),
            ),
            SizedBox(height: 15.0),

            new Text(
              'Ostéite:',
              style: TextStyle(
                  color: Colors.white, fontSize: 15
              ),
            ),
            SizedBox(height: 15.0),

            new Text(
              'Les films dermiques:',
              style: TextStyle(
                  color: Colors.white, fontSize: 15
              ),
            ),
            SizedBox(height: 40.0),

            Padding(
              padding: const EdgeInsets.all(8.0),
              child: SizedBox(
                  height: 70,
                  width: 300, // specific value
                  child: RaisedButton.icon(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(40.0)),
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => Photoplaie(),));
                      },
                      icon: Icon(Icons.group_rounded, size: 0,)
                      ,
                      label: Text("Photo de la plaie", style: TextStyle(fontSize: 30) ,))),
            ),


          ],

        ),
      ),
    )
    );








  }
}
