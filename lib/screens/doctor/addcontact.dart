import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:argon_flutter/constants/Theme.dart';

//widgets
import 'package:argon_flutter/widgets/navbar.dart';
import 'file:///C:/Users/salim/AndroidStudioProjects/app-care/lib/screens/doctor/drawer.dart';

// ignore: must_be_immutable
class Addcont extends StatelessWidget {
  String ValueChoose;

  List ListItem =[
    "Tunis","La Manouba","Ariana","Ben Arous","Le Kef","Bizerte","Gabes","Tozeur","Sousse","Médenine","Tataouine","Gafsa","Jendouba","Kairouan","Béja","Mahdia","Kasserine","Kébili","Monastir","Nabeul","Sfax","Sidi bouzid","Siliana","Zaghouan"
  ];




  @override
  Widget build(BuildContext context) {
    return Scaffold(

        appBar: Navbar(
          backButton: true,
          bgColor: Colors.lightBlue[400] ,
          title: ('Add a contact'),







        ),
        backgroundColor: ArgonColors.bgColorScreen,
        drawer: ArgonDrawer(currentPage: "Addcont"),
        body: SingleChildScrollView(
            child: Padding(

                padding: EdgeInsets.only(right: 24, left: 24, bottom: 36),
                child: SafeArea(
                  bottom: true,
                  child: Column(children: [



                    Padding(
                      padding: const EdgeInsets.only(left: 1.0, top: 40),
                      child: Align(
                          alignment: Alignment.center,
                          child: Container(
                            padding: EdgeInsets.symmetric(horizontal: 15),

                          )


                      ),
                    ),


                    Padding(
                      padding: const EdgeInsets.only(left: 8.0, top: 5),
                      child: Align(
                        alignment: Alignment.center,
                        child: Text("",
                            style: TextStyle(
                                color: Colors.grey,
                                fontWeight: FontWeight.w600,
                                fontSize: 15)),
                      ),
                    ),
                    TextFormField(

                      decoration: const InputDecoration(
                          labelText: 'Name',
                          hintText: 'Enter the name',
                          border: OutlineInputBorder()),
                      validator: (value) {
                        if (value.isEmpty) {
                          return 'Veuillez saisir un texte';
                        }
                        return null;
                      },
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 8.0, top: 20),
                      child: Align(
                        alignment: Alignment.center,
                        child: Text("",
                            style: TextStyle(
                                color: Colors.grey,
                                fontWeight: FontWeight.w600,
                                fontSize: 15)),
                      ),
                    ),
                    TextFormField(

                      decoration: const InputDecoration(
                          labelText: 'Job',
                          hintText: 'Enter the job',
                          border: OutlineInputBorder()),
                      validator: (value) {
                        if (value.isEmpty) {
                          return 'Veuillez saisir un texte';
                        }
                        return null;
                      },
                    ),




                    Padding(
                      padding: const EdgeInsets.only(left: 8.0, top: 20),
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: Text("",
                            style: TextStyle(
                                color: ArgonColors.text,
                                fontWeight: FontWeight.w600,
                                fontSize: 16)),
                      ),
                    ),
                    TextFormField(

                      decoration: const InputDecoration(
                          labelText: 'Phone number',
                          hintText: 'Enter the phone number',
                          border: OutlineInputBorder()),
                      validator: (value) {
                        if (value.isEmpty) {
                          return 'Veuillez saisir un texte';
                        }
                        return null;
                      },
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 8.0, top: 20),
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: Text("",
                            style: TextStyle(
                                color: ArgonColors.text,
                                fontWeight: FontWeight.w600,
                                fontSize: 16)),
                      ),
                    ),
                    TextFormField(

                      decoration: const InputDecoration(
                          labelText: 'Email address',
                          hintText: 'Enter the email address',
                          border: OutlineInputBorder()),
                      validator: (value) {
                        if (value.isEmpty) {
                          return 'Veuillez saisir un texte';
                        }
                        return null;
                      },
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 8.0, top: 20),
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: Text("",
                            style: TextStyle(
                                color: ArgonColors.text,
                                fontWeight: FontWeight.w600,
                                fontSize: 16)),
                      ),
                    ),
                    TextFormField(

                      decoration: const InputDecoration(
                          labelText: 'Address',
                          hintText: 'Enter the Address',
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
                        child: RaisedButton(
                          textColor: ArgonColors.white,
                          color: Colors.lightBlue[400],
                          onPressed: () {
                            // Respond to button press
                            Navigator.pushReplacementNamed(context, '/directory');
                          },
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(4.0),
                          ),
                          child: Padding(
                              padding: EdgeInsets.only(
                                  left: 16.0, right: 16.0, top: 12, bottom: 12),
                              child: Text("Add  ",
                                  style: TextStyle(
                                      fontWeight: FontWeight.w600, fontSize: 16.0))),
                        ),
                      ),



                    ),
                    SizedBox(
                      width: double.infinity,
                      child: Padding(
                        padding:
                        const EdgeInsets.only(left: 5.0, right: 5.0, top: 5),
                        child: RaisedButton(
                          textColor: ArgonColors.white,
                          color: Colors.grey[400],
                          onPressed: () {
                            // Respond to button press
                            Navigator.pushReplacementNamed(context, '/directory');
                          },
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(4.0),
                          ),
                          child: Padding(
                              padding: EdgeInsets.only(
                                  left: 16.0, right: 16.0, top: 12, bottom: 12),
                              child: Text("Cancel ",
                                  style: TextStyle(
                                      fontWeight: FontWeight.w600, fontSize: 16.0))),
                        ),
                      ),



                    ),

                  ],
                  ),

                )




            )

        )
    );
  }
}
