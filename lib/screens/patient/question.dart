import 'package:argon_flutter/screens/patient/Drawerpatient.dart';
import 'package:flutter/material.dart';

import 'package:argon_flutter/constants/Theme.dart';

//widgets
import 'package:argon_flutter/widgets/navbar.dart';
import 'file:///C:/Users/salim/AndroidStudioProjects/app-care/lib/screens/doctor/drawer.dart';
import 'package:argon_flutter/widgets/input.dart';
import 'package:argon_flutter/widgets/table-cell.dart';

class Question extends StatefulWidget {
  @override
  _ElementsState createState() => _ElementsState();
}

class _ElementsState extends State<Question> {
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
          title: "Question",
        ),
        backgroundColor: ArgonColors.bgColorScreen,
        drawer: PatientDrawer(currentPage: "Elements"),
        body: SingleChildScrollView(



            child: Padding(
              padding: EdgeInsets.only(top:1,right: 24, left: 24, bottom: 36),
              child: SafeArea(
                bottom: true,
                child: Column(children: [

                  Padding(
                    padding: const EdgeInsets.only(left: 1.0, top: 32),
                    child: Align(
                      alignment: Alignment.centerLeft,

                       child: Text("Question Box",
                          style: TextStyle(
                              color: ArgonColors.text,
                              fontWeight: FontWeight.w600,
                              fontSize: 16)),
                    ),
                  ),
                  // Container(),
                  // SizedBox(
                  //   height: 100,
                  //   width: 500,
                  //
                  //   child: Padding(
                  //         padding: EdgeInsets.all(16.0),
                  //
                  //
                  //     child: Input(
                  //       placeholder: "Write your question here!",
                  //     ),
                  //   ),
                  // ),
                  Padding(
                    padding: EdgeInsets.only(left: 1.0, right: 5.0, top: 15.0,bottom: 10.0),
                    child: TextField(
                        cursorColor: Colors.grey,

                        decoration: InputDecoration(
                          hintText: 'Write you question here !',
                          //labelStyle: textStyle,
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(5),
                              borderSide: BorderSide(width: 2, color: Colors.black,)),
                          focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: BorderSide(width: 2, color: Colors.lightBlue)),
                        )

                    ),
                  ),

                  Padding(
                    padding: const EdgeInsets.only(left: 1.0, top: 32, bottom: 32),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Text("Do you want to send this message anonymously ?",
                          style: TextStyle(
                              color: ArgonColors.text,
                              fontWeight: FontWeight.w600,
                              fontSize: 16)),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Hide my identity",
                          style: TextStyle(color: ArgonColors.text)),
                      Switch.adaptive(
                          value: switchValueOne,
                          onChanged: (bool newValue) =>
                              setState(() => switchValueOne = newValue),
                          activeColor: Colors.lightBlue[400]
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 100.0, top: 32, bottom: 32),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Text("Add an attached file",
                          style: TextStyle(
                              color: ArgonColors.text,
                              fontWeight: FontWeight.w600,
                              fontSize: 16)
                      ),

                    ),
                  ),





                  SizedBox(
                    width: double.infinity,
                    child: Padding(
                      padding:
                      const EdgeInsets.only(left: 10.0, right: 10.0, top: 30),
                      // ignore: deprecated_member_use
                      child: RaisedButton(
                        textColor: ArgonColors.white,
                        color: Colors.lightBlue[400],
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
                            child: Text("SUBMIT ",
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