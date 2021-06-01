
import 'package:argon_flutter/screens/directory.dart';
import 'package:argon_flutter/screens/doctor/loginDoctor.dart';
import 'package:argon_flutter/screens/home_screen_patient.dart';
import 'package:argon_flutter/screens/login-patient.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import 'package:argon_flutter/constants/Theme.dart';

import 'package:argon_flutter/widgets/drawer-tile.dart';

import '../patient/question.dart';
import '../doctor/newconsult.dart';
import '../doctor/profadmin.dart';

class PatientDrawer extends StatelessWidget {
  final String currentPage;

  PatientDrawer({this.currentPage});

  _launchURL() async {
    const url = 'https://creative-tim.com';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
        child: Container(
          color: ArgonColors.white,
          child: Column(children: [
            Container(
                height: MediaQuery.of(context).size.height * 0.1,
                width: MediaQuery.of(context).size.width * 0.85,
                child: SafeArea(
                  bottom: false,
                  child: Align(

                    alignment: Alignment.bottomLeft,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 32),
                      child: Image.asset("assets/img/blue-care.png"),
                    ),
                  ),
                )),
            GestureDetector(


              onTap: () {
                Navigator.pushNamed(context, '/profadmin');
              },
              child: CircleAvatar(

                radius: 40,
                backgroundImage: AssetImage("assets/images/doctor11.jpg"),
              ),
            ),


            Padding(
              padding: const EdgeInsets.only(left: 8.0, top: 10),
              child: Align(
                alignment: Alignment.center,
                child: Text("Ahmed B",
                    style: TextStyle(
                        color: ArgonColors.text,
                        fontWeight: FontWeight.w600,
                        fontSize: 16)),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 8.0, top: 5),
              child: Align(
                alignment: Alignment.center,
                child: Text("Ahmed@gmail.com",
                    style: TextStyle(
                        color: ArgonColors.text,
                        fontWeight: FontWeight.w200,
                        fontSize: 16)),
              ),
            ),
            Expanded(
              flex: 2,
              child: ListView(
                padding: EdgeInsets.only(top: 29, left: 16, right: 16),
                children: [


                  DrawerTile(
                      icon: Icons.home,
                      onTap: () {
                        if (currentPage != "Homespatient")
                          Navigator.push(context, new MaterialPageRoute(
                              builder: (context) => new HomeScreenPatient()));
                      },
                      iconColor: ArgonColors.primary,
                      title: "Home ",
                      isSelected: currentPage == "HomePatient" ? true : false),




                  DrawerTile(
                      icon: Icons.question_answer,
                      // onTap: () {
                      //   if (currentPage != "Response")
                      //     Navigator.push(context, new MaterialPageRoute(
                      //         builder: (context) => new Response()));                         },
                      iconColor: ArgonColors.primary,
                      title: "Notifications",
                      isSelected: currentPage == "Response" ? true : false),







                  DrawerTile(
                      icon: Icons.archive,
                      onTap: () {
                        if (currentPage != "Onboarding")
                          Navigator.push(context, new MaterialPageRoute(
                              builder: (context) => new DoctorLogin()));                         },
                      iconColor: ArgonColors.primary,
                      title: "logout",
                      isSelected: currentPage == "Onboarding" ? true : false),

                ],
              ),
            ),

          ]),
        ));
  }
}

