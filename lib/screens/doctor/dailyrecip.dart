import 'package:argon_flutter/services/service-doctor/AuthDoctor.dart';
import 'package:argon_flutter/services/service-doctor/addDailyrecip.dart';
import 'package:flutter/material.dart';

import 'package:argon_flutter/constants/Theme.dart';

//widgets
import 'package:argon_flutter/widgets/navbar.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:fluttertoast/fluttertoast.dart';

import 'drawer.dart';

final storage = new FlutterSecureStorage();

class Daily extends StatefulWidget {
  @override
  _DailyState createState() => _DailyState();
}


class _DailyState extends State<Daily> {
  bool switchValueOne;
  bool switchValueTwo;
  bool addedSuccessfully = false;
  var titleController = TextEditingController();
  var amountController = TextEditingController();
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

          title: "Daily recipe",
        ),
        backgroundColor: ArgonColors.bgColorScreen,
        drawer: ArgonDrawer(currentPage: "Daily"),
        body: SingleChildScrollView(



            child: Padding(
              padding: EdgeInsets.only(right: 24, left: 24, bottom: 36),
              child: SafeArea(
                bottom: true,
                child: Column(children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 8.0, top: 40),
                  ),

                  TextFormField(
                    decoration: const InputDecoration(
                        labelText: 'Title',
                        hintText: 'Title',
                        border: OutlineInputBorder()),
                    validator: (value) {
                      if (value.isEmpty) {
                        return 'Amount (dt) ';
                      }
                      return null;
                    },
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 8.0, top: 20),
                  ),
                  TextFormField(
                    decoration: const InputDecoration(
                        labelText: 'Amount (dt) ',
                        hintText: 'Amount (dt) ',
                        border: OutlineInputBorder()),
                    validator: (value) {
                      if (value.isEmpty) {
                        return 'Amount (dt) ';
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
                          print(titleController.text);
                          print(amountController.text);
                          if (
                          titleController.text.isEmpty ||
                              amountController.text.isEmpty
                              ) {
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
                            AddDailyrecip().addrecip(
                                doctorId,
                                titleController.text,
                                amountController.text).then((val) {
                              if (val.data['success']) {
                                var token = val.data['token'];
                                Fluttertoast.showToast(
                                    msg: 'Patient Added',
                                    toastLength: Toast.LENGTH_SHORT,
                                    gravity: ToastGravity.BOTTOM,
                                    timeInSecForIosWeb: 1,
                                    backgroundColor: Colors.green,
                                    textColor: Colors.white,
                                    fontSize: 16.0
                                );
                              }
                            }
                            );

                          }


                        },
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

                  )]),
              ),
            )));
  }
}

