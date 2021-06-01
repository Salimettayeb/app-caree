import 'package:flutter/material.dart';

import 'package:argon_flutter/constants/Theme.dart';

//widgets
import 'package:argon_flutter/widgets/navbar.dart';

import 'drawer.dart';


class Cabex extends StatefulWidget {
  @override
  _CabexState createState() => _CabexState();
}

class _CabexState extends State<Cabex> {
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


          title: "Cabinet expenses",
        ),
        backgroundColor: ArgonColors.bgColorScreen,
        drawer: ArgonDrawer(currentPage: "Cabex"),
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
                        onPressed: () {
                          // Respond to button press
                          Navigator.pushReplacementNamed(context, '/finance');
                        },
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(4.0),
                        ),
                        child: Padding(
                            padding: EdgeInsets.only(
                                left: 16.0, right: 16.0, top: 12, bottom: 12),
                            child: Text("Add  ",
                                style: TextStyle(
                                    fontWeight: FontWeight.w600, fontSize: 16.0))),
                      ),
                    ),

                  )]),
              ),
            )));
  }
}

