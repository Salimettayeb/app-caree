import 'package:flutter/material.dart';
import 'package:flutter_clean_calendar/flutter_clean_calendar.dart';

void main() => runApp(RendezVous());
class RendezVous extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,

      home: DemoApp(),
    );
  }
}

class DemoApp extends StatefulWidget {
  @override
  _DemoAppState createState() => _DemoAppState();
}

class _DemoAppState extends State<DemoApp> {
  DateTime _date = DateTime(2021, 11, 17);
  TimeOfDay _time = TimeOfDay(hour: 9, minute: 00);
  TimeOfDay time;
  TimeOfDay picked;
  DateTime selectedDay;
  List selectedEvent;
  void _selectDate() async {
    final DateTime newDate = await showDatePicker(
      context: context,
      initialDate: _date,
      firstDate: DateTime(2017, 1),
      lastDate: DateTime(2022, 7),
      helpText: 'Select a date',
    );
    if (newDate != null) {
      setState(() {
        _date = newDate;
      });
    }
  }
  void _selectTime() async {
    final TimeOfDay newTime = await showTimePicker(
      context: context,
      initialTime: _time,
    );
    if (newTime != null) {
      setState(() {
        _time = newTime;
      });
    }}

  final Map<DateTime, List> events = {
    DateTime(2020,12,12): [
      {'Name': 'Your event Name', 'isDone' : true},
      {'Name': 'Your event Name 2', 'isDone' : true},
      {'Name': 'Your event Name 3', 'isDone' : false},
    ],
    DateTime(2020,12,2): [
      {'Name': 'Your event Name', 'isDone' : false},
      {'Name': 'Your event Name 2', 'isDone' : true},
      {'Name': 'Your event Name 3', 'isDone' : false},
    ]
  };

  void _handleData(date){
    setState(() {
      selectedDay = date;
      selectedEvent = events[selectedDay] ?? [];
    });
    print(selectedDay);
  }

  @override
  void initState() {
    // TODO: implement initState
    selectedEvent = events[selectedDay] ?? [];
    super.initState();
    time = TimeOfDay.now();
  }
  Future<Null> selectTime(BuildContext context) async {
    picked = await showTimePicker(context: context, initialTime: time);

    if (picked != null )
      setState(() {
        time = picked;
      });
  }
  @override
  Widget build(BuildContext context) {

    return Scaffold(
        appBar: AppBar(

          title: Text('Rendez-vous'),
          centerTitle: true,



        ),


        body: Center(
            child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(height: 1),
                  Text(
                    'Select date and time for the appointment',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                  ),
                  SizedBox(height: 40),
                  ElevatedButton(

                    onPressed: _selectDate,
                    child: Text('SELECT DATE'),
                  ),
                  SizedBox(height: 20),
                  Text(
                    'Selected date: $_date',
                  ),
                  SizedBox(height: 40),

                  ElevatedButton(
                    onPressed: _selectTime,
                    child: Text('SELECT TIME'),
                  ),
                  SizedBox(height: 20),
                  Text(
                    'Selected time: ${_time.format(context)}',
                  ),
                  SizedBox(
                    width: double.infinity,
                    child: Padding(
                      padding:
                      const EdgeInsets.only(left: 25.0, right: 25.0, top: 30),
                      // ignore: deprecated_member_use
                      child: RaisedButton(
                        textColor: Colors.white,
                        color: Colors.blueGrey,
                        onPressed: () {
                          // Respond to button press
                          Navigator.pushReplacementNamed(context, '/home_screen_patient');
                        },
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(4.0),
                        ),
                        child: Padding(
                            padding: EdgeInsets.only(
                                left: 7.0, right: 16.0, top: 12, bottom: 12),
                            child: Text("CONFIRM REQUEST ",
                                style: TextStyle(
                                    fontWeight: FontWeight.w600, fontSize: 16.0))),
                      ),
                    ),




                  ),

                ])

        )


    );




  }
}