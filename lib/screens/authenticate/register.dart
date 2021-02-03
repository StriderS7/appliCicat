import 'dart:io';

import 'package:Test_app/network/RestClient.dart';
import 'package:Test_app/screens/authenticate/registertwo.dart';
import 'package:Test_app/screens/authenticate/sign_in.dart';
import 'package:Test_app/screens/home/rendezVous.dart';
import 'package:Test_app/shared/loading.dart';
import 'package:dio/adapter.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:logger/logger.dart';
import 'package:toggle_switch/toggle_switch.dart';


class Register extends StatefulWidget {
  final Function toggleView;
  Register({this.toggleView});

  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
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
                    Icon(Icons.group_sharp
                    , size: 50,),
                    new Text(
                      'Inscription patient:',
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
                        hintText: 'Email',
                        hintStyle: TextStyle(fontSize: 20.0, color: Colors.white),

                      ),
                      validator: (val) => val.isEmpty ? 'Enter an email' : null,
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
                        hintText: 'Nom',
                        hintStyle: TextStyle(fontSize: 20.0, color: Colors.white),

                      ),
                      validator: (val) => val.isEmpty ? 'Enter a name' : null,
                      onChanged: (val) {
                        setState(() => name = val);
                      },
                      textInputAction: TextInputAction.next,
                    ),
                    SizedBox(height: 10),
                    TextFormField(
                   /*   controller: _nameController,*/
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
                        hintText: 'Prénom',
                        hintStyle: TextStyle(fontSize: 20.0, color: Colors.white),


                      ),
                      validator: (val) => val.isEmpty ? 'Enter a firstname' : null,
                      onChanged: (val) {
                        setState(() => name = val);
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
                        hintText: 'Wilaya',
                        hintStyle: TextStyle(fontSize: 20.0, color: Colors.white),

                      ),
                      validator: (val) => val.isEmpty ? 'Enter a name' : null,
                      onChanged: (val) {
                        setState(() => name = val);
                      },
                      textInputAction: TextInputAction.next,
                    ),
                    SizedBox(height: 10),
                    TextFormField(
                    /*  controller: _nameController,*/
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
                        hintText: 'Commune',
                        hintStyle: TextStyle(fontSize: 20.0, color: Colors.white),

                      ),
                      validator: (val) => val.isEmpty ? 'Enter a name' : null,
                      onChanged: (val) {
                        setState(() => name = val);
                      },
                      textInputAction: TextInputAction.next,
                    ),
                    SizedBox(height: 10),
                    TextFormField(
                    /*  controller: _nameController,*/
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
                        hintText: 'Data de naissance',
                        hintStyle: TextStyle(fontSize: 20.0, color: Colors.white),

                      ),
                      validator: (val) => val.isEmpty ? 'Enter a name' : null,
                      onChanged: (val) {
                        setState(() => name = val);
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
                        hintText: 'Numéro de téléphone',
                        hintStyle: TextStyle(fontSize: 20.0, color: Colors.white),
                      ),
                      validator: (val) => val.isEmpty ? 'Enter a name' : null,
                      onChanged: (val) {
                        setState(() => name = val);
                      },
                      textInputAction: TextInputAction.next,
                    ),
                    SizedBox(height: 20.0),
                    ToggleSwitch(
                      minWidth: 145.0,
                      initialLabelIndex: 1,
                      cornerRadius: 20.0,
                      activeFgColor: Colors.white,
                      inactiveBgColor: Colors.grey,
                      inactiveFgColor: Colors.white,
                      labels: ['Homme', 'Femme'],

                      activeBgColors: [Colors.green, Colors.pink[300]],
                      onToggle: (index) {
                        print('switched to: $index');
                      },
                    ),
                    SizedBox(height: 20.0),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: RaisedButton(
                        onPressed: () => {Navigator.push(
                        context,
                        MaterialPageRoute(
                        builder: (context) => Registertwo(),))},
                        child: Text('Suivant'),
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
