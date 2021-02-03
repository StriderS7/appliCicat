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

class Listedespatients extends StatelessWidget {
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
                      builder: (context) => Home(),));
              },
            )]

      ),
      body: Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.centerLeft,
                end: Alignment.centerRight,
                colors: [Colors.lightBlueAccent, Colors.blue[800]])),
      child: ListView(
        // This next line does the trick.
       
      ),
      ),

    );



  }
}
