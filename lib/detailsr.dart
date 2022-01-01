
import 'package:flutter/material.dart';
import 'package:ginnacle3flutter/pages/calendar.dart';
import 'package:ginnacle3flutter/pages/editrecordatorio.dart';
import 'package:http/http.dart' as http;

class Detailsr extends StatefulWidget {
  List list;
  int index;

  Detailsr({this.list, this.index});

  @override
  _DetailsState createState() => _DetailsState();
}

class _DetailsState extends State<Detailsr> {


  Future<void> delete() async {
    final response = await http.post(Uri.parse("http://192.168.0.42/dashboard/ginnacle/deleter.php"), body: {
      "Etiqueta": widget.list[widget.index]["Etiqueta"]
    }
    );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("${widget.list[widget.index]['Fecha']}"),
        ),
        body: Container(
            child: Column(
                children: <Widget>[
                  Text(
                    widget.list[widget.index]['Fecha'],
                    style: TextStyle(fontSize: 20.0),
                  ),
                  Text(
                    widget.list[widget.index]['Hora'],
                    style: TextStyle(fontSize: 20.0),
                  ),
                  Text(
                    widget.list[widget.index]['Descripcion'],
                    style: TextStyle(fontSize: 20.0),
                  ),
                  Text(
                    widget.list[widget.index]['Completado'],
                    style: TextStyle(fontSize: 20.0),
                  ),
                  Text(
                    widget.list[widget.index]['Prioridad'],
                    style: TextStyle(fontSize: 20.0),
                  ),
                  Text(
                    widget.list[widget.index]['Paciente'],
                    style: TextStyle(fontSize: 20.0),
                  ),
                  Text(
                    widget.list[widget.index]['Ginecologo'],
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
                            builder: (BuildContext context)=>Calendar(),
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