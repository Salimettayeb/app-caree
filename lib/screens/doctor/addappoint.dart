import 'package:argon_flutter/services/service-doctor/addAppoinment.dart';
import 'package:flutter/material.dart';

import 'package:argon_flutter/constants/Theme.dart';

//widgets
import 'package:argon_flutter/widgets/navbar.dart';
import 'file:///C:/Users/salim/AndroidStudioProjects/app-care/lib/screens/doctor/drawer.dart';
import 'package:argon_flutter/widgets/input.dart';
import 'package:argon_flutter/widgets/table-cell.dart';
import 'package:fluttertoast/fluttertoast.dart';

class Addappoint extends StatefulWidget {
  @override
  _AddappointState createState() => _AddappointState();
}

class _AddappointState extends State<Addappoint> {
  var nameController = TextEditingController();
  var phonenumberController = TextEditingController();
  var emailController = TextEditingController();



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
          title: "Add an appointment",
        ),
        backgroundColor: ArgonColors.bgColorScreen,
        drawer: ArgonDrawer(currentPage: "Addappoint"),
        body: SingleChildScrollView(



            child: Padding(
              padding: EdgeInsets.only(right: 24, left: 24, bottom: 36),
              child: SafeArea(
                bottom: true,
                child: Column(children: [

                  Padding(
                    padding: const EdgeInsets.only(left: 8.0, top: 40),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Text("Patient's name",
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
                      child: Text("Phone number",
                          style: TextStyle(
                              color: ArgonColors.text,
                              fontWeight: FontWeight.w600,
                              fontSize: 16)),
                    ),
                  ),
                  TextFormField(
                      controller: phonenumberController,
                    decoration: const InputDecoration(
                        labelText: 'Phone number',
                        hintText: 'Enter the patient phone number',
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
                      child: Text("Email address",
                          style: TextStyle(
                              color: ArgonColors.text,
                              fontWeight: FontWeight.w600,
                              fontSize: 16)),
                    ),
                  ),
                  TextFormField(
                    controller: emailController,
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
                  Padding(
                    padding: const EdgeInsets.only(left: 8.0, top: 40),
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SizedBox(height: 40,),
                          ElevatedButton(
                            style: ButtonStyle(
                              backgroundColor: MaterialStateProperty.resolveWith<Color>(
                                    (Set<MaterialState> states) {

                                  return Colors.lightBlue[400];

                                },
                              ),
                            ),
                            onPressed: _selectDate,
                            child: Text('SELECT DATE'),
                          ),
                          SizedBox(height: 20),
                          Text(
                            'Selected date: $_date',
                          ),
                          SizedBox(height: 40),
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
                          SizedBox(height: 20),
                          Text(
                            'Selected time: ${_time.format(context)}',
                          ),
                        ]),
                  ),
                 SizedBox(
                    width: double.infinity,
                    child: Padding(
                      padding:
                      const EdgeInsets.only(left: 25.0, right: 25.0, top: 30),
                      child: RaisedButton(
                        textColor: ArgonColors.white,
                        color: Colors.lightBlue[400],
                        onPressed: () {
                          print(nameController.text);
                          print(phonenumberController.text);
                          print(emailController.text);
                          print(_date);
                          print(_time);
                          if (
                              nameController.text.isEmpty ||
                              phonenumberController.text.isEmpty ||
                              emailController.text.isEmpty
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
                            AddAppoinment().addappoin(
                              nameController.text,
                              phonenumberController.text,
                              emailController.text,
                              _date,
                              _time,).then((val) {
                              if (val.data['success']) {
                              var token = val.data['token'];
                              Fluttertoast.showToast(
                              msg: 'Patient Added',
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
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(4.0),
                        );
                        child: Padding(
                            padding: EdgeInsets.only(
                                left: 16.0, right: 16.0, top: 12, bottom: 12),
                            child: Text("Add the appointment ",
                                style: TextStyle(
                                    fontWeight: FontWeight.w600, fontSize: 16.0)));
                        }),
                    ),
                  ),

                ]),
              ),
            )));
  }
}

