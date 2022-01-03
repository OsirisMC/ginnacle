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


    Future<void> adddata() async {

      var url = "https://ginnacle.000webhostapp.com/adddata.php";
      print(cTelefono.text);
      if(cNombre.text==null){
        cNombre.text = "Desconocido";
      }
      if(cApellidoP.text==null){
        cApellidoP.text = "Desconocido";
      }
      if(cApellidoM.text==null){
        cApellidoM.text = "Desconocido";
      }
      if(cTelefono.text==null){
        cTelefono.text = "Desconocido";
      }
      print(cTelefono.text);

      if(cEdad.text==null){
        cEdad.text = "Desconocido";
      }
      if(cPeso.text==null){
        cPeso.text = "Desconocido";
      }
      if(cFUM.text==null){
        cFUM.text = "Desconocido";
      }
      if(cActivo.text==null){
        cActivo.text = "Desconocido";
      }
      if(cAlergias.text==null){
        cAlergias.text = "Desconocido";
      }
      if(cEmbarazo.text==null){
        cEmbarazo.text = "Desconocido";
      }
      if(cDiagnostico.text==null){
        cDiagnostico.text = "Desconocido";
      }

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
      final ButtonStyle raisedB = ElevatedButton.styleFrom(
        onPrimary: Colors.white,
        primary: Colors.pink,
        minimumSize: Size(20,40)
      );
      return Scaffold(
        appBar: AppBar(
          title: Text("Guardar"),
            backgroundColor: Colors.pink
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
              decoration: InputDecoration(hintText: "Ingresar Apellido Paterno",
                  labelText: "Apellido Paterno"),
            ),
            TextField(
              controller: cApellidoM,
              decoration: InputDecoration(hintText: "Ingresar Apellido Materno",
                  labelText: "Apellido Materno"),
            ),
            TextField(
              controller: cTelefono,
              decoration: InputDecoration(
                  hintText: "Ingresar Telefono", labelText: "Teléfono "),
            ),
            TextField(
              controller: cEdad,
              decoration: InputDecoration(
                  hintText: "Ingresar Edad", labelText: "Edad"),
            ),
            TextField(
              controller: cPeso,
              decoration: InputDecoration(
                  hintText: "Ingresar Peso", labelText: "Peso"),
            ),
            TextField(
              controller: cFUM,
              decoration: InputDecoration(
                  hintText: "Ingresar fecha de la última menstruación", labelText: "Fecha de la última menstruación"),
            ),
            TextField(
              controller: cActivo,
              decoration: InputDecoration(
                  hintText: "¿El paciente se encuentra activo?", labelText: "Actividad"),
            ),
            TextField(
              controller: cSangre,
              decoration: InputDecoration(
                  hintText: "Ingresar el tipo de sangre del paciente", labelText: "Tipo de sangre"),
            ),
            TextField(
              controller: cAlergias,
              decoration: InputDecoration(
                  hintText: "Ingresar alergias del paciente", labelText: "Alergias"),
            ),
            TextField(
              controller: cEmbarazo,
              decoration: InputDecoration(
                  hintText: "Ingresar si se encuentra si se encuentra en estado de gestación", labelText: "Embarazo"),
            ),
            TextField(
              controller: cDiagnostico,
              decoration: InputDecoration(hintText: "Ingresar diagnóstico del paciente",
                  labelText: "Diagnóstico"),
            ),
            Container(
              height: 20.0,
            ),
            ElevatedButton(
                child: Text("Añadir paciente"),
                style: raisedB,
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


