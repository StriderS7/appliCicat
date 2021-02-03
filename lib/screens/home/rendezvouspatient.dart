import 'package:Test_app/Navigation/Destination.dart';
import 'package:Test_app/models/test.dart';
import 'package:Test_app/screens/authenticate/register.dart';
import 'package:Test_app/screens/home/liste_medecins.dart';
import 'package:Test_app/screens/home/main_bottomNavBar.dart';
import 'package:Test_app/screens/home/main_drawer.dart';
import 'package:Test_app/screens/home/notifications.dart';
import 'package:Test_app/screens/home/profilePage.dart';
import 'package:Test_app/screens/home/rendezVous.dart';
import 'package:bezier_chart/bezier_chart.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:date_time_picker/date_time_picker.dart';
import 'package:footer/footer.dart';
import 'package:footer/footer_view.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:logger/logger.dart';
import 'package:shared_preferences/shared_preferences.dart';



class Rendezvouspatient extends StatefulWidget {
  Rendezvouspatient({Key key, this.destination}) : super(key: key);

  final Destination destination;

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Rendezvouspatient> {
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

    return StreamProvider<List<Test>>.value(
        child: Scaffold(
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
          drawer: MainDrawer(),

          body:
          //u can replace this with TestList(), to use data from firebase
          ListView(
            children: <Widget>[


              /*  Container(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  _buildChart(
                    BezierChartScale.MONTHLY,
                    context,
                    LinearGradient(
                      colors: [
                        Colors.blue[300],
                        Colors.blue[400],
                        Colors.blue[400],
                        Colors.blue[500],
                        Colors.blue,
                      ],
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                    ),
                  ),
                ],
              ),
            ),*/

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


              Container(
                padding: null,
                decoration: BoxDecoration(
                    color: Colors.blue,
                    borderRadius: BorderRadius.only(
                      topRight: Radius.circular(40),
                      topLeft: Radius.circular(40),
                    )),),


              SizedBox(height: 20),
              TextFormField(
               // controller: _objectController,
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
                //  onTap: _pickDate,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(5.0),
                child: ListTile(
                  title: Text(
                      'Heure de la consultation : ${_time.hour}:${_time.minute}'),
                  trailing: Icon(Icons.timer),
                //  onTap: _pickTime,
                ),
              ),




            ],


          ),

          bottomSheet: Container(


            height: 100,
            width: 400,
            decoration: BoxDecoration(
                color: Colors.blue,

                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(50),
                  topLeft: Radius.circular(50),
                )

            ),





          ),



        )
    );
  }

//MAIN SAMPLE
  Widget sample6(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            Colors.black54,
            Colors.black87,
            Colors.black87,
          ],
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          _buildChart(
            BezierChartScale.MONTHLY,
            context,
            LinearGradient(
              colors: [
                Colors.red[300],
                Colors.red[400],
                Colors.red[400],
                Colors.red[500],
                Colors.red,
              ],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            ),
          ),
          _buildChart(
              BezierChartScale.YEARLY,
              context,
              LinearGradient(
                colors: [
                  Colors.purple[300],
                  Colors.purple[400],
                  Colors.purple[400],
                  Colors.purple[500],
                  Colors.purple,
                ],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ))
        ],
      ),
    );
  }

  _buildChart(
      BezierChartScale scale, BuildContext context, LinearGradient gradient) {
    final fromDate = DateTime(2012, 11, 22);
    final toDate = DateTime.now();

    final date1 = DateTime.now().subtract(Duration(days: 2));
    final date2 = DateTime.now().subtract(Duration(days: 3));

    final date3 = DateTime.now().subtract(Duration(days: 300));
    final date4 = DateTime.now().subtract(Duration(days: 320));

    final date5 = DateTime.now().subtract(Duration(days: 650));
    final date6 = DateTime.now().subtract(Duration(days: 652));

    return Center(
      child: Card(
        elevation: 10,
        margin: EdgeInsets.all(25.0),
        child: Container(
          height: MediaQuery.of(context).size.height / 3,
          width: MediaQuery.of(context).size.width,
          child: BezierChart(
            bezierChartScale: scale,
            fromDate: fromDate,
            toDate: toDate,
            selectedDate: toDate,
            series: [
              BezierLine(
                label: "Duty",
                onMissingValue: (dateTime) {
                  if (dateTime.year.isEven) {
                    return 20.0;
                  }
                  return 5.0;
                },
                data: [
                  DataPoint<DateTime>(value: 10, xAxis: date1),
                  DataPoint<DateTime>(value: 50, xAxis: date2),
                  DataPoint<DateTime>(value: 100, xAxis: date3),
                  DataPoint<DateTime>(value: 100, xAxis: date4),
                  DataPoint<DateTime>(value: 40, xAxis: date5),
                  DataPoint<DateTime>(value: 47, xAxis: date6),
                ],
              ),
            ],
            config: BezierChartConfig(
              verticalIndicatorStrokeWidth: 3.0,
              verticalIndicatorColor: Colors.black26,
              showVerticalIndicator: true,
              verticalIndicatorFixedPosition: false,
              backgroundGradient: gradient,
              footerHeight: 35.0,
            ),
          ),
        ),
      ),
    );
  }
}
