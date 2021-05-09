import 'package:flutter/material.dart';

import 'package:argon_flutter/constants/Theme.dart';

//widgets
import 'package:argon_flutter/widgets/navbar.dart';
import 'file:///C:/Users/salim/AndroidStudioProjects/app-care/lib/screens/doctor/drawer.dart';


class Newquest extends StatefulWidget {
  @override
  _NewquestState createState() => _NewquestState();
}

class _NewquestState extends State<Newquest> {
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
          title: "Questions",
        ),
        backgroundColor: ArgonColors.bgColorScreen,
        drawer: ArgonDrawer(currentPage: "Newquest"),
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
                      child: Text("Patients questions",
                          style: TextStyle(
                              color: ArgonColors.text,
                              fontWeight: FontWeight.w600,
                              fontSize: 16)),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 8.0, top: 10),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Text("",
                          style: TextStyle(
                              color: ArgonColors.text,
                              fontWeight: FontWeight.w600,
                              fontSize: 16)),
                    ),
                  ),

                  TextFormField(decoration: const InputDecoration(
                      labelText: 'The Answer',
                      hintText: 'Answer the question',
                      border: OutlineInputBorder()),
                    validator: (value) {
                      if (value.isEmpty) {
                        return 'Veuillez saisir un texte';
                      }
                      return null;
                    },),
                  SizedBox(
                    width: double.infinity,
                    child: Padding(
                      padding:
                      const EdgeInsets.only(left: 200.0, right: 5.0, top: 5),
                      child: RaisedButton(
                        textColor: ArgonColors.white,
                        color: Colors.blue[400],

                        onPressed: () {
                          // Respond to button press
                          Navigator.pushReplacementNamed(context, '/profadmin');
                        },
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(4.0),
                        ),
                        child: Padding(
                            padding: EdgeInsets.only(
                                left: 8.0, right: 8.0, top: 12, bottom: 12),
                            child: Text("Answer ",
                                style: TextStyle(
                                    fontWeight: FontWeight.w600, fontSize: 14.0))),
                      ),
                    ),
                  ),

                ]),
              ),
            )));
  }
}

