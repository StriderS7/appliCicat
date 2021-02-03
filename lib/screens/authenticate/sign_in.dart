import 'package:Test_app/network/RestClient.dart';
import 'package:Test_app/screens/authenticate/inscription.dart';
import 'package:Test_app/screens/authenticate/register.dart';
import 'package:Test_app/screens/home/home.dart';
import 'package:Test_app/shared/loading.dart';
import 'package:analyzer/dart/ast/token.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_session/flutter_session.dart';

class SignIn extends StatefulWidget {
  final Function toggleView;
  SignIn({this.toggleView});

  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  bool loading = false;

  //text field state
  String email = '';
  String password = '';
  String error = '';

  @override
  Widget build(BuildContext context) {
    return loading
        ? Loading()
        : Scaffold(


            body: Container(
                decoration: BoxDecoration(
                    gradient: LinearGradient(
                        begin: Alignment.centerLeft,
                        end: Alignment.centerRight,
                        colors: [Colors.lightBlueAccent, Colors.blue[800]])),

              padding: EdgeInsets.symmetric(vertical: 40.0, horizontal: 50.0),
              child: Form(
                key: _formKey,
                child: Column(
                  children: <Widget>[
                    new Image.asset(
                      'assets/images/cicat.PNG',
                      width: 170,
                      height: 170,
                      fit: BoxFit.fill,
                    ),
                    SizedBox(height: 20.0),
                    TextFormField(
                      controller: _emailController,
                      decoration: InputDecoration(
                        focusedBorder: OutlineInputBorder(
                          borderRadius: const BorderRadius.all(
                            const Radius.circular(10.0),
                          ),
                          borderSide: BorderSide(color: Colors.white, width: 1.0),

                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: const BorderRadius.all(
                            const Radius.circular(10.0),
                          ),
                          borderSide: BorderSide(color: Colors.white, width: 1.0),
                        ),
                        hintText: 'Numéro de télephone',
                      ),
                      validator: (val) => val.isEmpty ? 'Entré votre numéro' : null,
                      onChanged: (val) {
                        setState(() => email = val);
                      },
                      textInputAction: TextInputAction.next,
                    ),
                    SizedBox(height: 20.0),
                    TextFormField(
                        controller: _passwordController,
                        decoration: InputDecoration(
                          focusedBorder: OutlineInputBorder(
                            borderRadius: const BorderRadius.all(
                              const Radius.circular(10.0),
                            ),
                            borderSide: BorderSide(color: Colors.white, width: 1.0),

                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: const BorderRadius.all(
                              const Radius.circular(10.0),
                            ),
                            borderSide: BorderSide(color: Colors.white, width: 1.0),
                          ),
                          hintText: 'Mot de passe',
                        ),
                        textInputAction: TextInputAction.done,
                        obscureText: true,
                        validator: (val) => val.length < 6
                            ? 'Entré votre mot de passer'
                            : null,
                        onChanged: (val) {
                          setState(() => password = val);
                        }),
                    SizedBox(height: 20.0),
                    RaisedButton(
                        color: Colors.white,
                        child: Text(
                          "S'identifier",
                          style: TextStyle(color: Colors.blue,
                              fontWeight: FontWeight.bold,
                          fontSize: 20),


                        ),
                        onPressed: () async {
                          final dio = Dio();
                          dio.options.headers["accept"] = "application/json";

                          try {
                            Response response = await Dio()
                                .post("https://cicatplus.com/api/login", data: {
                              "email": "test@gmail.com",
                              "password": "test"
                            });
                            print(response.statusCode);
                            print(response.data["token"]);
                            var session = FlutterSession();
                            await session.set("token", response.data["token"]);
                            dynamic token = await FlutterSession().get("token");
                            print("Token -------------" + token);
                          } catch (e) {
                            print(e);
                          }
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => Home(),
                              ));
                          //storage.write(key: "token", value: "token");
                        }),
                    SizedBox(height: 12.0),
                    Text(
                      error,
                      style: TextStyle(color: Colors.red, fontSize: 14.0),
                    ),

                    OutlineButton.icon(


                        onPressed: () {

                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => Inscription(),
                              ));
                        },
                        icon: Icon(Icons.person),
                        label: Text("S'inscrire"),

                    ),

                   Align(
              alignment: Alignment.bottomCenter,)
                  ],

                ),
              ),

            ),

          );
  }
}
