import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import '../details.dart';
import 'newdata.dart';

class Consulta extends StatefulWidget{
  _ConsultaPageState createState()=> _ConsultaPageState();
}

class _ConsultaPageState extends State<Consulta>{

  Future<List> getData() async {
    final response = await http.post(Uri.parse("http://192.168.0.42/dashboard/ginnacle/getdata.php"));

    print(response.body);
    return json.decode(response.body);
  }
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text("Pacientes CRUD"),
      ),
      floatingActionButton: FloatingActionButton(onPressed: (){
        Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => NewData()),
        );
      },
        child: Icon(Icons.add),),
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
                  builder: (BuildContext context)=>Details(list:list,index:i),
                )
            ),
          );
        });
  }
}