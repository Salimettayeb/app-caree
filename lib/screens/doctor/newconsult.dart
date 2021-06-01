import 'package:argon_flutter/services/service-doctor/AuthDoctor.dart';
import 'package:argon_flutter/services/service-doctor/addConsultation.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:argon_flutter/constants/Theme.dart';

//widgets
import 'package:argon_flutter/widgets/navbar.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'adddossier.dart';
import 'file:///C:/Users/salim/AndroidStudioProjects/app-care/lib/screens/doctor/drawer.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:intl/intl.dart';

final storage = new FlutterSecureStorage();

class NewConsult extends StatefulWidget {
  @override
  _NewConsultState createState() => _NewConsultState();
}

class _NewConsultState extends State<NewConsult> {
  var nameController = TextEditingController();
  var filenumberController = TextEditingController();
  var heightController = TextEditingController();
  var weightController = TextEditingController();
  var reasonofconsultationController = TextEditingController();
  var diagnosticresultController = TextEditingController();
  var notesController = TextEditingController();

  DateTime _date = DateTime(2021, 11, 17);
  TimeOfDay _time = TimeOfDay(hour: 9, minute: 00);
  TimeOfDay time;
  TimeOfDay picked;
  DateTime selectedDay;
  List selectedEvent;
  final formatter = new DateFormat('dd-MM-yyyy');


