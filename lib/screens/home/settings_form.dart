/* import 'package:Test_app/models/user.dart';
import 'package:Test_app/shared/loading.dart';
import 'package:flutter/material.dart';
import 'package:Test_app/shared/constants.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

class SettingsForm extends StatefulWidget {
  @override
  _SettingsFormState createState() => _SettingsFormState();
}

class _SettingsFormState extends State<SettingsForm> {
  final _formKey = GlobalKey<FormState>();
  final List<String> informations = ['0', '1', '2', '3', '4'];

  // form values
  String _currentName;
  int _currentAge;
  String _currentInformations;

  @override
  Widget build(BuildContext context) {
    User user = Provider.of<User>(context);

    return StreamBuilder<UserData>(builder: (context, snapshot) {
      if (snapshot.hasData) {
        UserData userData = snapshot.data;
        return Form(
          key: _formKey,
          child: Column(
            children: <Widget>[
              Text(
                'Update your settings.',
                style: TextStyle(fontSize: 18.0),
              ),
              SizedBox(height: 20.0),
              TextFormField(
                initialValue: userData.name,
                decoration: textInputDecoration,
                validator: (val) => val.isEmpty ? 'Please enter a name' : null,
                onChanged: (val) => setState(() => _currentName = val),
              ),
              SizedBox(height: 10.0),
              DropdownButtonFormField(
                value: _currentInformations ?? userData.informations,
                decoration: textInputDecoration,
                items: informations.map((information) {
                  return DropdownMenuItem(
                    value: information,
                    child: Text('$information infromations'),
                  );
                }).toList(),
                onChanged: (val) => setState(() => _currentInformations = val),
              ),
              SizedBox(height: 10.0),
              RaisedButton(
                  color: Colors.blue[400],
                  child: Text(
                    'Update',
                    style: TextStyle(color: Colors.white),
                  ),
                  onPressed: () async {}),
            ],
          ),
        );
      } else {
        return Loading();
      }
    });
  }
}
 */
