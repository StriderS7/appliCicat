import 'package:Test_app/Navigation/Destination.dart';
import 'package:Test_app/screens/home/RootPage.dart';
import 'package:analyzer/dart/ast/ast.dart';
import 'package:flutter/material.dart';

class DestinationView extends StatefulWidget {
  const DestinationView({Key key, this.destination}) : super(key: key);

  final Destination destination;

  @override
  _DestinationViewState createState() => _DestinationViewState();
}

class _DestinationViewState extends State<DestinationView> {
  @override
  Widget build(BuildContext context) {
    return Navigator(
      onGenerateRoute: (RouteSettings settings) {
        return MaterialPageRoute(
          settings: settings,
          builder: (BuildContext context) {
            return RootPage(destination: widget.destination);
          },
        );
      },
    );
  }
}
