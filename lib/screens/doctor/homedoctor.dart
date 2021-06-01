import 'package:argon_flutter/screens/patient/rendezvous_details.dart';
import 'package:argon_flutter/services/service-doctor/getRDV.dart';
import 'package:flutter/material.dart';

import 'package:argon_flutter/constants/Theme.dart';

//widgets
import 'package:argon_flutter/widgets/navbar.dart';
import 'package:argon_flutter/widgets/card-horizontal.dart';
import 'package:argon_flutter/widgets/card-small.dart';
import 'package:argon_flutter/widgets/card-square.dart';

import 'drawer.dart';

class Doctorhome extends StatefulWidget {


  @override
  _DoctorhomeState createState() => _DoctorhomeState();
}

class _DoctorhomeState extends State<Doctorhome> {
  bool switchValueOne;
  bool switchValueTwo;
  List allRdvs = [];
  bool loading = false;
  void initState() {
    setState(() {
      switchValueOne = true;
      switchValueTwo = false;
    });
    getRdv();
    super.initState();
  }

  getRdv() async{
    setState(() {
      loading = true;
    });
    GetRDV().getRdv().then((val) {
      if (val.data['success']) {
        List rdvs=val.data["rendezvouss"] ;
        print(rdvs);
        Future.delayed(Duration(seconds: 2)).then((value) => setState(() {
          loading = false;
          allRdvs = val.data["rendezvouss"];
        }));
      }
    }
    );
  }

  // final GlobalKey _scaffoldKey = new GlobalKey();
  @override
  Widget build(BuildContext context) {
    return new Scaffold(

        appBar: Navbar(
          bgColor: Colors.lightBlue[400],
          title: "Care",
          searchBar: true,
        ), // key: _scaffoldKey,
        drawer: ArgonDrawer(currentPage: "Homedoctor"),
        body:loading?
        Center(
          child: CircularProgressIndicator(),
        )
            :ListView.builder(
          itemCount: allRdvs.length,
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
                    Navigator.push(context, MaterialPageRoute(builder: (context) => RendezvousDetailsScreen(rendezvoussDetails:allRdvs[index],)));

                  },
                  title: Text("${allRdvs[index]["date"]}"),
                  subtitle: Text("${allRdvs[index]["contact"]}"),
                  trailing: Icon(Icons.arrow_forward_ios),
                ),
              ),
            );
          },
        ));
  }
}



