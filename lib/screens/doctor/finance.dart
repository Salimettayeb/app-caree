import 'package:argon_flutter/consultation_list_event_bus.dart';
import 'package:argon_flutter/screens/doctor/todayexp.dart';
import 'package:argon_flutter/screens/patient/rendezvous_details.dart';
import 'package:flutter/material.dart';

import 'package:argon_flutter/constants/Theme.dart';

//widgets
import 'package:argon_flutter/widgets/navbar.dart';

import 'cabineexp.dart';
import 'drawer.dart';


class Fin extends StatefulWidget {
  @override
  _FinState createState() => _FinState();
}

class _FinState extends State<Fin> {
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
          title: "Financial accounting",


        ),
        backgroundColor: ArgonColors.bgColorScreen,
        drawer: ArgonDrawer(currentPage: "Fin"),
        body: ListView(
          children: <Widget>[
            SizedBox(height: 5,),
            Row(
              children: [
                Expanded(
                    flex: 5,
                    child:ButtonTheme(
                      height: 50,
                      child:  RaisedButton(
                        onPressed: (){
                          Navigator.pushNamed(context, '/dailyrecip').then((value){
                            if(value == true){
                              print("hey hani rja3et");
                              // call get api
                            }
                          });
                        },
                        color: Colors.lightBlueAccent,
                        child: Text("Daily recip",style: TextStyle(color: Colors.white)),
                      ),
                    )
                ),
                SizedBox(width: 10,),
                Expanded(
                    flex: 5,
                    child:ButtonTheme(
                      height: 50,
                      child:  RaisedButton(
                        onPressed: (){
                          Navigator.push(context, new MaterialPageRoute(
                              builder: (context) => new Cabex()));
                        },
                        color: Colors.lightBlueAccent,
                        child: Text("Exp",style: TextStyle(color: Colors.white),),
                      ),
                    )
                )

              ],
            ),
            SizedBox(height: 30.0),

            Container(
             width: 100,
               height: 130,
              child :Column(
              children: [
                 Card(
                   margin: EdgeInsets.fromLTRB(40.0, 10.0, 40.0, 10.0),

                   color: Colors.lightBlueAccent ,
                  child: InkWell(
                    splashColor: Colors.blue.withAlpha(30),
                    onTap: () {
                      Navigator.push(context, new MaterialPageRoute(
                          builder: (context) => new Todayexp()));                    },
                    child: const SizedBox(
                      width: 300,
                      height: 100,
                      child:  Text('Today Expenses',
                          textAlign: TextAlign.center,

                          style: TextStyle(
                            fontSize: 18.0,
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          )
                    ),
                  ),
                ),

                 )
              ],
            )),
            SizedBox(height: 30.0),

            Container(
                width: 100,
                height: 130,
                child :Column(
                  children: [
                    Card(
                      margin: EdgeInsets.fromLTRB(40.0, 10.0, 40.0, 10.0),

                      color: Colors.lightBlueAccent ,
                      child: InkWell(
                        splashColor: Colors.blue.withAlpha(30),
                        onTap: () {
                          print('Card tapped.');
                        },
                        child: const SizedBox(
                          width: 300,
                          height: 100,
                          child:  Text('Today Incomes',
                              textAlign: TextAlign.center,

                              style: TextStyle(
                                fontSize: 18.0,
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                              )
                          ),
                        ),
                      ),

                    )
                  ],
                )),
            SizedBox(height: 30.0),

            Container(
                width: 100,
                height: 130,
                child :Column(
                  children: [
                    Card(
                      margin: EdgeInsets.fromLTRB(40.0, 10.0, 40.0, 10.0),

                      color: Colors.lightBlueAccent ,
                      child: InkWell(
                        splashColor: Colors.blue.withAlpha(30),
                        onTap: () {
                          print('Card tapped.');
                        },
                        child: const SizedBox(
                          width: 300,
                          height: 100,
                          child:  Text('Today Balance',
                              textAlign: TextAlign.center,

                              style: TextStyle(
                                fontSize: 18.0,
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                              )
                          ),
                        ),
                      ),

                    )
                  ],
                )),

          ],
        )

    );
  }
}
