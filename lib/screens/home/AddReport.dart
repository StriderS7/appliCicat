import 'dart:io';

import 'package:Test_app/network/RestClient.dart';
import 'package:Test_app/screens/home/AddWound.dart';
import 'package:Test_app/screens/home/consultation.dart';
import 'package:dio/adapter.dart';
import 'package:flutter/material.dart';
import 'package:Test_app/models/back_button.dart';
import 'package:Test_app/models//my_text_field.dart';
import 'package:dio/dio.dart';
import 'package:logger/logger.dart';

class AddReport extends StatefulWidget {
  @override
  final logger = Logger();

  _AddReportState createState() => _AddReportState();
}

class _AddReportState extends State<AddReport> {
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
        title: Text('Ajouter le Rapport'),
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
                        'Suivant',
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
                              builder: (context) => AddWound(),
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
