import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';
import '../detailsr.dart';
import 'package:http/http.dart' as http;

import 'addrecordatrio.dart';

class Calendar extends StatefulWidget {
  _CalendarState createState() => _CalendarState();
}

class _CalendarState extends State<Calendar> {
  CalendarFormat format = CalendarFormat.month;
  DateTime selectedDay = DateTime.now();
  DateTime focusedDay = DateTime.now();

  TextEditingController _eventController = TextEditingController();
  void dispose() {
    super.dispose();
  }
  Future<List> getData() async {

    final response = await http.post(Uri.parse("http://192.168.0.42/dashboard/ginnacle/getdatar.php"),
      body: {
      "Fecha": selectedDay.year.toString()+"-"+selectedDay.month.toString()+"-"+selectedDay.day.toString()
      }
    );
    print(response.body);
    return json.decode(response.body);
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Calendario'),
        centerTitle: true,
      ),
      body: Column(
        children: [
          TableCalendar(
            focusedDay: DateTime.now(),
            firstDay: DateTime(1990),
            lastDay: DateTime(2050),
            calendarFormat: format,
            onFormatChanged: (formato) {
              setState(() {
                format = formato;
              });
            },

            startingDayOfWeek: StartingDayOfWeek.sunday,
            daysOfWeekVisible: true,
            //Day Changed
            onDaySelected: (DateTime selectDay, DateTime focusDay) {
              setState(() {
                selectedDay = selectDay;
                focusedDay = focusDay;

              });
            },
            onPageChanged: (focusDay) {
              focusedDay = focusDay;
            },
            selectedDayPredicate: (DateTime date) {
              return isSameDay(selectedDay, date);
            },
            //To Style the Calendar
            calendarStyle: CalendarStyle(
              isTodayHighlighted: true,
              selectedDecoration: BoxDecoration(
                color: Colors.blue,
                shape: BoxShape.circle,
              ),
              selectedTextStyle: TextStyle(color: Colors.white),
              todayDecoration: BoxDecoration(
                color: Colors.red,
                shape: BoxShape.circle,
              ),
            ),
            headerStyle: HeaderStyle(
              formatButtonVisible: true,
              titleCentered: true,
              formatButtonShowsNext: false,
            ),
          ),
          Expanded(child: SizedBox(
              height: 200.0,
              child: FutureBuilder<List>(


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
                    return Container();
                  }
                },
              ),

          ))

        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
            Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (BuildContext context)=>addrecordatorio(),
                )
            );
        }
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
            title: Text(list[i]['Fecha']),
            subtitle: Text(list[i]['Hora']),
            onTap: ()=> Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (BuildContext context)=>Detailsr(list:list,index:i),
                )
            ),
          );
        });
  }
}