import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:ginnacle3flutter/pages/calendar.dart';
import 'package:ginnacle3flutter/pages/consulta.dart';
import 'package:http/http.dart' as http;

class Edit extends StatefulWidget {

  final List list;
  final int index;
  Edit({this.list, this.index});



  @override
  _EditaPageState createState() => _EditaPageState();
}

class _EditaPageState extends State<Edit> {

  TextEditingController cNombre;
  TextEditingController cApellidoP;
  TextEditingController cApellidoM;
  TextEditingController cTelefono;
  TextEditingController cEdad ;
  TextEditingController cPeso ;
  TextEditingController cFUM ;
  TextEditingController cActivo ;
  TextEditingController cSangre ;
  TextEditingController cAlergias ;
  TextEditingController cEmbarazo ;
  TextEditingController cDiagnostico ;

  @override
  void initState() {
    cNombre= TextEditingController(text: widget.list[widget.index]['Nombre']);
    cApellidoP= TextEditingController(text: widget.list[widget.index]['ApellidoP']);
    cApellidoM= TextEditingController(text: widget.list[widget.index]['ApellidoM']);
    cTelefono= TextEditingController(text: widget.list[widget.index]['Telefono']);
    cEdad= TextEditingController(text: widget.list[widget.index]['Edad']);
    cPeso= TextEditingController(text: widget.list[widget.index]['Peso']);
    cFUM= TextEditingController(text: widget.list[widget.index]['FUM']);
    cActivo= TextEditingController(text: widget.list[widget.index]['Activo']);
    cSangre= TextEditingController(text: widget.list[widget.index]['Sangre']);
    cAlergias= TextEditingController(text: widget.list[widget.index]['Alergias']);
    cEmbarazo= TextEditingController(text: widget.list[widget.index]['Embarazo']);
    cDiagnostico= TextEditingController(text: widget.list[widget.index]['Diagnostico']);
    super.initState();

  }

  Future<void> editdata() async {

    var url = "http://192.168.0.42/dashboard/ginnacle/editadata.php";
    var res = await http.post(Uri.parse(url), body: {
      "NumExpediente": widget.list[widget.index]['NumExpediente'],
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
        title: Text("Editar Paciente"),
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
              child: Text("Edit Data"),
              color: Colors.redAccent,

              onPressed: () {
                editdata();
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
