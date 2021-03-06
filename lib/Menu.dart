import 'package:flutter/material.dart';
import 'package:foldable_sidebar/foldable_sidebar.dart';
import 'package:ginnacle3flutter/constants/colors.dart';
import 'package:ginnacle3flutter/pages/calendar.dart';
import 'package:ginnacle3flutter/pages/consulta.dart';
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
          backgroundColor: letras,
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
      color: snowWhite,
      child: Padding(
        padding: EdgeInsets.only(top: MediaQuery.of(context).size.width * 0.05),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [

            SizedBox(
              height: 5,
            ),
            Text(
              "Select ",
              style: TextStyle(fontSize: 18, color: Colors.white),
            ),
            Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    height: 75,
                    width: 125,
                    decoration: BoxDecoration(
                        color: Colors.red,
                        shape: BoxShape.rectangle,
                        border: Border.all(width: 5.0, color: Colors.white),
                        borderRadius: BorderRadius.all(Radius.circular(5)),
                        boxShadow: [
                          new BoxShadow(
                            color: Colors.black,
                            offset: new Offset(0, 0),
                            blurRadius: 2.0,
                          )
                        ]),
                    child: IconButton(
                      icon: Icon(Icons.menu, size: 50, color: snowWhite),
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
                      height: 75,
                      width: 125,
                      decoration: BoxDecoration(
                          color: Colors.blue,
                          shape: BoxShape.rectangle,
                          border: Border.all(width: 5.0, color: Colors.white),
                          borderRadius: BorderRadius.all(Radius.circular(5)),
                          boxShadow: [
                            new BoxShadow(
                              color: Colors.black,
                              offset: new Offset(0, 0),
                              blurRadius: 2.0,
                            )
                          ]),
                      child: IconButton(
                        icon: Icon(Icons.menu, size: 50),
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
