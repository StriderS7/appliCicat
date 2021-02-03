
import 'package:Test_app/Navigation/Destination.dart';
import 'package:Test_app/models/test.dart';
import 'package:Test_app/screens/authenticate/register.dart';
import 'package:Test_app/screens/home/liste_medecins.dart';
import 'package:Test_app/screens/home/main_bottomNavBar.dart';
import 'package:Test_app/screens/home/main_drawer.dart';
import 'package:Test_app/screens/home/profilePage.dart';
import 'package:Test_app/screens/home/rendezVous.dart';
import 'package:bezier_chart/bezier_chart.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:date_time_picker/date_time_picker.dart';
import 'package:footer/footer.dart';
import 'package:footer/footer_view.dart';
import 'package:footer/footer.dart';
import 'package:footer/footer_view.dart';

class Notifications extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    return Scaffold(
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
      backgroundColor: Colors.blue[600],

      body: Center(




        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,

          children: <Widget>[
            Icon(
              Icons.notifications_active_outlined,
              color: Colors.white,
              size: 150.0,
              semanticLabel: 'Text to announce in accessibility modes',
            ),            new Text(
              'Notifications:',
              style: TextStyle(
                  color: Colors.white, fontSize: 50
              ),
            ),

            SizedBox(height: 80.0),

          new Container(
            height: 300,
            width: 400,
            color: Colors.white,
            child: Container(
              margin: const EdgeInsets.all(15.0),
              padding: const EdgeInsets.all(3.0),
              decoration: BoxDecoration(
                  border: Border.all(color: Colors.blueAccent)
              ),

              child: Text(
                "(1) ... Vous avez un nouveau rendez-vous!",
                textAlign: TextAlign.center,
              style: TextStyle(fontWeight: FontWeight.bold ,color: Colors.blueAccent,fontSize: 30),
              ),


            ),
          ),


            Padding(
              padding: const EdgeInsets.all(8.0),
              child: SizedBox(
                  height: 50,
                  width: 200, // specific value
                  child: RaisedButton.icon(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(40.0)),
                      onPressed: () {},
                      icon: Icon(Icons.medical_services_outlined, size: 0,),
                      label: Text("Vider"))),
            ),

          ],
        )
    ),
    );








  }
}