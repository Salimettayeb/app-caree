import 'package:argon_flutter/constants/utils.dart';
import 'package:argon_flutter/patient_list_event_bus.dart';
import 'package:argon_flutter/screens/patient/medicalfolder_details.dart';
import 'package:argon_flutter/screens/patient/patient_details.dart';
import 'package:argon_flutter/services/service-doctor/getDossier.dart';
import 'package:argon_flutter/services/service-doctor/getPatient.dart';
import 'package:flutter/material.dart';

import 'package:argon_flutter/constants/Theme.dart';

//widgets
import 'package:argon_flutter/widgets/navbar.dart';
import 'file:///C:/Users/salim/AndroidStudioProjects/app-care/lib/screens/doctor/drawer.dart';
import 'homedoctor.dart';


class Medfold extends StatefulWidget {


  @override
  _MedfoldState createState() => _MedfoldState();
}

class _MedfoldState extends State<Medfold> {
  bool switchValueOne;
  bool switchValueTwo;
  List allMedfolders = [];
  bool loading = false;

  void initState() {
    setState(() {
      switchValueOne = true;
      switchValueTwo = false;
    });
    // eventBus.on<PatientListEventBus>().listen((event) async {
    //   print("eventBus fired");
    // });
    getAllDossier();
    super.initState();
  }


  getAllDossier() async{
    setState(() {
      loading = true;
    });
    GetDossier().getAllDossier().then((val) {
      if (val.data['success']) {
        List medfolders=val.data["medfolders"] ;
        print(medfolders);
        Future.delayed(Duration(seconds: 2)).then((value) => setState(() {
          loading = false;
          allMedfolders = val.data["medfolders"];
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

          title: "Medical Folders",

        ),
        backgroundColor: ArgonColors.bgColorScreen,
        drawer: ArgonDrawer(currentPage: "Medfold"),
        body:loading?
        Center(
          child: CircularProgressIndicator(),
        )
            :ListView.builder(
          itemCount: allMedfolders.length,
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
                    Navigator.push(context, MaterialPageRoute(builder: (context) => MedicalFoldersScreen(medicalFolders:allMedfolders[index],)));
                    // Navigator.push(context, MaterialPageRoute(builder: (context) => PatientDetailsScreen(patientDetails: {
                    //   "name": "Salim",
                    //   "age": "23",
                    //   "email": "selim@intigo.tn"
                    // },)));
                  },
                  title: Text("${allMedfolders[index]["name"]}"),
                  subtitle: Text("${allMedfolders[index]["filenumber"]}"),
                  trailing: Icon(Icons.arrow_forward_ios),
                ),
              ),
            );
          },
        ));
  }
}
