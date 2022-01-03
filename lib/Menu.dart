import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:foldable_sidebar/foldable_sidebar.dart';
import 'package:ginnacle3flutter/constants/colors.dart';
import 'package:ginnacle3flutter/pages/calendar.dart';
import 'package:ginnacle3flutter/pages/consulta.dart';
import 'package:cupertino_icons/cupertino_icons.dart';
import 'custom_sidebar_drawer.dart';


class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  FSBStatus _fsbStatus;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          leading: IconButton(
              onPressed: () {
                setState(() {
                  _fsbStatus = _fsbStatus == FSBStatus.FSB_OPEN
                      ? FSBStatus.FSB_CLOSE
                      : FSBStatus.FSB_OPEN;
                });
              },
              icon: Icon(Icons.menu)),
          automaticallyImplyLeading: false,
          backgroundColor: Colors.pink,
          title: Text("Ginnacle"),
        ),
        body: FoldableSidebarBuilder(
          drawerBackgroundColor: snowWhite,
          drawer: CustomSidebarDrawer(
            drawerClose: () {
              setState(() {
                _fsbStatus = FSBStatus.FSB_CLOSE;
              });
            },
          ),
          screenContents: welcomeScreen(context),
          status: _fsbStatus,
        ),
      ),
    );
  }

  Widget welcomeScreen(BuildContext context) {
    return Container(
      color: Color(0xFFF6EBAA),
      child: Padding(
        padding: EdgeInsets.only(top: MediaQuery.of(context).size.width * 0.05),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(
              height: 5,
            ),
            Text(
              "Seleccione una función",
              style: TextStyle(fontFamily: 'Berlin Sans',fontSize: 26, color: Colors.black),
            ),
            Container(
              height: 30,
            ),
            Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    height: 75,
                    width: 125,
                    decoration: BoxDecoration(
                        color: salmon,
                        shape: BoxShape.rectangle,
                        border: Border.all(width: 5.0, color: salmon),
                        borderRadius: BorderRadius.all(Radius.circular(5)),
                        boxShadow: [
                          new BoxShadow(
                            color: whitecoffee,
                            offset: new Offset(0, 0),
                            blurRadius: 2.0,
                          )
                        ]),
                    child:
                      IconButton(
                        icon: Icon(CupertinoIcons.person, size: 50, color: snowWhite),
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => Consulta()),
                          );
                        },
                      ),
                  ),
                  Container(
                    height: 30,
                  ),
                  Container(
                      height: 75,
                      width: 125,
                      decoration: BoxDecoration(
                          color: lumber,
                          shape: BoxShape.rectangle,
                          border: Border.all(width: 5.0, color: lumber),
                          borderRadius: BorderRadius.all(Radius.circular(5)),
                          boxShadow: [
                            new BoxShadow(
                              color: whitecoffee,
                              offset: new Offset(0, 0),
                              blurRadius: 2.0,
                            )
                          ]),
                      child: IconButton(
                        icon: Icon(CupertinoIcons.clock, size: 50),
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => Calendar()),
                          );
                        },
                      )),
                ]),
          ],
        ),
      ),
    );
  }
}
