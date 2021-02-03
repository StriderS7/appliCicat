/* import 'package:Test_app/models/user.dart';
import 'package:Test_app/screens/authenticate/authenticate.dart';
import 'package:Test_app/screens/home/home.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Wrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<User>(context);
    print(user);

    //return home or auth widget
    if (user == null) {
      return Authenticate();
    } else {
      return Home();
    }
  }
}
 */
