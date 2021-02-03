import 'dart:io';

import 'package:Test_app/network/RestClient.dart';
import 'package:Test_app/screens/home/consultation.dart';
import 'package:dio/adapter.dart';
import 'package:flutter/material.dart';
import 'package:Test_app/models/back_button.dart';
import 'package:Test_app/models//my_text_field.dart';
import 'package:dio/dio.dart';
import 'package:flutter_session/flutter_session.dart';
import 'package:logger/logger.dart';

class AddConsultation extends StatefulWidget {
  @override
  final logger = Logger();

  _AddConsultationState createState() => _AddConsultationState();
}

class _AddConsultationState extends State<AddConsultation> {
  TextEditingController _dateVisiteController = TextEditingController();
  TextEditingController _objectController = TextEditingController();
  TextEditingController _heatReportController = TextEditingController();
  TextEditingController _pressureReportController = TextEditingController();
  TextEditingController _bslController = TextEditingController();
  TextEditingController _neuroController = TextEditingController();
  TextEditingController _dateWoundController = TextEditingController();
  TextEditingController _rednessController = TextEditingController();
  TextEditingController _heatWoundController = TextEditingController();
  TextEditingController _painController = TextEditingController();
  TextEditingController _odourController = TextEditingController();
  TextEditingController _flowController = TextEditingController();
  TextEditingController _ostController = TextEditingController();
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
        title: Text('Ajouter une consultation'),
        backgroundColor: Colors.blue[400],
        elevation: 0.0,
        actions: <Widget>[],
      ),
      body: SafeArea(
        child: Column(
          children: <Widget>[
            Expanded(
                child: SingleChildScrollView(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                children: <Widget>[
                  SizedBox(height: 20),
                  TextFormField(
                    controller: _objectController,
                    decoration:
                        InputDecoration(hintText: 'Objet de la consultation'),
                    textInputAction: TextInputAction.next,
                  ),
                  SizedBox(height: 20),
                  Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: ListTile(
                      title: Text(
                          'Date de la consultation : ${_date.day} / ${_date.month} / ${_date.year}'),
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
                  SizedBox(height: 30),
                  Text(
                    'Rapport',
                    style: TextStyle(fontSize: 30),
                  ),
                  TextFormField(
                      controller: _heatReportController,
                      decoration: InputDecoration(hintText: 'Chaleur'),
                      textInputAction: TextInputAction.next,
                      keyboardType: TextInputType.number),
                  SizedBox(height: 20),
                  TextFormField(
                      controller: _pressureReportController,
                      decoration: InputDecoration(hintText: 'Pression'),
                      textInputAction: TextInputAction.next,
                      keyboardType: TextInputType.number),
                  SizedBox(height: 20),
                  TextFormField(
                      controller: _bslController,
                      decoration: InputDecoration(hintText: 'BSL'),
                      textInputAction: TextInputAction.next,
                      keyboardType: TextInputType.number),
                  SizedBox(height: 20),
                  TextFormField(
                    controller: _neuroController,
                    decoration: InputDecoration(hintText: 'Neuropathy'),
                    textInputAction: TextInputAction.next,
                  ),
                  SizedBox(height: 30),
                  Text(
                    'Bléssure',
                    style: TextStyle(fontSize: 25),
                  ),
                  SizedBox(height: 20),
                  Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: ListTile(
                      title: Text(
                          'Date de la bléssure : ${_date.day} / ${_date.month} / ${_date.year}'),
                      trailing: Icon(Icons.calendar_today),
                      onTap: _pickDate,
                    ),
                  ),
                  SizedBox(height: 20),
                  TextFormField(
                      controller: _rednessController,
                      decoration: InputDecoration(hintText: 'Rougeur'),
                      textInputAction: TextInputAction.next,
                      keyboardType: TextInputType.number),
                  SizedBox(height: 20),
                  TextFormField(
                      controller: _heatWoundController,
                      decoration: InputDecoration(hintText: 'chaleur'),
                      textInputAction: TextInputAction.next,
                      keyboardType: TextInputType.number),
                  SizedBox(height: 20),
                  TextFormField(
                      controller: _painController,
                      decoration: InputDecoration(hintText: 'Douleur'),
                      textInputAction: TextInputAction.next,
                      keyboardType: TextInputType.number),
                  SizedBox(height: 20),
                  TextFormField(
                    controller: _odourController,
                    decoration: InputDecoration(hintText: 'Odeur'),
                    textInputAction: TextInputAction.next,
                  ),
                  SizedBox(height: 20),
                  TextFormField(
                      controller: _flowController,
                      decoration: InputDecoration(hintText: 'Ecoulement'),
                      textInputAction: TextInputAction.next,
                      keyboardType: TextInputType.number),
                  SizedBox(height: 20),
                  TextFormField(
                      controller: _ostController,
                      decoration: InputDecoration(hintText: 'Osteitis'),
                      textInputAction: TextInputAction.done,
                      keyboardType: TextInputType.number),
                  SizedBox(height: 10),
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
                            try {
                              var session = FlutterSession();

                              dynamic token = await session.get("token");
                              Response response = await Dio()
                                  .post("https://cicatplus.com/api/visites",
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
                                    "date": _date.toString(),
                                    "object": _objectController.text,
                                    "patient": "api/patients/1",
                                    "heat":
                                        int.parse(_heatReportController.text),
                                    "pressure": int.parse(
                                        _pressureReportController.text),
                                    "bsl": int.parse(_bslController.text),
                                    "neuropathy": _neuroController.text,
                                    "redness": bool.fromEnvironment(
                                        _rednessController.text),
                                    "pain": int.parse(_painController.text),
                                    "odour": _odourController.text,
                                    "flow": int.parse(_flowController.text),
                                    "osteitis": int.parse(_ostController.text),
                                    "medecin": "api/medecins/1",
                                    "nurse": "api/nurses/1"
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

                            // Navigator.push(
                            //     context,
                            //     MaterialPageRoute(
                            //       builder: (context) => Consultation(),
                            //     )
                            //     );
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
