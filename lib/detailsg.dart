import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:ginnacle3flutter/pages/calendar.dart';
import 'package:ginnacle3flutter/pages/consulta.dart';
import 'package:http/http.dart' as http;

class Detailsg extends StatefulWidget {
  List list;
  int index;

  Detailsg({this.list, this.index});

  @override
  _DetailsState createState() => _DetailsState();
}

class _DetailsState extends State<Detailsg> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            title: Text("${widget.list[widget.index]['Nombre']}"+" "+"${widget.list[widget.index]['ApellidoP']}"),
            backgroundColor: Colors.pink
        ),
        body: Scrollbar(
            child: ListView(
                padding: const EdgeInsets.all(8),
                children: <Widget>[
                  Container(
                      alignment: Alignment.center,
                      child: DataTable(
                        columns: [
                          DataColumn(
                              label: Text("Tipo de dato", style: TextStyle(
                                  fontFamily: "Lucida Sans", fontSize: 25.0)
                              )),
                          DataColumn(
                              label: Text("Datos del Ginecólogo",
                                  style: TextStyle(
                                      fontFamily: "Lucida Sans", fontSize: 25.0)
                              ))
                        ],
                        rows: [
                          DataRow(cells: [
                            DataCell(Text(
                                "ID: ",
                                style: TextStyle(
                                    fontFamily: "Lucida Sans", fontSize: 20.0))
                            ),
                            DataCell(Text(
                                widget.list[widget.index]['ID'],
                                style: TextStyle(
                                    fontFamily: "Lucida Sans", fontSize: 20.0))
                            ),
                          ]),

                          DataRow(cells: [
                            DataCell(Text(
                                "Nombre: ",
                                style: TextStyle(
                                    fontFamily: "Lucida Sans", fontSize: 20.0))
                            ),
                            DataCell(Text(
                                widget.list[widget.index]['Nombre'],
                                style: TextStyle(
                                    fontFamily: "Lucida Sans", fontSize: 20.0))
                            ),
                          ]),

                          DataRow(cells: [
                            DataCell(Text(
                                "Apellido Paterno: ",
                                style: TextStyle(
                                    fontFamily: "Lucida Sans", fontSize: 20.0))
                            ),
                            DataCell(Text(
                                widget.list[widget.index]['ApellidoP'],
                                style: TextStyle(
                                    fontFamily: "Lucida Sans", fontSize: 20.0))
                            ),
                          ]),

                          DataRow(cells: [
                            DataCell(Text(
                                "Apellido Materno: ",
                                style: TextStyle(
                                    fontFamily: "Lucida Sans", fontSize: 20.0))
                            ),
                            DataCell(Text(
                                widget.list[widget.index]['ApellidoM'],
                                style: TextStyle(
                                    fontFamily: "Lucida Sans", fontSize: 20.0))
                            ),
                          ]),

                          DataRow(cells: [
                            DataCell(Text(
                                "Correo electrónico: ",
                                style: TextStyle(
                                    fontFamily: "Lucida Sans", fontSize: 20.0))
                            ),
                            DataCell(Text(
                                widget.list[widget.index]['email'],
                                style: TextStyle(
                                    fontFamily: "Lucida Sans", fontSize: 20.0))
                            ),
                          ]),

                          DataRow(cells: [
                            DataCell(Text(
                                "Teléfono: ",
                                style: TextStyle(
                                    fontFamily: "Lucida Sans", fontSize: 20.0))
                            ),
                            DataCell(Text(
                                widget.list[widget.index]['telefono'],
                                style: TextStyle(
                                    fontFamily: "Lucida Sans", fontSize: 20.0))
                            ),
                          ]),
                        ],
                      )
                  )
                ])
        )
    );
  }
}