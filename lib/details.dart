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
    final response = await http.post(Uri.parse("http://192.168.0.42/dashboard/ginnacle/delete.php"), body: {
      "NumExpediente": widget.list[widget.index]["NumExpediente"]
     }
    );
  }
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
              widget.list[widget.index]['NumExpediente'],
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
              widget.list[widget.index]['Telefono'],
              style: TextStyle(fontSize: 20.0),
            ),
            Text(
              widget.list[widget.index]['Edad'],
              style: TextStyle(fontSize: 20.0),
            ),
            Text(
              widget.list[widget.index]['Peso'],
              style: TextStyle(fontSize: 20.0),
            ),
            Text(
              widget.list[widget.index]['FUM'],
              style: TextStyle(fontSize: 20.0),
            ),
            Text(
              widget.list[widget.index]['Sangre'],
              style: TextStyle(fontSize: 20.0),
            ),
            Text(
              widget.list[widget.index]['Alergias'],
              style: TextStyle(fontSize: 20.0),
            ),
            Text(
              widget.list[widget.index]['Embarazo'],
              style: TextStyle(fontSize: 20.0),
            ),
            Text(
              widget.list[widget.index]['Diagnostico'],
              style: TextStyle(fontSize: 20.0),
            ),
            MaterialButton(
              child: Text("Edit"),
              color: Colors.deepOrangeAccent,
              onPressed: (){
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => Edit(list:widget.list, index:widget.index)),
                );
              },
            ),
            MaterialButton(
              child: Text("DELETE"),
              color: Colors.deepOrangeAccent,
              onPressed: () {
                delete();
                Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (BuildContext context)=>Consulta(),
                    )
                );
              },
            )
          ]
        )
      )
    );
  }
}
