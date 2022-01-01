import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:ginnacle3flutter/pages/calendar.dart';
import 'package:http/http.dart' as http;

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

    var url = "http://192.168.0.42/dashboard/ginnacle/editadatar.php";
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
    return Scaffold(
      appBar: AppBar(
        title: Text("Editar Recordatorio"),
      ),
      body: ListView(
        children: <Widget>[
          TextField(
            controller: cFecha,
            decoration: InputDecoration(
                hintText: "Enter Nombre", labelText: "Ingresar Nombre "),
          ),
          TextField(
            controller: cHora,
            decoration: InputDecoration(hintText: "Enter Apellido paterno",
                labelText: "Ingresar Apellido Paterno"),
          ),
          TextField(
            controller: cDescripcion,
            decoration: InputDecoration(hintText: "Enter Apellido Materno",
                labelText: "Ingresar Apellido Materno "),
          ),

          TextField(
            controller: cPrioridad,
            decoration: InputDecoration(
                hintText: "Enter Edad", labelText: "Ingresar Edad"),
          ),
          TextField(
            controller: cPaciente,
            decoration: InputDecoration(
                hintText: "Enter Peso", labelText: "Ingresar Peso"),
          ),
          TextField(
            controller: cGinecologo,
            decoration: InputDecoration(
                hintText: "Enter FUM", labelText: "Ingresar  FUM"),
          ),
          MaterialButton(
              child: Text("Edit Data"),
              color: Colors.redAccent,

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
