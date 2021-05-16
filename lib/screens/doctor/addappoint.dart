import 'package:flutter/material.dart';

import 'package:argon_flutter/constants/Theme.dart';

//widgets
import 'package:argon_flutter/widgets/navbar.dart';
import 'file:///C:/Users/salim/AndroidStudioProjects/app-care/lib/screens/doctor/drawer.dart';
import 'package:argon_flutter/widgets/input.dart';
import 'package:argon_flutter/widgets/table-cell.dart';

class Addappoint extends StatefulWidget {
  @override
  _AddappointState createState() => _AddappointState();
}

class _AddappointState extends State<Addappoint> {
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
                      child: RaisedButton(
                        textColor: ArgonColors.white,
                        color: Colors.lightBlue[400],
                        onPressed: () {
                          // Respond to button press
                          Navigator.pushReplacementNamed(context, '/home');
                        },
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(4.0),
                        ),
                        child: Padding(
                            padding: EdgeInsets.only(
                                left: 16.0, right: 16.0, top: 12, bottom: 12),
                            child: Text("Add the appointment ",
                                style: TextStyle(
                                    fontWeight: FontWeight.w600, fontSize: 16.0))),
                      ),
                    ),




                  ),

                ]),
              ),
            )));
  }
}

