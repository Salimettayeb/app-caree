import 'package:argon_flutter/services/service-doctor/AuthDoctor.dart';
import 'package:argon_flutter/services/service-doctor/addMedicalFolder.dart';
import 'package:flutter/material.dart';

import 'package:argon_flutter/constants/Theme.dart';

//widgets
import 'package:argon_flutter/widgets/navbar.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'file:///C:/Users/salim/AndroidStudioProjects/app-care/lib/screens/doctor/drawer.dart';
import 'package:fluttertoast/fluttertoast.dart';

import 'logindoctor.dart';

final storage = new FlutterSecureStorage();


class Adddoss extends StatefulWidget {
  @override
  _AdddossState createState() => _AdddossState();
}

class _AdddossState extends State<Adddoss> {
  var    nameController = TextEditingController();
  var    filenumberController = TextEditingController();
  var    personnalantecedentsController = TextEditingController();
  var    familyantecedentController = TextEditingController();
  var    riskfactorsController = TextEditingController();
  var    notesController = TextEditingController();



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


          title: "Add a medical folder",

        ),
        backgroundColor: ArgonColors.bgColorScreen,
        drawer: ArgonDrawer(currentPage: "Adddoss"),
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
                        child: Text("File number",
                            style: TextStyle(
                                color: ArgonColors.text,
                                fontWeight: FontWeight.w600,
                                fontSize: 16)),
                      ),
                    ),
                    TextFormField(
                      controller: filenumberController,
                      decoration: const InputDecoration(
                          labelText: 'File number',
                          hintText: 'Enter the file number',
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
                        child: Text("Personnal antecedents",
                            style: TextStyle(
                                color: ArgonColors.text,
                                fontWeight: FontWeight.w600,
                                fontSize: 16)),
                      ),
                    ),
                    TextFormField(
                      controller: personnalantecedentsController,
                      decoration: const InputDecoration(
                          labelText: 'Personnal antecedents',
                          hintText: 'Personnal antecedents',
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
                        child: Text("Family antecedents",
                            style: TextStyle(
                                color: ArgonColors.text,
                                fontWeight: FontWeight.w600,
                                fontSize: 16)),
                      ),
                    ),
                    TextFormField(
                    controller: familyantecedentController,
                      decoration: const InputDecoration(
                          labelText: 'Family antecedents',
                          hintText: 'Family antecedents',
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
                        child: Text("Risk factors",
                            style: TextStyle(
                                color: ArgonColors.text,
                                fontWeight: FontWeight.w600,
                                fontSize: 16)),
                      ),
                    ),
                    TextFormField(
                      controller: riskfactorsController,
                      decoration: const InputDecoration(
                          labelText: 'Risk factors',
                          hintText: 'Risk factors',
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
                        child: Text("Note",
                            style: TextStyle(
                                color: ArgonColors.text,
                                fontWeight: FontWeight.w600,
                                fontSize: 16)),
                      ),
                    ),
                    TextFormField(
                      controller: notesController,
                      decoration: const InputDecoration(
                          labelText: 'Note',
                          hintText: 'Note',
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
                              print(nameController.text);
                              print(filenumberController.text);
                              print(personnalantecedentsController.text);
                              print(familyantecedentController.text);
                              print(riskfactorsController.text);
                              print(notesController.text);

                              if (
                                  nameController.text.isEmpty ||
                                  filenumberController.text.isEmpty ||
                                  personnalantecedentsController.text.isEmpty ||
                                      familyantecedentController.text.isEmpty ||
                                      riskfactorsController.text.isEmpty ||
                                      notesController.text.isEmpty
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
                                AddMedfolder().addmedfolder(
                                    doctorId,
                                  nameController.text,
                                  filenumberController.text,
                                  personnalantecedentsController.text,
                                  familyantecedentController.text,
                                  riskfactorsController.text,
                                    notesController.text ).then((val) {
                                  if (val.data['success']) {
                                    var token = val.data['token'];
                                    Fluttertoast.showToast(
                                        msg: 'Medical Folder added',
                                        toastLength: Toast.LENGTH_SHORT,
                                        gravity: ToastGravity.BOTTOM,
                                        timeInSecForIosWeb: 1,
                                        backgroundColor: Colors.green,
                                        textColor: Colors.white,
                                        fontSize: 16.0
                                    );
                                  }
                                });
                              }

                              
                            },
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(4.0),
                          ),
                          child: Padding(
                              padding: EdgeInsets.only(
                                  left: 16.0, right: 16.0, top: 12, bottom: 12),
                              child: Text("Add the folder",
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




