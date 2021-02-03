import 'dart:io';
import 'package:Test_app/screens/home/notifications.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_session/flutter_session.dart';
import 'package:Test_app/screens/home/apropos.dart';

class Apropos extends StatelessWidget {
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
      body: Container(

        decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.centerLeft,
                end: Alignment.centerRight,
                colors: [Colors.lightBlueAccent, Colors.blue[800]])),


        child: Column(


          children: <Widget>[

              Image.asset('assets/images/cicat.PNG',
                height: 100,
                width: 100,),


            new Text(
              'A propos:',
              style: TextStyle(
                  color: Colors.white, fontSize: 20
              ),
            ),
            SizedBox(height: 30.0),
            new Text(
              "Cicat+ est la solution 'Plaies et Cicatrisations' complète et indépendante, réalisée pour les professionnels de santé. Afin de faciliter l'accompagnement des patients porteurs de plaies, Circat+ a réuni un groupe d'experts de la plaie a la fois multi professionnel et multidisciplinaire reflétant la diversité de la prise en charge.",
              style: TextStyle(
                  color: Colors.white, fontSize: 16
              ),
            ),
            SizedBox(height: 15.0),
            new Text(
              'Mission:',
              style: TextStyle(
                  color: Colors.white, fontSize: 20
              ),
            ),
            SizedBox(height: 15.0),
            new Text(
              " Aide à l'identification et à la categorisation des plaies aigues et chroniques.  Guide d'identification des différents stades de la plaie.  Descriptif complet des dispositifs du marché (Formats, indications, remboursements, ACL…) de la majorité des laboratoires, en totale independance.  Lien direct entre medecin, IDE et patient (partage de photos et données cliniques).  Recommandations et guides de bonne pratique (H.A.S).  Fil d'actualité spécifique Plaies et Cicatrisations. Pré-inscriptions aux sessions de formation et ateliers pratiques. ",
              style: TextStyle(
                  color: Colors.white, fontSize: 18
              ),
            ),

          ],

        ),
      ),
    );



  }
}
