import 'package:argon_flutter/constants/Theme.dart';
import 'package:argon_flutter/screens/doctor/addappoint.dart';
import 'package:argon_flutter/services/service-patient/AuthPatient.dart';
import 'package:argon_flutter/services/service-patient/addRendezvous.dart';
import 'package:flutter/material.dart';
import 'package:flutter_clean_calendar/flutter_clean_calendar.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:fluttertoast/fluttertoast.dart';
final storage = new FlutterSecureStorage();

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
  var contactController = TextEditingController();

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
                  Padding(
                    padding: const EdgeInsets.only(left: 8.0, top: 20),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Text("Address",
                          style: TextStyle(
                              color: ArgonColors.text,
                              fontWeight: FontWeight.w600,
                              fontSize: 16)),
                    ),
                  ),
                  TextFormField(
                    controller: contactController,
                    decoration: const InputDecoration(
                        labelText: 'Email address',
                        hintText: 'Enter the patient email address',
                        border: OutlineInputBorder()),
                    validator: (value) {
                      if (value.isEmpty) {
                        return 'Veuillez saisir un texte';
                      }
                      return null;
                    },
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
                        onPressed: () async{
                          print(_date);
                          print(_time);

                          if (
                          contactController.text.isEmpty

                          ){
                            Fluttertoast.showToast(
                                msg: 'all fields should not be empty.',
                                toastLength: Toast.LENGTH_SHORT,
                                gravity: ToastGravity.BOTTOM,
                                timeInSecForIosWeb: 1,
                                backgroundColor: Colors.red,
                                textColor: Colors.white,
                                fontSize: 16.0
                            );
                          }
                          else {
                            String user = await storage.read(key: "token");
                            String userId = AuthPatient().parseJwt(user)["_id"];
                            String doctorId = "608df3f856aebd000464b760";
                            Addrendezvous().addrdv(
                              doctorId,
                              userId,
                              _date,
                              _time,
                              contactController.text,
                            ).then((val) {
                              if (val.data['success']) {
                                var token = val.data['token'];
                                Fluttertoast.showToast(
                                    msg: 'Rendez-Vous Sent',
                                    toastLength: Toast.LENGTH_SHORT,
                                    gravity: ToastGravity.BOTTOM,
                                    timeInSecForIosWeb: 1,
                                    backgroundColor: Colors.green,
                                    textColor: Colors.white,
                                    fontSize: 16.0
                                );
                              }
                            });
                          }},
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