import 'package:Test_app/Navigation/Destination.dart';
import 'package:Test_app/models/user.dart';
import 'package:Test_app/screens/authenticate/sign_in.dart';
import 'package:Test_app/screens/wrapper.dart';
import 'package:Test_app/utils/DestinationView.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  runApp(MaterialApp(
    home: SignIn(),
  ));
}

class MyApp extends StatefulWidget {
  // This widget is the root of your application.
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int _navIndex = 0;
  IconData _floatIcon = Icons.person;
  int _floatIndex = 0;

   void _bottomNav(int index) {
    setState(() {
      if (index == 0) {
        _floatIcon = Icons.person;
        _floatIndex = 0;
      } else if (index == 1) {
        _floatIcon = Icons.add;
        _floatIndex = 0;
      } else if (index == 2) {
        _floatIcon = Icons.home;
        _floatIndex = 0;
      } else {
        _floatIcon = Icons.person;
        _floatIndex = 0;
      }
      _navIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: IndexedStack(
              index: _navIndex,
              children: alldestinations.map<Widget>((Destination destination) {
                return DestinationView(destination: destination);
              }).toList())),
       floatingActionButton: FloatingActionButton(
        child: Icon(_floatIcon),
        onPressed: () {
          _bottomNav(_floatIndex);
        },
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomAppBar(
        shape: CircularNotchedRectangle(),
        notchMargin: 10,
        child: Container(
          height: 60,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  FlatButton(
                    onPressed: () {
                      _bottomNav(1);
                    },
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Icon(
                          Icons.calendar_today,
                          color: Colors.grey,
                        ),
                        Text(
                          'Rendez-vous',
                          style: TextStyle(
                            color: Colors.grey,
                          ),
                        ),
                      ],
                    ),
                  ),
                  FlatButton(
                    onPressed: () {
                      _bottomNav(2);
                    },
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Icon(
                          Icons.assignment,
                          color: Colors.grey,
                        ),
                        Text(
                          'Medecins',
                          style: TextStyle(
                            color: Colors.grey,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),

              // Right Tab bar icons

              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  FlatButton(
                    onPressed: () {
                      _bottomNav(0);
                    },
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Icon(
                          Icons.show_chart,
                          color: Colors.grey,
                        ),
                        Text(
                          'Stats',
                          style: TextStyle(
                            color: Colors.grey,
                          ),
                        ),
                      ],
                    ),
                  ),
                  FlatButton(
                    onPressed: () {
                      _bottomNav(0);
                    },
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Icon(
                          Icons.info_outline,
                          color: Colors.grey,
                        ),
                        Text(
                          'Informations',
                          style: TextStyle(
                            color: Colors.grey,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}

const List<Destination> alldestinations = <Destination>[
  Destination('Home', '/home', Icons.person),
  Destination('RendezVous', '/rdv', Icons.add),
  Destination('Medecin', '/medecin', Icons.home),
  Destination('consultation', '/consultation', Icons.book),
  Destination('AddReport', '/AddReport', Icons.book),
];
