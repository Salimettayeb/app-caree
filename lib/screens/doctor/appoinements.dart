import 'package:argon_flutter/constants/utils.dart';
import 'package:argon_flutter/patient_list_event_bus.dart';
import 'package:argon_flutter/screens/patient/appoinment_details.dart';
import 'package:argon_flutter/screens/patient/medicalfolder_details.dart';
import 'package:argon_flutter/screens/patient/patient_details.dart';
import 'package:argon_flutter/services/service-doctor/getAppoinment.dart';
import 'package:argon_flutter/services/service-doctor/getDossier.dart';
import 'package:argon_flutter/services/service-doctor/getPatient.dart';
import 'package:flutter/material.dart';

import 'package:argon_flutter/constants/Theme.dart';

//widgets
import 'package:argon_flutter/widgets/navbar.dart';
import 'file:///C:/Users/salim/AndroidStudioProjects/app-care/lib/screens/doctor/drawer.dart';
import 'homedoctor.dart';


class Appoint extends StatefulWidget {


  @override
  _AppointState createState() => _AppointState();
}

class _AppointState extends State<Appoint> {
  bool switchValueOne;
  bool switchValueTwo;
  List allAppoinments = [];
  bool loading = false;

  void initState() {
    setState(() {
      switchValueOne = true;
      switchValueTwo = false;
    });
    // eventBus.on<PatientListEventBus>().listen((event) async {
    //   print("eventBus fired");
    // });
    getAllAppoinment();
    super.initState();
  }


  getAllAppoinment() async{
    setState(() {
      loading = true;
    });
    GetAppoinment().getAllAppoinment().then((val) {
      if (val.data['success']) {
        List appoinments=val.data["appoinments"] ;
        print(appoinments);
        Future.delayed(Duration(seconds: 2)).then((value) => setState(() {
          loading = false;
          allAppoinments = val.data["appoinments"];
        }));
      }
    }
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: Navbar(
          backButton: true,
          bgColor: Colors.lightBlue[400],
          searchBar: true,

          title: "Appoinments",

        ),
        backgroundColor: ArgonColors.bgColorScreen,
        drawer: ArgonDrawer(currentPage: "Appoint"),
        body:loading?
        Center(
          child: CircularProgressIndicator(),
        )
            :ListView.builder(
          itemCount: allAppoinments.length,
          itemBuilder: (BuildContext context, index){
            return Padding(
              padding: EdgeInsets.fromLTRB(12, 12, 12, 0),
              child: Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: Colors.grey[100],
                    boxShadow: [
                      BoxShadow(
                          color: Colors.grey.withOpacity(0.5),
                          spreadRadius: 2,
                          blurRadius:2,
                          offset: Offset(0,3)
                      )
                    ]
                ),
                child: ListTile(
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context) => AppoinmentsDetailsScreen(appoinmentsDetails:allAppoinments[index],)));
                    // Navigator.push(context, MaterialPageRoute(builder: (context) => PatientDetailsScreen(patientDetails: {
                    //   "name": "Salim",
                    //   "age": "23",
                    //   "email": "selim@intigo.tn"
                    // },)));
                  },
                  title: Text("${allAppoinments[index]["name"]}"),
                  subtitle: Text("${allAppoinments[index]["date"]} + ${allAppoinments[index]["time"]} "),

                  trailing: Icon(Icons.arrow_forward_ios),

                ),

              ),

            );
          },
        ));
  }
}
