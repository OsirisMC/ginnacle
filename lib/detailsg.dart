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
          title: Text("${widget.list[widget.index]['Nombre']}"),
        ),
        body: Container(
            child: Column(
                children: <Widget>[
                  Text(
                    widget.list[widget.index]['ID'],
                    style: TextStyle(fontSize: 20.0),
                  ),
                  Text(
                    widget.list[widget.index]['Nombre'],
                    style: TextStyle(fontSize: 20.0),
                  ),
                  Text(
                    widget.list[widget.index]['ApellidoP'],
                    style: TextStyle(fontSize: 20.0),
                  ),
                  Text(
                    widget.list[widget.index]['ApellidoM'],
                    style: TextStyle(fontSize: 20.0),
                  ),
                  Text(
                    widget.list[widget.index]['email'],
                    style: TextStyle(fontSize: 20.0),
                  ),
                  Text(
                    widget.list[widget.index]['contraseña'],
                    style: TextStyle(fontSize: 20.0),
                  ),
                  Text(
                    widget.list[widget.index]['telefono'],
                    style: TextStyle(fontSize: 20.0),
                  )
                ]
            )
        )
    );
  }
}