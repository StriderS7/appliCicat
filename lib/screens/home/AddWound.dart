import 'dart:io';

import 'package:Test_app/network/RestClient.dart';
import 'package:Test_app/screens/home/AddConsultation.dart';
import 'package:Test_app/screens/home/consultation.dart';
import 'package:dio/adapter.dart';
import 'package:flutter/material.dart';
import 'package:Test_app/models/back_button.dart';
import 'package:Test_app/models//my_text_field.dart';
import 'package:dio/dio.dart';
import 'package:logger/logger.dart';

class AddWound extends StatefulWidget {
  @override
  final logger = Logger();

  _AddWoundState createState() => _AddWoundState();
}

class _AddWoundState extends State<AddWound> {
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
        title: Text('Données relavies à la Blessure'),
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
                  Text(
                    'Blessure',
                    style: TextStyle(fontSize: 25),
                  ),
                  SizedBox(height: 20),
                  Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: ListTile(
                      title: Text(
                          'Date de la blessure : ${_date.day} / ${_date.month} / ${_date.year}'),
                      trailing: Icon(Icons.calendar_today),
                      onTap: _pickDate,
                    ),
                  ),
                  SizedBox(height: 20),
                  TextFormField(
                    controller: _rednessController,
                    decoration: InputDecoration(hintText: 'Rougeur'),
                    textInputAction: TextInputAction.next,
                  ),
                  SizedBox(height: 20),
                  TextFormField(
                    controller: _heatWoundController,
                    decoration: InputDecoration(hintText: 'chaleur'),
                    textInputAction: TextInputAction.next,
                  ),
                  SizedBox(height: 20),
                  TextFormField(
                    controller: _painController,
                    decoration: InputDecoration(hintText: 'Douleur'),
                    textInputAction: TextInputAction.next,
                  ),
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
                  ),
                  SizedBox(height: 20),
                  TextFormField(
                    controller: _ostController,
                    decoration: InputDecoration(hintText: 'Osteitis'),
                    textInputAction: TextInputAction.done,
                  ),
                  SizedBox(height: 10),
                ],
              ),
            )),
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
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
                        'Terminer',
                        style: TextStyle(fontSize: 20),
                      ),
                      onPressed: () async {
                        final dio = Dio();
                        dio.options.headers["accept"] = "application/json";
                        final client = RestClient(dio);
                        client.postVisite(
                            _dateVisiteController.text, _objectController.text);
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => Consultation(),
                            ));
                      }),
                ),
              ),
            ),
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
