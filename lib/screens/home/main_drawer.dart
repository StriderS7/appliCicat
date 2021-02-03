import 'package:Test_app/components/tile-one.dart';
import 'package:Test_app/pages/main-page.dart';
import 'package:Test_app/screens/authenticate/register.dart';
import 'package:Test_app/screens/authenticate/sign_in.dart';
import 'package:Test_app/screens/home/AddRendezVous.dart';
import 'package:Test_app/screens/home/AddWound.dart';
import 'package:Test_app/screens/home/HomeIDE.dart';
import 'package:Test_app/screens/home/Homemedecin.dart';
import 'package:Test_app/screens/home/Pansements.dart';
import 'package:Test_app/screens/home/Profile%20IDE.dart';
import 'package:Test_app/screens/home/consultation.dart';
import 'package:Test_app/screens/home/deconnexion.dart';
import 'package:Test_app/screens/home/home.dart';
import 'package:Test_app/screens/home/infosutiles.dart';
import 'package:Test_app/screens/home/liste_medecins.dart';
import 'package:Test_app/screens/home/profile%20medecin.dart';
import 'package:Test_app/screens/home/profilePage.dart';
import 'package:Test_app/screens/home/rendezVous.dart';
import 'package:Test_app/screens/home/rendezvouspatient.dart';
import 'package:Test_app/screens/home/settings_ui.dart';
import 'package:Test_app/pages/doctor-list.dart';
import 'package:Test_app/pages/doctor-page.dart';
import 'package:Test_app/pages/list-page.dart';
import 'package:flutter/material.dart';
import 'package:Test_app/screens/home/apropos.dart';

class MainDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    return Container(
      width: 300,

      height: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(
        gradient: LinearGradient(
        begin: Alignment.centerLeft,
        end: Alignment.centerRight,
        colors: [Colors.lightBlueAccent, Colors.blue[800]])),

      child: ListView(

        children: <Widget>[

          UserAccountsDrawerHeader(decoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.centerLeft,
                  end: Alignment.centerRight,
                  colors: [Colors.lightBlueAccent, Colors.blue[800]])
          ),
            accountName: Text("Samuel Deiby"),
            accountEmail: Text("DeibySamuel@gmail.com"),

            currentAccountPicture: CircleAvatar(
              backgroundImage: new NetworkImage("https://www.greiche-scaff.com/pub/media/catalog/category/MonturesHommes-640x520.jpg"),

              child: Text(
                "",
                style: TextStyle(fontSize: 40.0,color: Colors.white),
              ),
            ),
          ),

          ListTile(

            leading: Icon(Icons.home,color: Colors.white,),
            title: Text(
              'Acceuil',
              style: TextStyle(fontSize: 18,color: Colors.white,fontWeight: FontWeight.bold),
            ),


            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => Home(),
                  ));
            },
          ),
          ListTile(

            leading: Icon(Icons.home,color: Colors.white,),
            title: Text(
              'Acceuil médecin',
              style: TextStyle(fontSize: 18,color: Colors.white,fontWeight: FontWeight.bold),
            ),


            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => Homemedecin(),
                  ));
            },
          ),
          ListTile(

            leading: Icon(Icons.home,color: Colors.white,),
            title: Text(
              'Acceuil IDE',
              style: TextStyle(fontSize: 18,color: Colors.white,fontWeight: FontWeight.bold),
            ),


            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => HomeIDE(),
                  ));
            },
          ),
         /* ListTile(
            leading: Icon(Icons.assignment),
            title: Text(
              'Ajouter un medecin',
              style: TextStyle(fontSize: 18),

            ),
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ListeMedecins(),
                  ));
            },
          ),*/
          ListTile(
            leading: Icon(Icons.arrow_back,color: Colors.white,),
            title: Text(
              'Pansements',
              style: TextStyle(fontSize: 18,color: Colors.white,fontWeight: FontWeight.bold),
            ),
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => Pansements(),
                  ));
            },
          ),
          ListTile(
            leading: Icon(Icons.calendar_today,color: Colors.white,),
            title: Text(
              'Rendez-vous',
              style: TextStyle(fontSize: 18,color: Colors.white,fontWeight: FontWeight.bold),
            ),
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => AddRendezVous(),
                  ));
            },
          ),

          ListTile(
            leading: Icon(Icons.search,color: Colors.white,),
            title: Text(
              'Consultations',
              style: TextStyle(fontSize: 18,color: Colors.white,fontWeight: FontWeight.bold),
            ),
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => Consultation(),
                  ));
            },

          ),
          ListTile(
            leading: Icon(Icons.person,color: Colors.white,),
            title: Text(
              'Information utiles',
              style: TextStyle(fontSize: 18,color: Colors.white,fontWeight: FontWeight.bold),
            ),
            onTap: () {
               Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => Infosutiles(),
                  ));
            },
          ),

          ListTile(
            leading: Icon(Icons.description,color: Colors.white,),
            title: Text(
              'Liste des medecins',
              style: TextStyle(fontSize: 18,color: Colors.white,fontWeight: FontWeight.bold),
            ),
            onTap: () {
               Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => DoctorList(),
                  ));
            },
          ),
         /* ListTile(
            leading: Icon(Icons.assignment_late),
            title: Text(
              'Alerte',
              style: TextStyle(fontSize: 18),
            ),
            onTap: () {
              /* Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => Register(),
                  )); */
            },
          ),*/
          ListTile(
            leading: Icon(Icons.person,color: Colors.white,),
            title: Text(
              'Profile medecin',
              style: TextStyle(fontSize: 18,color: Colors.white,fontWeight: FontWeight.bold),
            ),
            onTap: () {
               Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => Profilemedecin(),
                  ));
            },
          ),
          /*ListTile(
            leading: Icon(Icons.settings),
            title: Text(
              'Paramètres',
              style: TextStyle(fontSize: 18),
            ),
            onTap: () {
              /* Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => Register(),
                  )); */
            },
          ),*/
          ListTile(
            leading: Icon(Icons.arrow_back,color: Colors.white,),
            title: Text(
              'Profile patient',
              style: TextStyle(fontSize: 18,color: Colors.white,fontWeight: FontWeight.bold),
            ),
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => Profilemedecin(),
                  ));
            },

          ),
          ListTile(
            leading: Icon(Icons.arrow_back,color: Colors.white,),
            title: Text(
              'Profile IDE',
              style: TextStyle(fontSize: 18,color: Colors.white,fontWeight: FontWeight.bold),
            ),
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ProfileIDE(),
                  ));
            },

          ),
           ListTile(
            leading: Icon(Icons.arrow_back,color: Colors.white,),
            title: Text(
              'à propos',
              style: TextStyle(fontSize: 18,color: Colors.white,fontWeight: FontWeight.bold),
            ),
             onTap: () {
               Navigator.push(
                   context,
                   MaterialPageRoute(
                     builder: (context) => Apropos(),
                   ));
             },

          ),
          ListTile(
            leading: Icon(Icons.arrow_back,color: Colors.white,),
            title: Text(
              'Déconnexion',
              style: TextStyle(fontSize: 18,color: Colors.white,fontWeight: FontWeight.bold),
            ),
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => Deconnexion(),
                  ));
            },

          ),


        ],
      ),
    );
  }
}
