import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:ginnacle3flutter/detailsg.dart';
import 'package:ginnacle3flutter/pages/calendar.dart';
import 'package:ginnacle3flutter/pages/consulta.dart';
import 'package:http/http.dart' as http;

import '../details.dart';
import 'newdata.dart';

class ginecologos extends StatefulWidget{
  _GinecologosPagaState createState()=> _GinecologosPagaState();
}

class _GinecologosPagaState extends State<ginecologos>{

  Future<List> getData() async {
    final response = await http.post(Uri.parse("http://192.168.0.42/dashboard/ginnacle/getdatag.php"));

    print(response.body);
    return json.decode(response.body);
  }
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text("Ginecologos CRUD"),
      ),
      body: FutureBuilder<List>(
        future: getData(),
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
            leading: Icon(Icons.message),
            title: Text(list[i]['Nombre']),
            subtitle: Text(list[i]['ApellidoP']),
            onTap: ()=> Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (BuildContext context)=>Detailsg(list:list,index:i),
                )
            ),
          );
        });
  }
}