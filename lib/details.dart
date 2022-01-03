import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:ginnacle3flutter/pages/consulta.dart';
import 'package:ginnacle3flutter/pages/edit.dart';
import 'package:http/http.dart' as http;

class Details extends StatefulWidget {
  List list;
  int index;

  Details({this.list, this.index});

  @override
  _DetailsState createState() => _DetailsState();
}

class _DetailsState extends State<Details> {


  Future<void> delete() async {
    final response = await http.post(Uri.parse("https://ginnacle.000webhostapp.com/delete.php"), body: {
      "NumExpediente": widget.list[widget.index]["NumExpediente"]
     }
    );
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
        title: Text("${widget.list[widget.index]['Nombre']}"+" "+"${widget.list[widget.index]['ApellidoP']}"),
        backgroundColor: Colors.pink,
      ),
      body:
      Scrollbar(
        child: ListView(
          padding: const EdgeInsets.all(8),
          children: <Widget>[
          Container(
                alignment: Alignment.center,
                child: DataTable(
                    columns: [
                      DataColumn(
                          label: Text("Tipo de dato", style: TextStyle(fontFamily: "Lucida Sans", fontSize: 25.0)
                          )),
                      DataColumn(
                          label: Text("Datos del paciente", style: TextStyle(fontFamily: "Lucida Sans", fontSize: 25.0)
                          ))
                    ],
                    rows:[
                      DataRow(cells: [
                        DataCell(Text(
                            "Num. de Expediente: ",
                            style: TextStyle(fontFamily:"Lucida Sans",fontSize: 20.0))
                        ),
                        DataCell(Text(
                            widget.list[widget.index]['NumExpediente'],
                            style: TextStyle(fontFamily:"Lucida Sans",fontSize: 20.0))
                        ),
                      ]),

                      DataRow(cells: [
                        DataCell(Text(
                            "Nombre: ",
                            style: TextStyle(fontFamily: "Lucida Sans", fontSize: 20.0)),
                        ),
                        DataCell(Text(
                            widget.list[widget.index]['Nombre'],
                            style: TextStyle(fontFamily:"Lucida Sans",fontSize: 20.0))
                        )
                      ]),

                      DataRow(cells: [
                        DataCell(Text(
                            "Apellido Paterno: ",
                            style: TextStyle(fontFamily: "Lucida Sans", fontSize: 20.0)),
                        ),
                        DataCell(Text(
                            widget.list[widget.index]['ApellidoP'],
                            style: TextStyle(fontFamily:"Lucida Sans",fontSize: 20.0))
                        )
                      ]),

                      DataRow(cells: [
                        DataCell(Text(
                            "Apellido Materno: ",
                            style: TextStyle(fontFamily: "Lucida Sans", fontSize: 20.0)),
                        ),
                        DataCell(Text(
                            widget.list[widget.index]['ApellidoM'],
                            style: TextStyle(fontFamily:"Lucida Sans",fontSize: 20.0))
                        )
                      ]),

                      DataRow(cells: [
                        DataCell(Text(
                            "Teléfono: ",
                            style: TextStyle(fontFamily: "Lucida Sans", fontSize: 20.0)),
                        ),
                        DataCell(Text(
                            widget.list[widget.index]['Telefono'],
                            style: TextStyle(fontFamily:"Lucida Sans",fontSize: 20.0))
                        )
                      ]),

                      DataRow(cells: [
                        DataCell(Text(
                            "Edad: ",
                            style: TextStyle(fontFamily: "Lucida Sans", fontSize: 20.0)),
                        ),
                        DataCell(Text(
                            widget.list[widget.index]['Edad'],
                            style: TextStyle(fontFamily:"Lucida Sans",fontSize: 20.0))
                        )
                      ]),

                      DataRow(cells: [
                        DataCell(Text(
                            "Peso: ",
                            style: TextStyle(fontFamily: "Lucida Sans", fontSize: 20.0)),
                        ),
                        DataCell(Text(
                            widget.list[widget.index]['Peso'],
                            style: TextStyle(fontFamily:"Lucida Sans",fontSize: 20.0))
                        )
                      ]),

                      DataRow(cells: [
                        DataCell(Text(
                            "última menstruación: ",
                            style: TextStyle(fontFamily: "Lucida Sans", fontSize: 20.0)),
                        ),
                        DataCell(Text(
                            widget.list[widget.index]['FUM'],
                            style: TextStyle(fontFamily:"Lucida Sans",fontSize: 20.0))
                        )
                      ]),

                      DataRow(cells: [
                        DataCell(Text(
                            "Tipo de sangre: ",
                            style: TextStyle(fontFamily: "Lucida Sans", fontSize: 20.0)),
                        ),
                        DataCell(Text(
                            widget.list[widget.index]['Sangre'],
                            style: TextStyle(fontFamily:"Lucida Sans",fontSize: 20.0))
                        )
                      ]),

                      DataRow(cells: [
                        DataCell(Text(
                            "Alergias: ",
                            style: TextStyle(fontFamily: "Lucida Sans", fontSize: 20.0)),
                        ),
                        DataCell(Text(
                            widget.list[widget.index]['Alergias'],
                            style: TextStyle(fontFamily:"Lucida Sans",fontSize: 20.0))
                        ),
                      ]),

                      DataRow(cells: [
                        DataCell(Text(
                            "Embarazo: ",
                            style: TextStyle(fontFamily: "Lucida Sans", fontSize: 20.0)),
                        ),
                        DataCell(Text(
                            widget.list[widget.index]['Embarazo'],
                            style: TextStyle(fontFamily:"Lucida Sans",fontSize: 20.0))
                        )
                      ]),

                      DataRow(cells: [
                        DataCell(Text(
                            "Diangnóstico: ",
                            style: TextStyle(fontFamily: "Lucida Sans", fontSize: 20.0)),
                        ),
                        DataCell(Text(
                            widget.list[widget.index]['Diagnostico'],
                            style: TextStyle(fontFamily:"Lucida Sans",fontSize: 20.0))
                        ),
                      ]),
                    ]
                ),
              ),
            ElevatedButton(
                child: Text("Editar"),
                style: raisedB,
                onPressed: (){
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => Edit(list:widget.list, index:widget.index)),
                  );
                },
            ),
            Container(
              height: 20.0,
            ),
            ElevatedButton(
              child: Text("Eliminar"),
              style: raisedB,
              onPressed: (){
                delete();
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => Consulta()),
                );
              },
            )
        ])
      )
    );
  }
}