  void _selectDate() async {
    final DateTime newDate = await showDatePicker(
      context: context,
      initialDate: _date,
      firstDate: DateTime(2017, 1),
      lastDate: DateTime(2022, 7),
      helpText: 'Select a date',
    );
    if (newDate != null) {

      formatter.format(newDate);
print("formatter.format(newDate) ${formatter.format(newDate)}");
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


  bool switchValueOne;
  bool switchValueTwo;

  void initState() {
    setState(() {
      switchValueOne = true;
      switchValueTwo = false;
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: Navbar(
          backButton: true,
          bgColor: Colors.lightBlue[400],
          title: "New consultation",

        ),
        backgroundColor: ArgonColors.bgColorScreen,
        drawer: ArgonDrawer(currentPage: "NewConsult"),
        body: SingleChildScrollView(

            child: Padding(
              padding: EdgeInsets.only(right: 24, left: 24, bottom: 36),
              child: SafeArea(
                bottom: true,
                child: Column(children: [
                  Padding(

                    padding: const EdgeInsets.only(left: 8.0, top: 10),
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [

                          Padding(

                            padding: const EdgeInsets.only(left: 8.0, top: 30),
                            child: Align(
                              alignment: Alignment.centerLeft,
                              child: Text("Select a date :",
                                  style: TextStyle(
                                      color: ArgonColors.text,
                                      fontWeight: FontWeight.w600,
                                      fontSize: 16)),
                            ),
                          ),

                          Container(
                            padding: const EdgeInsets.only(left: 8.0, top: 20),

                            height: 100,
                            child: CupertinoDatePicker(

                              mode: CupertinoDatePickerMode.date,
                              initialDateTime: DateTime(1969, 1, 1),
                              onDateTimeChanged: (DateTime newDateTime) {
                                setState(() {
                                  _date = newDateTime;
                                  print(newDateTime);
                                });                              },
                            ),
                          ),


                          ElevatedButton(
                            style: ButtonStyle(
                              backgroundColor: MaterialStateProperty.resolveWith<Color>(
                                    (Set<MaterialState> states) {

                                  return Colors.lightBlue[400];

                                },
                              ),
                            ),
                            onPressed: _selectTime,
                            child: Text('SELECT TIME'),
                          ),
                          SizedBox(height: 10),
                          Text(
                            'Selected time: ${_time.format(context)}',
                          ),
                        ]),
                  ),


                  Padding(

                    padding: const EdgeInsets.only(left: 8.0, top: 40),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Text("Name",
                          style: TextStyle(
                              color: ArgonColors.text,
                              fontWeight: FontWeight.w600,
                              fontSize: 16)),
                    ),
                  ),
                  TextFormField(
                  controller: nameController,
                    decoration: const InputDecoration(
                        labelText: 'Name',
                        hintText: 'Enter the patient name',
                        border: OutlineInputBorder()),
                    validator: (value) {
                      if (value.isEmpty) {
                        return 'Veuillez saisir un texte';
                      }
                      return null;
                    },
                  ),




                  Padding(
                    padding: const EdgeInsets.only(left: 8.0, top: 40),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Text("File number",
                          style: TextStyle(
                              color: ArgonColors.text,
                              fontWeight: FontWeight.w600,
                              fontSize: 16)),
                    ),
                  ),
                  TextFormField(
                  controller: filenumberController,
                    decoration: const InputDecoration(
                        labelText: 'File number',
                        hintText: 'File number',
                        border: OutlineInputBorder()),
                    validator: (value) {
                      if (value.isEmpty) {
                        return 'File number';
                      }
                      return null;
                    },
                  ),


                  Padding(
                    padding: const EdgeInsets.only(left: 8.0, top: 40),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Text("Weight",
                          style: TextStyle(
                              color: ArgonColors.text,
                              fontWeight: FontWeight.w600,
                              fontSize: 16)),
                    ),
                  ),
                  TextFormField(
                      controller: weightController,
                    decoration: const InputDecoration(
                        labelText: 'Weight',
                        hintText: 'Enter the patient s weight',
                        border: OutlineInputBorder()),
                    validator: (value) {
                      if (value.isEmpty) {
                        return 'Veuillez saisir un texte';
                      }
                      return null;
                    },
                  ),

                  Padding(
                    padding: const EdgeInsets.only(left: 8.0, top: 40),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Text("Height",
                          style: TextStyle(
                              color: ArgonColors.text,
                              fontWeight: FontWeight.w600,
                              fontSize: 16)),
                    ),
                  ),
                  TextFormField(
                  controller: heightController,
                    decoration: const InputDecoration(
                        labelText: 'Height',
                        hintText: 'Enter the patient s height',
                        border: OutlineInputBorder()),
                    validator: (value) {
                      if (value.isEmpty) {
                        return 'Veuillez saisir un texte';
                      }
                      return null;
                    },
                  ),



                  Padding(
                    padding: const EdgeInsets.only(left: 8.0, top: 40),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Text("Reason of consultation",
                          style: TextStyle(
                              color: ArgonColors.text,
                              fontWeight: FontWeight.w600,
                              fontSize: 16)),
                    ),
                  ),
                  TextFormField(
                  controller: reasonofconsultationController,
                    decoration: const InputDecoration(
                        labelText: 'Reason of consultation',
                        hintText: 'Write the reason of the consultation',
                        border: OutlineInputBorder()),
                    validator: (value) {
                      if (value.isEmpty) {
                        return 'Veuillez saisir un texte';
                      }
                      return null;
                    },
                  ),



                  Padding(
                    padding: const EdgeInsets.only(left: 8.0, top: 40),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Text("Diagnostic results ",
                          style: TextStyle(
                              color: ArgonColors.text,
                              fontWeight: FontWeight.w600,
                              fontSize: 16)),
                    ),
                  ),
                  TextFormField(
                  controller: diagnosticresultController,
                    decoration: const InputDecoration(
                        labelText: 'Diagnostic results',
                        hintText: 'Write the diagnostic results',
                        border: OutlineInputBorder()),
                    validator: (value) {
                      if (value.isEmpty) {
                        return 'Veuillez saisir un texte';
                      }
                      return null;
                    },
                  ),

                  Padding(
                    padding: const EdgeInsets.only(left: 8.0, top: 40),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Text("Notes",
                          style: TextStyle(
                              color: ArgonColors.text,
                              fontWeight: FontWeight.w600,
                              fontSize: 16)),
                    ),
                  ),
                  TextFormField(
                  controller: notesController,
                    decoration: const InputDecoration(
                        labelText: 'Notes',
                        hintText: 'Write a note',
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
                      const EdgeInsets.only(left: 5.0, right: 5.0, top: 30),
                      // ignore: deprecated_member_use
                      child: RaisedButton(
                        textColor: ArgonColors.white,
                        color: Colors.lightBlue[400],
                        onPressed: () async {
                          print(_date);
                          print(_time);

                          print(nameController.text);
                          print(filenumberController.text);
                          print(weightController.text);
                          print(heightController.text);
                          print(reasonofconsultationController.text);
                          print(diagnosticresultController.text);
                          print(notesController.text);


                          if (nameController.text.isEmpty ||
                              filenumberController.text.isEmpty ||
                              weightController.text.isEmpty ||
                              heightController.text.isEmpty ||
                              reasonofconsultationController.text.isEmpty ||
                              diagnosticresultController.text.isEmpty ||
                              notesController.text.isEmpty) {
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
                            String doctor = await storage.read(key: "token");
                            String doctorId = AuthDoctor().parseJwt(doctor)["_id"];
                            AddConsultation().addConsult(
                                doctorId,
                                _date,

                                _time,
                                nameController.text,
                                filenumberController.text,
                                weightController.text,
                                heightController.text,
                                reasonofconsultationController.text,
                                diagnosticresultController.text,
                                notesController.text).then((val) {
                              if (val.data['success']) {
                                var token = val.data['token'];
                                Fluttertoast.showToast(
                                    msg: 'Consultation Added',
                                    toastLength: Toast.LENGTH_SHORT,
                                    gravity: ToastGravity.BOTTOM,
                                    timeInSecForIosWeb: 1,
                                    backgroundColor: Colors.green,
                                    textColor: Colors.white,
                                    fontSize: 16.0
                                );
                              }
                            });
                          }
                          },

                      shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(4.0),
                      ),
                                      child: Padding(
                                      padding: EdgeInsets.only(
                                      left: 16.0, right: 16.0, top: 12, bottom: 12),
                                      child: Text("Add Consultation",
                                      style: TextStyle(
                                      fontWeight: FontWeight.w600, fontSize: 16.0))),

                        ),
                    ),

                  )

                ]),
              )
            )
        )
    );
  }
}

