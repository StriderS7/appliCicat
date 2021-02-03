import 'dart:io';

import 'package:Test_app/network/RestClient.dart';
import 'package:Test_app/screens/authenticate/registertwo.dart';
import 'package:Test_app/screens/authenticate/sign_in.dart';
import 'package:Test_app/screens/home/home.dart';
import 'package:Test_app/screens/home/rendezVous.dart';
import 'package:Test_app/shared/loading.dart';
import 'package:dio/adapter.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:logger/logger.dart';
import 'package:toggle_switch/toggle_switch.dart';


class ConfirmationMDP extends StatefulWidget {
  final Function toggleView;
  ConfirmationMDP({this.toggleView});

  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<ConfirmationMDP> {
  TextEditingController _emailController = TextEditingController();
  TextEditingController _usernameController = TextEditingController();
  TextEditingController _nameController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  bool loading = false;

  //text field state
  String nom = '';
  String prenom = '';
  String Wilaya = '';
  String Commune = '';
  String email = '';
  String roles = '';
  String username = '';
  String name = '';
  String password = '';
  String error = '';

  @override
  Widget build(BuildContext context) {
    return loading
        ? Loading()
        : Scaffold(
      backgroundColor: Colors.blue[600],

      body: Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.centerLeft,
                end: Alignment.centerRight,
                colors: [Colors.lightBlueAccent, Colors.blue[800]])),
        padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 50.0),
        child: Form(
          key: _formKey,

          child: ListView(
            children: <Widget>[
              Icon(Icons.medical_services_outlined
                , size: 50,),
              new Text(
                'Crée votre mot de passe:',
                style: TextStyle(
                    color: Colors.white, fontSize: 30
                ),
                textAlign: TextAlign.center,

              ),

              SizedBox(height: 20.0),
              TextFormField(
                /*controller: _emailController,*/
                decoration: InputDecoration(
                  focusedBorder: OutlineInputBorder(
                    borderRadius: const BorderRadius.all(
                      const Radius.circular(10.0),
                    ),
                    borderSide: BorderSide(color: Colors.white, width: 1.0),

                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: const BorderRadius.all(
                      const Radius.circular(10.0),
                    ),
                    borderSide: BorderSide(color: Colors.white, width: 1.0),
                  ),
                  hintText: 'Mot de passe',
                  hintStyle: TextStyle(fontSize: 20.0, color: Colors.white),

                ),
                validator: (val) => val.isEmpty ? 'Tapez un mot de passe' : null,
                onChanged: (val) {
                  setState(() => email = val);
                },
                textInputAction: TextInputAction.next,
              ),
              SizedBox(height: 10),
              TextFormField(
                /* controller: _nameController,*/
                decoration: InputDecoration(focusedBorder: OutlineInputBorder(
                  borderRadius: const BorderRadius.all(
                    const Radius.circular(10.0),
                  ),
                  borderSide: BorderSide(color: Colors.white, width: 1.0),

                ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: const BorderRadius.all(
                      const Radius.circular(10.0),
                    ),
                    borderSide: BorderSide(color: Colors.white, width: 1.0),
                  ),
                  hintText: 'Confirmez le mot de passe',
                  hintStyle: TextStyle(fontSize: 20.0, color: Colors.white),

                ),
                validator: (val) => val.isEmpty ? 'Entrez à nouveau votre mot de passe' : null,
                onChanged: (val) {
                  setState(() => name = val);
                },
                textInputAction: TextInputAction.next,
              ),


              SizedBox(height: 20.0),

              SizedBox(height: 20.0),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: RaisedButton(
                  onPressed: () => {Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => Home(),))},
                  child: Text('Confirmer'),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: RaisedButton(
                  onPressed: () => {

                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => SignIn(),))
                  },
                  child: Text('Annulé'),

                ),

              ),
              SizedBox(height: 12.0),
              Text(
                error,
                style: TextStyle(color: Colors.red, fontSize: 14.0),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
