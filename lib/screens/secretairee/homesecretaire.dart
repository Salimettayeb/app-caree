import 'package:argon_flutter/screens/secretairee/DrawerSecretaire.dart';
import 'package:flutter/material.dart';

import 'package:argon_flutter/constants/Theme.dart';

//widgets
import 'package:argon_flutter/widgets/navbar.dart';
import 'package:argon_flutter/widgets/card-horizontal.dart';
import 'package:argon_flutter/widgets/card-small.dart';
import 'package:argon_flutter/widgets/card-square.dart';
import 'file:///C:/Users/salim/AndroidStudioProjects/app-care/lib/screens/doctor/drawer.dart';

final Map<String, Map<String, String>> homeCards = {

};

class SecretaireHome extends StatelessWidget {
  // final GlobalKey _scaffoldKey = new GlobalKey();
  @override
  Widget build(BuildContext context) {
    return new Scaffold(

        appBar: Navbar(
          bgColor: Colors.lightBlue[400],
          title: "Care",
          searchBar: true,
        ), // key: _scaffoldKey,
        drawer: SecretaireDrawer(currentPage: "Homesecretaire"),
        body: SingleChildScrollView(

            child: Padding(
              padding: EdgeInsets.only(right: 120, left: 24, bottom: 36),
              child: SafeArea(
                bottom: true,
                child: Column(children: [
                ]),
              ),
            )
        ));
  }
}
