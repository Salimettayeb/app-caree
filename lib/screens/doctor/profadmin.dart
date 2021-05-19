import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:argon_flutter/constants/Theme.dart';

//widgets
import 'package:argon_flutter/widgets/navbar.dart';
import 'file:///C:/Users/salim/AndroidStudioProjects/app-care/lib/screens/doctor/drawer.dart';

// ignore: must_be_immutable
class ProfAdm extends StatelessWidget {
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
          title: ('Profil'),

        ),
        backgroundColor: ArgonColors.bgColorScreen,
        drawer: ArgonDrawer(currentPage: "ProfAdm"),
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
                            child: Padding(
                              padding: const EdgeInsets.only(left: 2, top: 20),
                              child: Image.asset("assets/img/doctor.jpg", width: 150, height: 150),
                            ),
                          )


                      ),
                    ),

                    Padding(
                      padding: const EdgeInsets.only(left: 8.0, top: 40),
                      child: Align(
                        alignment: Alignment.center,
                        child: Text("Dr.Flen..",
                            style: TextStyle(
                                color: ArgonColors.text,
                                fontWeight: FontWeight.w600,
                                fontSize: 25)),

                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 8.0, top: 5),
                      child: Align(
                        alignment: Alignment.center,
                        child: Text("Generalist..",
                            style: TextStyle(
                                color: Colors.grey,
                                fontWeight: FontWeight.w600,
                                fontSize: 15)),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 8.0, top: 5),
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: Text("About",
                            style: TextStyle(
                                color: ArgonColors.text,
                                fontWeight: FontWeight.w900,
                                fontSize: 15)),
                      ),
                    ),

                    Padding(
                      padding: const EdgeInsets.only(left: 8.0, top: 5),
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: Text("",
                            style: TextStyle(
                                color: ArgonColors.text,
                                fontWeight: FontWeight.w900,
                                fontSize: 15)),
                      ),
                    ),





                    Padding(
                      padding: const EdgeInsets.only(left: 8.0, top: 20),
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: Text("Phone number",
                            style: TextStyle(
                                color: ArgonColors.text,
                                fontWeight: FontWeight.w900,
                                fontSize: 16)),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 8.0, top: 5),
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: Text("",
                            style: TextStyle(
                                color: ArgonColors.text,
                                fontWeight: FontWeight.w900,
                                fontSize: 15)),
                      ),
                    ),

                    Padding(
                      padding: const EdgeInsets.only(left: 8.0, top: 20),
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: Text("Email address",
                            style: TextStyle(
                                color: ArgonColors.text,
                                fontWeight: FontWeight.w900,
                                fontSize: 16)),
                      ),
                    ),

                    Padding(
                      padding: const EdgeInsets.only(left: 8.0, top: 5),
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: Text("",
                            style: TextStyle(
                                color: ArgonColors.text,
                                fontWeight: FontWeight.w900,
                                fontSize: 15)),
                      ),
                    ),


                    Padding(
                      padding: const EdgeInsets.only(left: 8.0, top: 5),
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: Text("Address",
                            style: TextStyle(
                                color: ArgonColors.text,
                                fontWeight: FontWeight.w900,
                                fontSize: 15)),
                      ),
                    ),



                    Padding(
                      padding: const EdgeInsets.only(left: 8.0, top: 5),
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: Text("",
                            style: TextStyle(
                                color: ArgonColors.text,

                                fontWeight: FontWeight.w900,
                                fontSize: 15)),
                      ),
                    ),


                    Padding(
                        padding: const EdgeInsets.all(12.0),


                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Container(
                              child: Padding(
                                padding: const EdgeInsets.all(12.0),
                                child: Tooltip(
                                  message: 'Text',

                                  child: Text(
                                    'End of subscription ',
                                    style: TextStyle(
                                      color: Colors.grey,
                                      fontSize: 20,
                                    ), //TextStyle
                                  ), //Text
                                ), //Tooltip
                              ), //Padding
                              color: Colors.blue[50],
                              width: 250,
                              height: 150,
                            ), //Container
                          ], //<Widget>[]
                        )


                    ),

                    Padding(
                      padding: const EdgeInsets.only(left: 8.0, top: 5),
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: Text("",
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.w600,
                                fontSize: 15)),
                      ),
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
                            Navigator.pushReplacementNamed(context, '/modifierinfosprof');
                          },
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(4.0),
                          ),
                          child: Padding(
                              padding: EdgeInsets.only(
                                  left: 16.0, right: 16.0, top: 12, bottom: 12),
                              child: Text("Modify ",
                                  style: TextStyle(
                                      fontWeight: FontWeight.w600, fontSize: 16.0))),
                        ),
                      ),

                    )

                  ],
                  ),

                )

            )

        )
    );
  }
}



