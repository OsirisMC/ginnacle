import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:ginnacle3flutter/pages/calendar.dart';
import 'package:http/http.dart' as http;
import 'package:ginnacle3flutter/constants/colors.dart';

class Edit extends StatefulWidget {

  final List list;
  final int index;
  Edit({this.list, this.index});



  @override
  _EditaPageState createState() => _EditaPageState();
}

class _EditaPageState extends State<Edit> {

  TextEditingController cFecha ;
  TextEditingController cHora ;
  TextEditingController cDescripcion ;
  TextEditingController cPrioridad ;
  TextEditingController cPaciente ;
  TextEditingController cGinecologo ;

  @override
  void initState() {
    cFecha= TextEditingController(text: widget.list[widget.index]['Fecha']);
    cHora = TextEditingController(text: widget.list[widget.index]['Hora']);
    cDescripcion = TextEditingController(text: widget.list[widget.index]['Descripcion']);
    cPrioridad= TextEditingController(text: widget.list[widget.index]['Prioridad']);
    cPaciente= TextEditingController(text: widget.list[widget.index]['Paciente']);
    cGinecologo= TextEditingController(text: widget.list[widget.index]['Ginecologo']);
    super.initState();

  }

  Future<void> editdata() async {

    var url = "https://ginnacle.000webhostapp.com/editadatar.php";
    var res = await http.post(Uri.parse(url), body: {
      "Etiqueta": widget.list[widget.index]['Etiqueta'],
      "Fecha": cFecha.text,
      "Hora": cHora.text,
      "Descripcion": cDescripcion.text,
      "Prioridad": cPrioridad.text,
      "Paciente": cPaciente.text,
      "Ginecologo": cGinecologo.text
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
          backgroundColor: Colors.pink,
        title: Text("Recordatorios")
      ),
      body: ListView(
        children: <Widget>[
          TextField(
            controller: cFecha,
            decoration: InputDecoration(
                hintText: "Fecha", labelText: "Ingresar fecha"),
          ),
          TextField(
            controller: cHora,
            decoration: InputDecoration(hintText: "Hora del recordatorio",
                labelText: "Hora"),
          ),
          TextField(
            controller: cDescripcion,
            decoration: InputDecoration(hintText: "Descripción breve",
                labelText: "Descripción"),
          ),

          TextField(
            controller: cPrioridad,
            decoration: InputDecoration(
                hintText: "Prioridad del recordatorio", labelText: "Prioridad"),
          ),
          TextField(
            controller: cPaciente,
            decoration: InputDecoration(
                hintText: "¿De qué paciente se trata?", labelText: "Nombre del paciente"),
          ),
          TextField(
            controller: cGinecologo,
            decoration: InputDecoration(
                hintText: "Ginecologo relacionado", labelText: "Nombre del Ginecólogo"),
          ),
          Divider(
            height: 20,
            color: Colors.white,
          ),
          ElevatedButton(
              child: Text("Crear recordatorio"),
              style: raisedB,
              onPressed: () {
                editdata();
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
