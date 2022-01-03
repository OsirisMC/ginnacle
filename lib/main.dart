import 'dart:convert';
import 'package:flutter/material.dart';
import 'Menu.dart';
import 'package:ginnacle3flutter/pages/calendar.dart';
import 'package:ginnacle3flutter/pages/consulta.dart';
import 'package:ginnacle3flutter/pages/registro.dart';
import 'package:http/http.dart' as http;
import 'details.dart';

void main() => runApp(LoginApp());

String username;

class LoginApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'ginnacle',
      home: LoginPage(),
      routes: <String, WidgetBuilder>{
        '/LoginPage': (BuildContext context) => new LoginPage(),
        '/CalendarPage': (BuildContext context) => new Calendar(),
      },
    );
    // TODO: implement build
  }
}

class LoginPage extends StatefulWidget {
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController cEmail = new TextEditingController();
  TextEditingController cContrasena = new TextEditingController();

  Future<void> getData() async {
    String emailF = cEmail.text;
    String contrasenaF = cContrasena.text;
    var data = {'email': emailF, 'contraseña': contrasenaF};
    final response = await http.post(
        Uri.parse("https://ginnacle.000webhostapp.com/login.php"),
        body: json.encode(data));
    print(response.body);
    var message = jsonDecode(response.body);
    if (message == "Login Matched") {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => HomeScreen()),
      );
    } else {
      print("Entre al Else");
      showDialog(
          context: context,
          builder: (context) => AlertDialog(
                title: Text("Error en email o contraseña"),
                actions: [
                  TextButton(
                    child: Text("Ok"),
                    onPressed: () {
                      Navigator.pop(context);
                      setState(() {});
                      return;
                    },
                  ),
                ],
              ));
    }
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    final ButtonStyle raisedB = OutlinedButton.styleFrom(
        primary: Colors.white,
        backgroundColor: Colors.pink,
        minimumSize: Size(20,40)
    );
    final ButtonStyle raisedIS = OutlinedButton.styleFrom(
        primary: Colors.pink,
        backgroundColor: Colors.white,
        minimumSize: Size(20,40)
    );
    return Scaffold(
      body: Container(
        color: Colors.pink,
        width: MediaQuery.of(context).size.width * 1,
        height: MediaQuery.of(context).size.height * 1,
        child: Center(
          child: Container(
            decoration: BoxDecoration(
                color: Colors.white,
                shape: BoxShape.rectangle,
                border: Border.all(width: 5.0, color: Colors.white),
                borderRadius: BorderRadius.all(Radius.circular(30)),
                boxShadow: [
                  new BoxShadow(
                    color: Colors.black,
                    offset: new Offset(0, 0),
                    blurRadius: 2.0,
                  )
                ]),
            width: MediaQuery.of(context).size.width * 0.90,
            height: MediaQuery.of(context).size.height * .5,
            child: Column(
              // horizontal).
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Container(
                  margin: const EdgeInsets.only(bottom: 20.0),
                  child: Text(
                    'Ginnacle',
                    style: TextStyle(
                        color: Colors.pink,
                        fontWeight: FontWeight.bold,
                        fontSize: 20),
                  ),
                ),
                Form(
                  child: Column(
                    children: [
                      Container(
                          child: Padding(
                              padding: EdgeInsets.symmetric(horizontal: 16.0),
                              child: TextFormField(
                                controller: cEmail,
                                keyboardType: TextInputType.emailAddress,
                                autofocus: false,
                                decoration: InputDecoration(
                                  prefixIcon: Icon(Icons.email),
                                  focusedBorder: OutlineInputBorder(
                                      borderSide:
                                      BorderSide(color: Colors.pink)),
                                  labelText: "e-mail",
                                  contentPadding: EdgeInsets.fromLTRB(
                                      20.0, 10.0, 20.0, 10.0),
                                  border: OutlineInputBorder(
                                      borderRadius:
                                      BorderRadius.circular(32.0)),
                                ),
                              ))),
                      SizedBox(height: 15.0),
                      Container(
                          child: Padding(
                              padding: EdgeInsets.symmetric(horizontal: 16.0),
                              child: TextFormField(
                                controller: cContrasena,
                                autofocus: false,
                                obscureText: true,
                                decoration: InputDecoration(
                                  prefixIcon: Icon(Icons.lock),
                                  focusedBorder: OutlineInputBorder(
                                      borderSide:
                                      BorderSide(color: Colors.pink)),
                                  labelText: "Password",
                                  contentPadding: EdgeInsets.fromLTRB(
                                      20.0, 10.0, 20.0, 10.0),
                                  border: OutlineInputBorder(
                                      borderRadius:
                                      BorderRadius.circular(32.0)),
                                ),
                              ))),
                      Container(
                        child: Padding(
                          padding: EdgeInsets.only(top: 16.0),
                          child: SizedBox(
                            width: 200,
                            child: RaisedButton(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(24),
                              ),
                              onPressed: () {
                                getData();
                                // Navigator.push(
                                //   context,
                                //   MaterialPageRoute(
                                //       builder: (context) => HomeScreen()),
                                // );
                              },
                              color: Color(0xfff4889a),
                              child: Text('Log In',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20)),
                            ),
                          ),
                        ),
                      ),
                      Container(
                        height: 9.0,
                      ),
                      Container(
                        child: SizedBox(
                          width: 200,
                          child: RaisedButton(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(24),
                            ),
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => registro()),
                              );
                            },
                            color: Color(0xfff4889a),
                            child: Text('Register',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20)),
                          ),
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        ),

        //  decoration: BoxDecoration(
        //   image: DecorationImage(
        //     image: AssetImage("assets/images/bojack-2.jpg"),
        //     fit: BoxFit.cover,
        //   ),
        // ),
      ),
    );
  }
  }

