import 'package:flutter/material.dart';
import '../components/tile-one.dart';

class DoctorList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var color2 = Color(0xDDf7f5fb);

    var lists = [
      {
        'index': '1',
        'image': 'assets/images/3.jpg',
        'title': 'Dr. Emily Wilson',
        'rating': '5.0',
        'experience': '2',
        'subtitle': 'Physician'
      },
      {
        'index': '2',
        'image': 'assets/images/4.jpg',
        'title': 'Dr. Dave Nolan',
        'rating': '5.0',
        'experience': '3',
        'subtitle': 'Physician'
      },
      {
        'index': '3',
        'image': 'assets/images/5.jpg',
        'title': 'Dr. Ann Devin',
        'rating': '4.9',
        'experience': '3',
        'subtitle': 'Neurologist'
      },
      {
        'index': '4',
        'image': 'assets/images/6.jpg',
        'title': 'Dr. Nina Thomson',
        'rating': '4.9',
        'experience': '3',
        'subtitle': 'Neurologist'
      },
      {
        'index': '5',
        'image': 'assets/images/7.jpg',
        'title': 'Dr. Bill Rhodney',
        'rating': '4.8',
        'experience': '3',
        'subtitle': 'Oncologist'
      },
      {
        'index': '6',
        'image': 'assets/images/8.jpeg',
        'title': 'Dr. Emily Wilson',
        'rating': '4.5',
        'experience': '2',
        'subtitle': 'Physician'
      },
      {
        'index': '7',
        'image': 'assets/images/9.jpg',
        'title': 'Dr. Dave Nolan',
        'rating': '4.3',
        'experience': '3',
        'subtitle': 'Physician'
      },
      {
        'index': '8',
        'image': 'assets/images/10.jpg',
        'title': 'Dr. Ann Devin',
        'rating': '4.3',
        'experience': '3',
        'subtitle': 'Pediatrician'
      },
      {
        'index': '9',
        'image': 'assets/images/6.jpg',
        'title': 'Dr. Nina Thomson',
        'rating': '4.3',
        'experience': '3',
        'subtitle': 'Pediatrician'
      },
      {
        'index': '0',
        'image': 'assets/images/7.jpg',
        'title': 'Dr. Bill Rhodney',
        'rating': '4.8',
        'experience': '3',
        'subtitle': 'Oncologist'
      },
    ];

    return Scaffold(
        backgroundColor: color2,
        appBar: AppBar(

            backgroundColor: Colors.transparent,
            elevation: 0.0,
            leading: IconButton(
              icon: Icon(
                Icons.arrow_back,
                color: Colors.black,
                size: 20,
              ),
              onPressed: () => Navigator.of(context).pop(),
            ),
            actions: <Widget>[
              Padding(
                padding: const EdgeInsets.only(right: 18.0),
                child: Icon(
                  Icons.filter_list,
                  color: Colors.black,
                ),
              ),
            ],
            title: Text('Liste des medecins',
                style: TextStyle(
                    color: Colors.grey.shade900,
                    fontWeight: FontWeight.w400,
                    fontSize: 18.0))),
        body: SingleChildScrollView(
          child: Container(
            decoration: BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment.centerLeft,
                    end: Alignment.centerRight,
                    colors: [Colors.lightBlueAccent, Colors.blue[800]])),
            width: double.infinity,
            child: Container(
              padding: EdgeInsets.all(5.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(
                        left: 15.0, top: 25.0, bottom: 5.0),
                    child:
                        Text('All doctors', style: TextStyle(fontSize: 10.0)),
                  ),
                  SizedBox(height: 10),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: lists
                        .map((v) => TileOne(
                              index: v['index'],
                              title: v['title'],
                              subtitle: v['subtitle'],
                              image: v['image'],
                              rating: v['rating'],
                              experience: v['experience'],
                            ))
                        .toList(),
                  ),
                ],
              ),
            ),
          ),
        ));
  }
}
