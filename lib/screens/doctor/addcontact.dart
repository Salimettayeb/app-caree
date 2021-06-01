import 'dart:ui';
import 'package:argon_flutter/services/service-doctor/AuthDoctor.dart';
import 'package:argon_flutter/services/service-doctor/addContact.dart';

import 'package:flutter/material.dart';
import 'package:argon_flutter/constants/Theme.dart';

//widgets
import 'package:argon_flutter/widgets/navbar.dart';
import 'package:fluttertoast/fluttertoast.dart';

import 'addappoint.dart';
import 'drawer.dart';

// ignore: must_be_immutable
class Addcont extends StatelessWidget {
  var nameController = TextEditingController();
  var jobController = TextEditingController();
  var phonenumberController = TextEditingController();
  var emailController = TextEditingController();
  var addressController = TextEditingController();
  String ValueChoose;

  List ListItem =[
    "Tunis","La Manouba","Ariana","Ben Arous","Le Kef","Bizerte","Gabes","Tozeur","Sousse","Médenine","Tataouine","Gafsa","Jendouba","Kairouan","Béja","Mahdia","Kasserine","Kébili","Monastir","Nabeul","Sfax","Sidi bouzid","Siliana","Zaghouan"
  ];




  @override
  Widget build(BuildContext context) {
    return Scaffold(

        appBar: Navbar(
          backButton: true,
          bgColor: Colors.lightBlue[400],
          searchBar: true,

          title: "Add a Contact",

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
                      padding: const EdgeInsets.only(left: 8.0, top: 20),
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: Text("Name",
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
                          hintText: 'Enter Name',
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
                        child: Text("Job",
                            style: TextStyle(
                                color: ArgonColors.text,
                                fontWeight: FontWeight.w600,
                                fontSize: 16)),
                      ),
                    ),
                    TextFormField(
                      controller: jobController,
                      decoration: const InputDecoration(
                          labelText: 'Job',
                          hintText: 'Enter Job',
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
                        child: Text("Address",
                            style: TextStyle(
                                color: ArgonColors.text,
                                fontWeight: FontWeight.w600,
                                fontSize: 16)),
                      ),
                    ),
                    TextFormField(
                      controller: addressController,
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
                          onPressed: () async{
                            print(jobController.text);
                            print(nameController.text);
                            print(phonenumberController.text);
                            print(emailController.text);
                            print(addressController.text);

                            if (
                            nameController.text.isEmpty ||

                                jobController.text.isEmpty ||
                                phonenumberController.text.isEmpty ||
                                emailController.text.isEmpty ||
                            addressController.text.isEmpty

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
                              String doctor = await storage.read(key: "token");
                              String doctorId = AuthDoctor().parseJwt(doctor)["_id"];
                              AddContact().addcontact(
                                doctorId,
                                nameController.text,
                                jobController.text,
                                phonenumberController.text,
                                emailController.text,
                                addressController.text
                               ).then((val) {
                                if (val.data['success']) {
                                  var token = val.data['token'];
                                  Fluttertoast.showToast(
                                      msg: 'Appoinment Added',
                                      toastLength: Toast.LENGTH_SHORT,
                                      gravity: ToastGravity.BOTTOM,
                                      timeInSecForIosWeb: 1,
                                      backgroundColor: Colors.green,
                                      textColor: Colors.white,
                                      fontSize: 16.0
                                  );
                                }
                              });
                            }},
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(4.0),
                          ),
                          child: Padding(
                              padding: EdgeInsets.only(
                                  left: 16.0, right: 16.0, top: 12, bottom: 12),
                              child: Text("Add ",
                                  style: TextStyle(
                                      fontWeight: FontWeight.w600, fontSize: 16.0))),
                        ),
                      ),

                    )


                  ]
                  ),

                )

            )

        )
    );
  }
}

