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
    final response = await http.post(Uri.parse("https://ginnacle.000webhostapp.com/deleter.php"), body: {
      "Etiqueta": widget.list[widget.index]["Etiqueta"]
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
          title: Text("${widget.list[widget.index]['Fecha']}"),
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
                            label: Text("Datos del recordatorio",
                                style: TextStyle(
                                    fontFamily: "Lucida Sans", fontSize: 25.0)
                            ))
                      ],
                      rows: [
                        DataRow(cells: [
                          DataCell(Text(
                              "Fecha: ",
                              style: TextStyle(
                                  fontFamily: "Lucida Sans", fontSize: 20.0))
                          ),
                          DataCell(Text(
                              widget.list[widget.index]['Fecha'],
                              style: TextStyle(
                                  fontFamily: "Lucida Sans", fontSize: 20.0))
                          ),
                        ]),

                        DataRow(cells: [
                          DataCell(Text(
                              "Hora: ",
                              style: TextStyle(
                                  fontFamily: "Lucida Sans", fontSize: 20.0))
                          ),
                          DataCell(Text(
                              widget.list[widget.index]['Hora'],
                              style: TextStyle(
                                  fontFamily: "Lucida Sans", fontSize: 20.0))
                          ),
                        ]),

                        DataRow(cells: [
                          DataCell(Text(
                              "Descirpción: ",
                              style: TextStyle(
                                  fontFamily: "Lucida Sans", fontSize: 20.0))
                          ),
                          DataCell(Text(
                              widget.list[widget.index]['Descripcion'],
                              style: TextStyle(
                                  fontFamily: "Lucida Sans", fontSize: 10.0))
                          ),
                        ]),

                        DataRow(cells: [
                          DataCell(Text(
                              "Completado: ",
                              style: TextStyle(
                                  fontFamily: "Lucida Sans", fontSize: 20.0))
                          ),
                          DataCell(Text(
                              widget.list[widget.index]['Completado'],
                              style: TextStyle(
                                  fontFamily: "Lucida Sans", fontSize: 20.0))
                          ),
                        ]),

                        DataRow(cells: [
                          DataCell(Text(
                              "Prioridad: ",
                              style: TextStyle(
                                  fontFamily: "Lucida Sans", fontSize: 20.0))
                          ),
                          DataCell(Text(
                              widget.list[widget.index]['Prioridad'],
                              style: TextStyle(
                                  fontFamily: "Lucida Sans", fontSize: 20.0))
                          ),
                        ]),

                        DataRow(cells: [
                          DataCell(Text(
                              "Paciente: ",
                              style: TextStyle(
                                  fontFamily: "Lucida Sans", fontSize: 20.0))
                          ),
                          DataCell(Text(
                              widget.list[widget.index]['Paciente'],
                              style: TextStyle(
                                  fontFamily: "Lucida Sans", fontSize: 20.0))
                          ),
                        ]),

                        DataRow(cells: [
                          DataCell(Text(
                              "Ginecólogo: ",
                              style: TextStyle(
                                  fontFamily: "Lucida Sans", fontSize: 20.0))
                          ),
                          DataCell(Text(
                              widget.list[widget.index]['Ginecologo'],
                              style: TextStyle(
                                  fontFamily: "Lucida Sans", fontSize: 20.0))
                          ),
                        ]),
                      ],
                    ),

                ),
                ElevatedButton(
                  child: Text("Editar"),

                  onPressed: (){
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => Edit(list:widget.list, index:widget.index)),
                    );
                  },
                ),
                ElevatedButton(
                  child: Text("Eliminar"),
                  style: raisedB,
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