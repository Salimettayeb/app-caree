import 'dart:ui';
import 'package:argon_flutter/screens/doctor/logindoctor.dart';
import 'package:argon_flutter/screens/login-patient.dart';
import 'package:argon_flutter/screens/secretairee/loginSecretaire.dart';
import 'package:flutter/material.dart';

import 'package:argon_flutter/constants/Theme.dart';


class Onboarding extends StatelessWidget {

  String ValueChoose;


  List Marital =[
    "Doctor","Patient","Seretaire",];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(children: <Widget>[

          Container(
            child: Padding(
              padding:
              const EdgeInsets.only(top: 73, left: 32, right: 32, bottom: 16),
              child: Container(
                child: SafeArea(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Image.asset("assets/img/logowhite.png", scale: 0.5),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [

                          Padding(
                            padding: const EdgeInsets.only(top: 2.0),
                            child: Text("Garder votre santé, c'est notre mission. ",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 18,
                                    fontWeight: FontWeight.w200)),
                          ),
                        ],

                      ),

                      Padding(
                        padding: const EdgeInsets.only(top: 1.0),
                        child: SizedBox(
                          width: double.infinity,
                          child: FlatButton(
                            textColor: ArgonColors.text,
                            color: ArgonColors.secondary,
                            onPressed: () {
                              Navigator.push(context, new MaterialPageRoute(
                                  builder: (context) => new LoginPatient()));                            },
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(4.0),
                            ),
                            child: Padding(

                                padding: EdgeInsets.only(
                                    left: 16.0, right: 16.0, top: 12, bottom: 12),
                                child: Text("PATIENT",
                                    style: TextStyle(
                                        fontWeight: FontWeight.w600,
                                        fontSize: 16.0)
                                )
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 1.0),
                        child: SizedBox(
                          width: double.infinity,
                          child: FlatButton(
                            textColor: ArgonColors.text,
                            color: ArgonColors.secondary,
                            onPressed: () {
                              Navigator.push(context, new MaterialPageRoute(
                                  builder: (context) => new LoginDoctor()));                              },
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(4.0),
                            ),
                            child: Padding(

                                padding: EdgeInsets.only(
                                    left: 16.0, right: 16.0, top: 12, bottom: 12),
                                child: Text("DOCTOR",
                                    style: TextStyle(
                                        fontWeight: FontWeight.w600,
                                        fontSize: 16.0)
                                )
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 1.0),
                        child: SizedBox(
                          width: double.infinity,
                          child: FlatButton(
                            textColor: ArgonColors.text,
                            color: ArgonColors.secondary,
                            onPressed: () {
                              Navigator.push(context, new MaterialPageRoute(
                                  builder: (context) => new LoginSecretaire()));                               },
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(4.0),
                            ),
                            child: Padding(

                                padding: EdgeInsets.only(
                                    left: 16.0, right: 16.0, top: 12, bottom: 12),
                                child: Text("SECRETAIRE",
                                    style: TextStyle(
                                        fontWeight: FontWeight.w600,
                                        fontSize: 16.0)
                                )
                            ),
                          ),
                        ),
                      ),
                      // Padding(
                      //   padding: const EdgeInsets.only(top: 1.0),
                      //   child: SizedBox(
                      //     width: double.infinity,
                      //     child: FlatButton(
                      //       textColor: ArgonColors.text,
                      //       color: ArgonColors.secondary,
                      //       onPressed: () {
                      //         Navigator.pushReplacementNamed(context, '/profile');
                      //       },
                      //       shape: RoundedRectangleBorder(
                      //         borderRadius: BorderRadius.circular(4.0),
                      //       ),
                      //       child: Padding(
                      //           padding: EdgeInsets.only(
                      //               left: 16.0, right: 16.0, top: 12, bottom: 12),
                      //           child: Text("SIGNUP",
                      //               style: TextStyle(
                      //                   fontWeight: FontWeight.w600,
                      //                   fontSize: 16.0))),
                      //     ),
                      //   ),
                      // )
                    ],
                  ),
                ),
              ),
            ),
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage("assets/img/bb.jpg"),
                    fit: BoxFit.cover)),
          ),
        ]));

  }
}
