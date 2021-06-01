import 'package:argon_flutter/constants/utils.dart';
import 'package:argon_flutter/patient_list_event_bus.dart';
import 'package:argon_flutter/screens/patient/contact_details.dart';
import 'package:argon_flutter/screens/patient/patient_details.dart';
import 'package:argon_flutter/services/service-doctor/getDossier.dart';
import 'package:argon_flutter/services/service-doctor/getContact.dart';
import 'package:flutter/material.dart';

import 'package:argon_flutter/constants/Theme.dart';

//widgets
import 'package:argon_flutter/widgets/navbar.dart';
import 'file:///C:/Users/salim/AndroidStudioProjects/app-care/lib/screens/doctor/drawer.dart';


class Direc extends StatefulWidget {


  @override
  _DirecState createState() => _DirecState();
}

class _DirecState extends State<Direc> {
  bool switchValueOne;
  bool switchValueTwo;
  List allContacts = [];
  bool loading = false;

  void initState() {
    setState(() {
      switchValueOne = true;
      switchValueTwo = false;
    });
    // eventBus.on<PatientListEventBus>().listen((event) async {
    //   print("eventBus fired");
    // });
    getAllContact();
    super.initState();
  }


  getAllContact() async{
    setState(() {
      loading = true;
    });
    GetContact().getAllContact().then((val) {
      if (val.data['success']) {
        List contacts=val.data["contacts"] ;
        print(contacts);
        Future.delayed(Duration(seconds: 2)).then((value) => setState(() {
          loading = false;
          allContacts = val.data["contacts"];
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

          title: "Directory",

        ),
        backgroundColor: ArgonColors.bgColorScreen,
        drawer: ArgonDrawer(currentPage: "Direc"),
        body:loading?
        Center(
          child: CircularProgressIndicator(),
        )
            :ListView.builder(
          itemCount: allContacts.length,
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
                    Navigator.push(context, MaterialPageRoute(builder: (context) => ContactDetailsScreen(contactsDetails:allContacts[index],)));
                    // Navigator.push(context, MaterialPageRoute(builder: (context) => PatientDetailsScreen(patientDetails: {
                    //   "name": "Salim",
                    //   "age": "23",
                    //   "email": "selim@intigo.tn"
                    // },)));
                  },
                  title: Text("${allContacts[index]["name"]}"),
                  subtitle: Text("${allContacts[index]["job"]} ,Phone number: ${allContacts[index]["phonenumber"]}"),

                  trailing: Icon(Icons.arrow_forward_ios),
                ),
              ),
            );
          },
        ));
  }
}
