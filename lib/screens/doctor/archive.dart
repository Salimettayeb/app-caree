import 'package:flutter/material.dart';

import 'package:argon_flutter/constants/Theme.dart';

//widgets
import 'package:argon_flutter/widgets/navbar.dart';
import 'file:///C:/Users/salim/AndroidStudioProjects/app-care/lib/screens/doctor/drawer.dart';


class Arch extends StatefulWidget {
  @override
  _ArchState createState() => _ArchState();
}

class _ArchState extends State<Arch> {
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
          searchBar: true,
          title: "Archive",
        ),
        backgroundColor: ArgonColors.bgColorScreen,
        drawer: ArgonDrawer(currentPage: "Arch"),
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
                      child: Text("archive",
                          style: TextStyle(
                              color: ArgonColors.text,
                              fontWeight: FontWeight.w600,
                              fontSize: 16)),
                    ),
                  ),

                ]),
              ),
            )));
  }
}

