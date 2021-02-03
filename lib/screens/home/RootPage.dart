import 'package:Test_app/Navigation/Destination.dart';
import 'package:Test_app/screens/home/AddRendezVous.dart';
import 'package:Test_app/screens/home/home.dart';
import 'package:Test_app/screens/home/liste_medecins.dart';
import 'package:Test_app/screens/home/rendezVous.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:Test_app/models/user.dart';
import 'package:Test_app/screens/authenticate/authenticate.dart';

class RootPage extends StatelessWidget {
  const RootPage({Key key, this.destination}) : super(key: key);

  final Destination destination;

  @override
  Widget build(BuildContext context) {
    switch (destination.view) {
      case '/home':
        return Home(destination: destination);
      case '/rdv':
        return RendezVous(destination: destination);
      case '/medecin':
        return ListeMedecins(destination: destination);
    }
  }
}
