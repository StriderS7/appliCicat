import 'dart:io';

import 'package:Test_app/Navigation/Destination.dart';
import 'package:Test_app/network/RestClient.dart';
import 'package:Test_app/screens/home/consultation.dart';
import 'package:Test_app/screens/home/notifications.dart';
import 'package:Test_app/screens/home/rendezVous.dart';
import 'package:dio/adapter.dart';
import 'package:flutter/material.dart';
import 'package:Test_app/models/back_button.dart';
import 'package:Test_app/models//my_text_field.dart';
import 'package:dio/dio.dart';
import 'package:flutter_session/flutter_session.dart';
import 'package:logger/logger.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AddRendezVous extends StatefulWidget {
  @override
  final logger = Logger();

  _AddRendezVousState createState() => _AddRendezVousState();
}

SharedPreferences localStorage;

class _AddRendezVousState extends State<AddRendezVous> {
  TextEditingController _titleController = TextEditingController();
  TextEditingController _statusController = TextEditingController();
  DateTime _date = DateTime.now();
  Future<Null> selectDate(BuildContext context) async {
    final DateTime picked = await showDatePicker(
        context: context,
        initialDate: _date,
        firstDate: DateTime(2018),
        lastDate: DateTime(2120));
    if (picked != null && picked != _date) {
      setState(() {
        _date = picked;
        print(_date.toString());
      });
    }
  }

  TimeOfDay _time;
  @override
  void initState() {
    super.initState();
    _time = TimeOfDay.now();
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    var downwardIcon = Icon(
      Icons.keyboard_arrow_down,
    );
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

      body: SafeArea(
        child: Column(
          children: <Widget>[
            Expanded(
                child: SingleChildScrollView(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                children: <Widget>[
                  Center(
                    child: Container(
                      margin: const EdgeInsets.all(20.0),

                      child: new Text(
                        'PROCHAIN RENDEZ-VOUS:',
                        style: TextStyle(
                            color: Colors.black, fontSize: 25
                        ),
                        textAlign: TextAlign.center,

                      ),


                    ),

                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Icon(
                        Icons.date_range_outlined,
                        color: Colors.lightBlue,
                        size: 130,

                      ),

                      Text(
                        '28/01/2021, 14h30',
                        style: TextStyle(
                            color: Colors.black, fontSize: 25
                        ),
                        textAlign: TextAlign.center,

                      ),

                    ],
                  ),
                  
                  SizedBox(height: 20),
                  TextFormField(
                    controller: _titleController,
                    decoration:
                        InputDecoration(hintText: 'Objet de la consultation'),
                    textInputAction: TextInputAction.next,
                  ),
                  SizedBox(height: 20),
                  Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: ListTile(
                      title: Text(
                          'Heure de la consultation : ${_date.day}/${_date.month}/${_date.year}'),
                      trailing: Icon(Icons.calendar_today),
                      onTap: _pickDate,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: ListTile(
                      title: Text(
                          'Heure de la consultation : ${_time.hour}:${_time.minute}'),
                      trailing: Icon(Icons.timer),
                      onTap: _pickTime,
                    ),
                  ),
                  SizedBox(height: 20),
                  TextFormField(
                    controller: _statusController,
                    decoration: InputDecoration(hintText: 'Status'),
                    textInputAction: TextInputAction.next,
                  ),
                  SizedBox(height: 30),
                  Container(
                    height: 60,
                    width: 130,
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(0, 10, 0, 10),
                      child: RaisedButton(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20)),
                          color: Colors.blue,
                          textColor: Colors.white,
                          padding: EdgeInsets.all(8.0),
                          child: Text(
                            'Ajouter',
                            style: TextStyle(fontSize: 20),
                          ),
                          onPressed: () async {
                            //final dio = Dio();

                            try {
                              var session = FlutterSession();

                              dynamic token = await session.get("token");
                              Response response = await Dio()
                                  .post("https://cicatplus.com/api/rdvs",
                                      options: Options(
                                          followRedirects: false,
                                          validateStatus: (status) {
                                            return status < 500;
                                          },
                                          headers: {
                                            "accept": "application/json",
                                            "Authorization": "Bearer $token",
                                            "Content-Type": "application/json"
                                          }),
                                      data: {
                                    "title": _titleController.text,
                                    "date": _date.toString(),
                                    "status": int.parse(_statusController.text)
                                  });
                              print("-----------------------------" +
                                  response.statusCode.toString());
                              await session.set(
                                  "token", response.data["token"]);

                              print("Token -------------" + token);
                              //.then((value) => renderPosts(value))
                              //var data = response.data;
                            } catch (e) {
                              print(e);
                            }
                            //final client = RestClient(dio);

                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => RendezVous(),
                                ));
                          }),
                    ),
                  ),
                ],
              ),
            )),
          ],
        ),
      ),
    );
  }

  _pickTime() async {
    TimeOfDay time = await showTimePicker(context: context, initialTime: _time);
    if (time != null) {
      setState(() {
        _time = time;
      });
    }
  }

  _pickDate() async {
    final DateTime picked = await showDatePicker(
        context: context,
        initialDate: _date,
        firstDate: DateTime(2018),
        lastDate: DateTime(2120));
    if (picked != null && picked != _date) {
      setState(() {
        _date = picked;
        print(_date.toString());
      });
    }
  }
}
