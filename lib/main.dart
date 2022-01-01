import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:ginnacle3flutter/Menu.dart';
import 'package:ginnacle3flutter/pages/calendar.dart';
import 'package:ginnacle3flutter/pages/consulta.dart';
import 'package:ginnacle3flutter/pages/registro.dart';
import 'package:http/http.dart' as http;
import 'details.dart';

void main() => runApp(LoginApp());

String username;

class LoginApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title:  'ginnacle',
      home: LoginPage(),
      routes: <String, WidgetBuilder>{
        '/LoginPage':   (BuildContext context)=> new LoginPage(),
        '/CalendarPage':   (BuildContext context)=> new Calendar(),
      },
    );
    // TODO: implement build
  }
}

class LoginPage extends StatefulWidget{
  _LoginPageState createState()=> _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController cEmail = new TextEditingController();
  TextEditingController cContrasena = new TextEditingController();

  Future<void> getData() async {
    String emailF = cEmail.text;
    String contrasenaF = cContrasena.text;
    var data = {'email': emailF, 'contraseña': contrasenaF};
    final response = await http.post(
        Uri.parse("http://192.168.0.42/dashboard/ginnacle/login.php"),
        body: json.encode(data)
    );
    print(response.body);
    var message = jsonDecode(response.body);
    if (message == "Login Matched") {
      Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => HomeScreen()),
      );
    }
    else {
      print("Entre al Else");
      showDialog(
          context: context,
          builder:
              (context) =>
              AlertDialog(
                title: Text("Error en email o contraseña"),
                actions: [TextButton(
                  child: Text("Ok"),
                  onPressed: () {
                    Navigator.pop(context);
                    setState(() {});
                    return;
                  },
                ),
                ],
              )

      );

    }
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
        appBar: AppBar(
          title: Text("Login"),

        ),
        body: ListView(
          children: <Widget>[

            TextField(
              controller: cEmail,
              decoration: InputDecoration(
                  hintText: "Email", labelText: "Ingresar Email "),
            ),
            TextField(
              controller: cContrasena,
              decoration: InputDecoration(hintText: "Enter Contraseña",
                  labelText: "Ingresar Contraseña"),
            ),
            MaterialButton(
                child: Text("Iniciar Sesion"),
                color: Colors.redAccent,
                onPressed: () {
                  getData();
                }

            ),  Divider(
              height: 2

            ),
            MaterialButton(
              child: Text("Registro"),
              color: Colors.redAccent,
              onPressed: (){
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => registro()),
                );
              },
            )
          ],
        )
    );
  }
}






