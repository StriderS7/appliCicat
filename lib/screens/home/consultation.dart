import 'dart:convert';
import 'dart:io';

import 'package:Test_app/Navigation/Destination.dart';
import 'package:Test_app/network/RestClient.dart';
import 'package:Test_app/screens/home/AddConsultation.dart';
import 'package:Test_app/screens/home/main_drawer.dart';
import 'package:dio/adapter.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_session/flutter_session.dart';
import 'package:dio/dio.dart';
import 'package:logger/logger.dart';
import 'package:shared_preferences/shared_preferences.dart';


class Consultation extends StatefulWidget {
  Consultation({Key key, this.destination}) : super(key: key);

  final Destination destination;
  bool isExpanded = false;
  @override
  _ConsultationState createState() => _ConsultationState();
}

SharedPreferences localStorage;

class _ConsultationState extends State<Consultation> {
  DateTime _dateTime = DateTime.now();
  final logger = Logger();

  Future getList() async {
    var session = FlutterSession();
    dynamic token = await session.get("token");

    try {
      Response response = await Dio().get("https://cicatplus.com/api/visites",
          options: Options(
              followRedirects: false,
              validateStatus: (status) {
                return status < 500;
              },
              headers: {
                "accept": "application/json",
                "Authorization": "Bearer $token",
                "Content-Type": "application/json"
              }));
      print("-----------------------------" + response.statusCode.toString());

      var data = response.data;
      _mesRdvs.clear();
      for (var rdv in data) {
        _mesRdvs.add(Visite.fromJson(rdv));
      }
      renderPosts();
      return _mesRdvs;
    } catch (e) {
      print(e);
    }
  }

  void initState() {
    super.initState();
    (dio.httpClientAdapter as DefaultHttpClientAdapter).onHttpClientCreate =
        (HttpClient client) {
      client.badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
      return client;
    };
  }

  final dio = Dio();

  List<Visite> _mesRdvs = List<Visite>();

  void renderPosts() {
    _mesRdvs.forEach((rdv) => rdv.isExpanded = false);
  }

  /* Future<String> callAsyncFetch() async {
    Future.delayed(Duration(seconds: 2), () => "hi");
  } */

  @override
  Widget build(BuildContext context) => FutureBuilder(
        future: getList(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            //debugPrint('Step 3, build widget: ${snapshot.data}');
            // Build the widget with data.
            return Scaffold(
              appBar: AppBar(
                title: Text('Consultations'),
              ),
              drawer: MainDrawer(),
              body: ListView(
                children: [
                  Container(
                    height: 100,
                    child: Container(
                      margin: EdgeInsets.fromLTRB(20.0, 6.0, 20.0, 0.0),
                      child: Container(
                        child: CupertinoDatePicker(
                            initialDateTime: DateTime.now(),

                            //fix bug
                            mode: CupertinoDatePickerMode.date,

                            //columnType: PickerColumnType.month,

                            onDateTimeChanged: (dateTime) {
                              setState(() {
                                _dateTime = dateTime;
                              });
                            }),
                      ),
                    ),
                  ),
                  Column(
                    children: [_buildPanel()],
                  ),
                ],
              ),
              floatingActionButton: FloatingActionButton(
                child: Icon(Icons.add),
                onPressed: () async {
                  Navigator.of(context).push(
                      MaterialPageRoute(builder: (_) => AddConsultation()));
                },
              ),
            );
          } else {
            // We can show the loading view until the data comes back.
            // debugPrint(
            //     'Step 1, build loading widget ${snapshot.data["id"].toString()}');
            return Scaffold(
              appBar: AppBar(
                title: Text('Consultations'),
              ),
              drawer: MainDrawer(),
              body: Center(
                child: CircularProgressIndicator(),
              ),
              floatingActionButton: FloatingActionButton(
                child: Icon(Icons.add),
                onPressed: () async {
                  Navigator.of(context).push(
                      MaterialPageRoute(builder: (_) => AddConsultation()));
                  // dynamic token = await FlutterSession().get("token");
                  // print("Token -------------" + token);
                },
              ),
              //bottomNavigationBar: MainBottomNavBar(),
            );
          }
        },
      );

  Widget _buildPanel() {
    return ExpansionPanelList(
      expansionCallback: (int index, bool isExpanded) {
        setState(() {
          _mesRdvs[index].isExpanded = !isExpanded;
        });
      },
      children: _mesRdvs.map<ExpansionPanel>((Visite rdv) {
        return ExpansionPanel(
          headerBuilder: (BuildContext context, bool isExpanded) {
            return Row(
              children: [
                Container(
                  width: 100,
                  child: ListTile(
                    title: Text(rdv.object.toString()),
                  ),
                ),
                Expanded(
                  child: ListTile(
                    title: Text(rdv.object),
                    subtitle: Text(rdv.date),
                  ),
                ),
              ],
            );
          },
          body: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                alignment: Alignment.centerLeft,
                margin: EdgeInsets.fromLTRB(70, 0, 10, 10),
                child: Text(
                  rdv.object,
                ),
              ),
              Container(
                alignment: Alignment.centerLeft,
                margin: EdgeInsets.fromLTRB(70, 10, 10, 10),
                child: Text(
                  rdv.object,
                ),
              ),
              Container(
                alignment: Alignment.centerLeft,
                margin: EdgeInsets.fromLTRB(70, 10, 10, 20),
                child: Text(
                  rdv.object,
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  FlatButton(
                    child: const Text('Edit'),
                    onPressed: () {},
                  ),
                  FlatButton(
                    child: const Text('delete'),
                    onPressed: () {},
                  ),
                ],
              )
            ],
          ),
          isExpanded: rdv.isExpanded,
        );
      }).toList(),
    );
  }
}

class LifecycleEventHandler extends WidgetsBindingObserver {
  final AsyncCallback resumeCallBack;
  final AsyncCallback suspendingCallBack;

  LifecycleEventHandler({
    this.resumeCallBack,
    this.suspendingCallBack,
  });

  @override
  Future<void> didChangeAppLifecycleState(AppLifecycleState state) async {
    switch (state) {
      case AppLifecycleState.resumed:
        if (resumeCallBack != null) {
          await resumeCallBack();
        }
        break;
      case AppLifecycleState.inactive:
      case AppLifecycleState.paused:
      case AppLifecycleState.detached:
        if (suspendingCallBack != null) {
          await suspendingCallBack();
        }
        break;
    }
  }
}
