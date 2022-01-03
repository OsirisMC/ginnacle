import 'package:flutter/material.dart';
import 'package:ginnacle3flutter/pages/ginecologos.dart';
import 'package:ginnacle3flutter/pages/registro.dart';

import 'main.dart';

class CustomSidebarDrawer extends StatefulWidget {

  final Function drawerClose;

  const CustomSidebarDrawer({Key key, this.drawerClose}) : super(key: key);

  @override
  _CustomSidebarDrawerState createState() => _CustomSidebarDrawerState();
}

class _CustomSidebarDrawerState extends State<CustomSidebarDrawer> {
  @override
  Widget build(BuildContext context) {
    MediaQueryData mediaQuery = MediaQuery.of(context);
    return Container(
      color: Colors.white,
      width: mediaQuery.size.width * 0.60,
      height: mediaQuery.size.height,
      child: Column(
        children: <Widget>[
          Container(
              width: double.infinity,
              height: 200,
              color: Colors.grey.withAlpha(30),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  SizedBox(
                    height: 10,
                  ),
                  Text("Ginnacle")
                ],
              )),
          ListTile(
            onTap: (){

              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => ginecologos()),
              );

            },
            leading: Icon(Icons.person),
            title: Text(
              "Ginecologos Registrados",
            ),
          ),
          Divider(
            height: 1,
            color: Colors.grey,
          ),

          ListTile(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => LoginPage()),
              );
            },
            leading: Icon(Icons.exit_to_app),
            title: Text("Log Out"),
          ),
        ],
      ),
    );
  }
}