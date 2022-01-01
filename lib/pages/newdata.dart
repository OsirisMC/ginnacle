  import 'dart:convert';
  import 'package:flutter/material.dart';
  import 'package:ginnacle3flutter/pages/calendar.dart';
  import 'package:ginnacle3flutter/pages/consulta.dart';
  import 'package:http/http.dart' as http;

  class NewData extends StatefulWidget {


    @override
    _NewDataState createState() => _NewDataState();
  }

  class _NewDataState extends State<NewData> {
    bool error, sending, success;
    String msg;



    TextEditingController cNombre = new TextEditingController();
    TextEditingController cApellidoP = new TextEditingController();
    TextEditingController cApellidoM = new TextEditingController();
    TextEditingController cTelefono = new TextEditingController();
    TextEditingController cEdad = new TextEditingController();
    TextEditingController cPeso = new TextEditingController();
    TextEditingController cFUM = new TextEditingController();
    TextEditingController cActivo = new TextEditingController();
    TextEditingController cSangre = new TextEditingController();
    TextEditingController cAlergias = new TextEditingController();
    TextEditingController cEmbarazo = new TextEditingController();
    TextEditingController cDiagnostico = new TextEditingController();
    @override
    void initState() {
      error = false;
      sending = false;
      success = false;
      msg = "";
      super.initState();
    }

    Future<void> adddata() async {

      var url = "http://192.168.0.42/dashboard/ginnacle/adddata.php";
      var res = await http.post(Uri.parse(url), body: {
        "Nombre": cNombre.text,
        "ApellidoP": cApellidoP.text,
        "ApellidoM": cApellidoM.text,
        "Telefono": cTelefono.text,
        "Edad": cEdad.text,
        "Peso": cPeso.text,
        "FUM": cFUM.text,
        "Activo": cActivo.text,
        "Sangre": cSangre.text,
        "Alergias": cAlergias.text,
        "Embarazo": cEmbarazo.text,
        "Diagnostico": cDiagnostico.text,
      });
    }


    @override
    Widget build(BuildContext context) {
      return Scaffold(
        appBar: AppBar(
          title: Text("Añadir Paciente"),
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
              controller: cTelefono,
              decoration: InputDecoration(
                  hintText: "Enter Telefono", labelText: "Ingresar Telefono "),
            ),
            TextField(
              controller: cEdad,
              decoration: InputDecoration(
                  hintText: "Enter Edad", labelText: "Ingresar Edad"),
            ),
            TextField(
              controller: cPeso,
              decoration: InputDecoration(
                  hintText: "Enter Peso", labelText: "Ingresar Peso"),
            ),
            TextField(
              controller: cFUM,
              decoration: InputDecoration(
                  hintText: "Enter FUM", labelText: "Ingresar  FUM"),
            ),
            TextField(
              controller: cActivo,
              decoration: InputDecoration(
                  hintText: "Enter Activo", labelText: "Ingresar  Activo"),
            ),
            TextField(
              controller: cSangre,
              decoration: InputDecoration(
                  hintText: "Enter Sangre", labelText: "Ingresar  Sangre"),
            ),
            TextField(
              controller: cAlergias,
              decoration: InputDecoration(
                  hintText: "Enter Alergias", labelText: "Ingresar Alergias "),
            ),
            TextField(
              controller: cEmbarazo,
              decoration: InputDecoration(
                  hintText: "Enter Embarazo", labelText: "Ingresar Embarazo "),
            ),
            TextField(
              controller: cDiagnostico,
              decoration: InputDecoration(hintText: "Enter Diagnostico",
                  labelText: "Ingresar Diagnostico "),
            ),
            MaterialButton(
                child: Text("Add Data"),
                color: Colors.redAccent,

                onPressed: () {
                  adddata();

                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => Consulta()),
                  );
                })
          ],
        ),
      );
    }
  }


