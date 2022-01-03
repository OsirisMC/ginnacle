import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:ginnacle3flutter/constants/colors.dart';
import 'package:http/http.dart' as http;
import '../details.dart';
import 'newdata.dart';
import 'package:flutter/cupertino.dart';
import 'package:ginnacle3flutter/Menu.dart';

class Consulta extends StatefulWidget{
  _ConsultaPageState createState()=> _ConsultaPageState();
}

class _ConsultaPageState extends State<Consulta>{

  Future<List> getData() async {
    final response = await http.post(Uri.parse("https://ginnacle.000webhostapp.com/getdata.php"));

    print(response.body);
    return json.decode(response.body);
  }
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text("Pacientes"),
        backgroundColor: Colors.pink,
      ),
        body:
        Stack(
          children: <Widget>[
          FutureBuilder<List>(
      builder: (ctx,ss){
        if(ss.hasError){
          print(ss.stackTrace);
          print(ss.error);
          print(ss.data);
          print(ss.connectionState);
          print("Error");
        }
        if(ss.hasData){
          return Items(list:ss.data);
        }
        else{
          return CircularProgressIndicator();
        }
      },
            future: getData(),
          ),
            Align(
              alignment: Alignment.bottomRight,
              child:
              FloatingActionButton(onPressed: (){
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => NewData()),
                );
              },
              child:
                Icon(CupertinoIcons.person_add),
                backgroundColor: Colors.pink,
            )),
                Align(
                    alignment: Alignment.bottomLeft,
                    child:
                    FloatingActionButton(onPressed: (){
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => HomeScreen()),
                      );
                    },
                        child:
                          Icon(CupertinoIcons.home),
                          backgroundColor: Colors.pink),
                ),
          ],
        ),
    );
  }
}
class Items extends StatelessWidget{
  List list;
  Items({this.list});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: list==null?0:list.length,
        itemBuilder: (ctx,i){
          return ListTile(
            leading: Icon(CupertinoIcons.person_solid),
            title: Text(list[i]['Nombre']),
            subtitle: Text(list[i]['ApellidoP']+" "+list[i]['ApellidoM']),
            onTap: ()=> Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (BuildContext context)=>Details(list:list,index:i),
                )
            ),
          );
        });
  }
}