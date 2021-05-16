import 'file:///C:/Users/salim/AndroidStudioProjects/app-care/lib/screens/doctor/addappoint.dart';
import 'file:///C:/Users/salim/AndroidStudioProjects/app-care/lib/screens/doctor/adddossier.dart';
import 'file:///C:/Users/salim/AndroidStudioProjects/app-care/lib/screens/doctor/appoinements.dart';
import 'file:///C:/Users/salim/AndroidStudioProjects/app-care/lib/screens/doctor/archive.dart';
import 'package:argon_flutter/screens/directory.dart';
import 'package:argon_flutter/screens/doctor/loginDoctor.dart';
import 'file:///C:/Users/salim/AndroidStudioProjects/app-care/lib/screens/doctor/doctorquestions.dart';
import 'file:///C:/Users/salim/AndroidStudioProjects/app-care/lib/screens/doctor/finance.dart';
import 'package:argon_flutter/screens/login-patient.dart';
import 'file:///C:/Users/salim/AndroidStudioProjects/app-care/lib/screens/doctor/homedoctor.dart';
import 'file:///C:/Users/salim/AndroidStudioProjects/app-care/lib/screens/doctor/listingconsult.dart';
import 'file:///C:/Users/salim/AndroidStudioProjects/app-care/lib/screens/doctor/listingmedfold.dart';
import 'file:///C:/Users/salim/AndroidStudioProjects/app-care/lib/screens/doctor/newconsult.dart';
import 'file:///C:/Users/salim/AndroidStudioProjects/app-care/lib/screens/doctor/newpatient.dart';
import 'file:///C:/Users/salim/AndroidStudioProjects/app-care/lib/screens/doctor/listingpatient.dart';
import 'file:///C:/Users/salim/AndroidStudioProjects/app-care/lib/screens/doctor/profadmin.dart';

import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import 'package:argon_flutter/constants/Theme.dart';

import 'package:argon_flutter/widgets/drawer-tile.dart';

class ArgonDrawer extends StatelessWidget {
  final String currentPage;

  ArgonDrawer({this.currentPage});



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
                child: Text("Mohamed...",
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
                child: Text("Mohamed...@gmail.com",
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
                        if (currentPage != "Homedoctor")
                          Navigator.push(context, new MaterialPageRoute(
                              builder: (context) => new DoctorHome()));
                      },
                      iconColor: ArgonColors.primary,
                      title: "Home doctor",
                      isSelected: currentPage == "HomeDoctor" ? true : false),
                  DrawerTile(
                      icon: Icons.add_circle_outline_outlined ,
                      onTap: () {
                        if (currentPage != "Newpat")
                          Navigator.pushNamed(context, '/newpatient');

                      },
                      iconColor: ArgonColors.warning,
                      title: "New patient",
                      isSelected: currentPage == "Newpat" ? true : false),
                  DrawerTile(
                      icon: Icons.add_circle_outline_outlined ,
                      onTap: () {
                        if (currentPage != "NewConsult")
                          Navigator.pushNamed(context, '/newconsult');                      },
                      iconColor: ArgonColors.info,
                      title: "New consultation",
                      isSelected: currentPage == "NewConsult" ? true : false),



                  DrawerTile(
                      icon: Icons.add_circle_outline_outlined ,
                      onTap: () {
                        if (currentPage != "Adddoss")
                          Navigator.push(context, new MaterialPageRoute(
                              builder: (context) => new Adddoss()));                      },
                      iconColor: ArgonColors.error,
                      title: "Add a medical folder",
                      isSelected: currentPage == "Adddoss" ? true : false),




                  DrawerTile(
                      icon: Icons.add_circle_outline_outlined ,
                      onTap: () {
                        if (currentPage != "Addappoint")
                          Navigator.push(context, new MaterialPageRoute(
                              builder: (context) => new Addappoint()));                      },
                      iconColor: ArgonColors.error,
                      title: "Add an appointment",
                      isSelected: currentPage == "Addappoint" ? true : false),

                  DrawerTile(
                      icon: Icons.list,
                      onTap: () {
                        if (currentPage != "Listpat")
                          Navigator.push(context, new MaterialPageRoute(
                              builder: (context) => new Listpat()));                      },
                      iconColor: ArgonColors.primary,
                      title: "Listing patients",
                      isSelected: currentPage == "Listpat" ? true : false),

                  DrawerTile(
                      icon: Icons.list,
                      onTap: () {
                        if (currentPage != "ListConsult")
                          Navigator.push(context, new MaterialPageRoute(
                              builder: (context) => new ListConsult()));                         },
                      iconColor: ArgonColors.info,
                      title: "Listing consultations",
                      isSelected: currentPage == "ListConsult" ? true : false),

                  DrawerTile(
                      icon: Icons.list,
                      onTap: () {
                        if (currentPage != "Medfold")
                          Navigator.push(context, new MaterialPageRoute(
                              builder: (context) => new Medfold()));                         },
                      iconColor: ArgonColors.primary,
                      title: "Listing medical folders",
                      isSelected: currentPage == "Medfold" ? true : false),



                  DrawerTile(
                      icon: Icons.calendar_today_rounded ,
                      onTap: () {
                        if (currentPage != "Account")
                          Navigator.push(context, new MaterialPageRoute(
                              builder: (context) => new Appoint()));                         },
                      iconColor: ArgonColors.info,
                      title: "Appointments",
                      isSelected: currentPage == "Account" ? true : false),


                  DrawerTile(
                      icon: Icons.question_answer,
                      onTap: () {
                        if (currentPage != "Newquest")
                          Navigator.push(context, new MaterialPageRoute(
                              builder: (context) => new Newquest()));                         },
                      iconColor: ArgonColors.primary,
                      title: "Questions",
                      isSelected: currentPage == "Newquest" ? true : false),


                  DrawerTile(
                      icon: Icons.question_answer,
                      onTap: () {
                        if (currentPage != "Direc")
                          Navigator.push(context, new MaterialPageRoute(
                              builder: (context) => new Direc()));                         },
                      iconColor: ArgonColors.primary,
                      title: "Directory",
                      isSelected: currentPage == "Direc" ? true : false),


                  DrawerTile(
                      icon: Icons.question_answer,
                      onTap: () {
                        if (currentPage != "Fin")
                          Navigator.push(context, new MaterialPageRoute(
                              builder: (context) => new Fin()));                         },
                      iconColor: ArgonColors.primary,
                      title: "Financial accounting",
                      isSelected: currentPage == "Fin" ? true : false),


                  DrawerTile(
                      icon: Icons.archive,
                      onTap: () {
                        if (currentPage != "Arch")
                          Navigator.push(context, new MaterialPageRoute(
                              builder: (context) => new Arch()));                         },
                      iconColor: ArgonColors.primary,
                      title: "Archive",
                      isSelected: currentPage == "Arch" ? true : false),


                  DrawerTile(
                      icon: Icons.archive,
                      onTap: () {
                        if (currentPage != "ProfAdm")
                          Navigator.push(context, new MaterialPageRoute(
                              builder: (context) => new ProfAdm()));                         },
                      iconColor: ArgonColors.primary,
                      title: "Profil",
                      isSelected: currentPage == "ProfAdm" ? true : false),


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
