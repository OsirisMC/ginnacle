import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:ginnacle3flutter/pages/calendar.dart';
import 'package:ginnacle3flutter/pages/consulta.dart';
import 'package:http/http.dart' as http;

class addrecordatorio extends StatefulWidget {


  @override
  _NewDataState createState() => _NewDataState();
}

class _NewDataState extends State<addrecordatorio> {
  TextEditingController cYear = new TextEditingController();
  TextEditingController cMes = new TextEditingController();
  TextEditingController cDia = new TextEditingController();
  TextEditingController cHora = new TextEditingController();
  TextEditingController cDescripcion = new TextEditingController();
  TextEditingController cPrioridad = new TextEditingController();
  TextEditingController cPaciente = new TextEditingController();
  TextEditingController cGinecologo = new TextEditingController();
  @override
  Future<void> adddata() async {
    var url = "http://192.168.0.42/dashboard/ginnacle/adddatar.php";
    var res = await http.post(Uri.parse(url), body: {
      "Fecha": cYear.text+"-"+cMes.text+"-"+cDia.text,
      "Hora": cHora.text,
      "Descripcion": cDescripcion.text,
      "Prioridad": cPrioridad.text,
      "Paciente": cPaciente.text,
      "Ginecologo": cGinecologo.text

    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Añadir Recordatorio"),
      ),
      body: ListView(
        children: <Widget>[
          TextField(
            controller: cYear,
            decoration: InputDecoration(
                hintText: "Enter Año", labelText: "Ingresar Año "),
          ),
          TextField(
            controller: cMes,
            decoration: InputDecoration(
                hintText: "Enter Mes", labelText: "Ingresar Mes "),
          ),
          TextField(
            controller: cDia,
            decoration: InputDecoration(
                hintText: "Enter Dia", labelText: "Ingresar Dia "),
          ),
          TextField(
            controller: cHora,
            decoration: InputDecoration(hintText: "Enter Hora",
                labelText: "Ingresar Hora"),
          ),
          TextField(
            controller: cDescripcion,
            decoration: InputDecoration(hintText: "Enter Descripcion",
                labelText: "Ingresar Descripcion "),
          ),
          TextField(
            controller: cPrioridad,
            decoration: InputDecoration(
                hintText: "Enter Prioridad", labelText: "Ingresar Prioridad"),
          ),
          TextField(
            controller: cPaciente,
            decoration: InputDecoration(
                hintText: "Enter Paciente", labelText: "Ingresar Paciente"),
          ),
          TextField(
            controller: cGinecologo,
            decoration: InputDecoration(
                hintText: "Enter Ginecologo", labelText: "Ingresar  Ginecologo"),
          ),
          MaterialButton(
              child: Text("Añadir Recordatorio"),
              color: Colors.redAccent,

              onPressed: () {
                adddata();

                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => Calendar()),
                );
              })
        ],
      ),
    );
  }
}