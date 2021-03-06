import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:ginnacle3flutter/main.dart';
import 'package:ginnacle3flutter/pages/calendar.dart';
import 'package:ginnacle3flutter/pages/consulta.dart';
import 'package:http/http.dart' as http;

class registro extends StatefulWidget {


  @override
  _Registrostate createState() => _Registrostate();
}

class _Registrostate extends State<registro> {
  bool error, sending, success;
  String msg;



  TextEditingController cNombre = new TextEditingController();
  TextEditingController cApellidoP = new TextEditingController();
  TextEditingController cApellidoM = new TextEditingController();
  TextEditingController cemail = new TextEditingController();
  TextEditingController ccontrasena = new TextEditingController();
  TextEditingController ctelefono = new TextEditingController();




  @override
  void initState() {
    error = false;
    sending = false;
    success = false;
    msg = "";
    super.initState();
  }

  Future<void> adddata() async {

    var url = "http://192.168.0.42/dashboard/ginnacle/adddatag.php";
    var res = await http.post(Uri.parse(url), body: {
      "Nombre": cNombre.text,
      "ApellidoP": cApellidoP.text,
      "ApellidoM": cApellidoM.text,
      "email" : cemail.text,
      "contraseña" : ccontrasena.text,
      "telefono" : ctelefono.text

    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Registrar Ginecologo"),
      ),
      body: ListView(
        children: <Widget>[
          TextField(
            controller: cNombre,
            decoration: InputDecoration(
                hintText: "Enter Nombre", labelText: "Ingresar Nombre "),
          ),
          TextField(
            controller: cApellidoP,
            decoration: InputDecoration(hintText: "Enter Apellido paterno",
                labelText: "Ingresar Apellido Paterno"),
          ),
          TextField(
            controller: cApellidoM,
            decoration: InputDecoration(hintText: "Enter Apellido Materno",
                labelText: "Ingresar Apellido Materno "),
          ),
          TextField(
            controller: cemail,
            decoration: InputDecoration(
                hintText: "Enter email", labelText: "Ingresar email "),
          ),
          TextField(
            controller: ccontrasena,
            decoration: InputDecoration(
                hintText: "Enter contraseña", labelText: "Ingresar contraseña"),
          ),
          TextField(
            controller: ctelefono,
            decoration: InputDecoration(
                hintText: "Enter telefono", labelText: "Ingresar telefono"),
          ),
          MaterialButton(
              child: Text("Completar Registro"),
              color: Colors.redAccent,

              onPressed: () {
                adddata();

                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => LoginPage()),
                );
              })
        ],
      ),
    );
  }
}
