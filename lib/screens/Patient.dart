// import 'dart:ui';
// import 'package:argon_flutter/screens/home_screen_patient.dart';
// import 'file:///C:/Users/salim/AndroidStudioProjects/app-care/lib/screens/patient/question.dart';
// import 'package:flutter/material.dart';
// import 'package:argon_flutter/constants/Theme.dart';
// import 'package:flutter/cupertino.dart';
//
//
// //widgets
// import 'package:argon_flutter/widgets/navbar.dart';
// import 'package:argon_flutter/widgets/drawer.dart';
//
//
// class User extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         extendBodyBehindAppBar: true,
//         appBar: Navbar(
//
//           transparent: true,
//         ),
//         backgroundColor: ArgonColors.bgColorScreen,
//         drawer: ArgonDrawer(currentPage: "Profile"),
//         body: Stack(children: <Widget>[
//           Container(
//               decoration: BoxDecoration(
//                   image: DecorationImage(
//                       alignment: Alignment.topCenter,
//                       image: AssetImage("assets/img/bb.jpg"),
//                       fit: BoxFit.fitWidth))),
//           SafeArea(
//             child: ListView(children: [
//               SizedBox(height: 10.0),
//               Row(
//                 mainAxisAlignment:
//                 MainAxisAlignment.spaceAround,
//                 children: [
//                   Column(
//                     children: [
//                       Text("Welcome back, User!",
//                           style: TextStyle(
//                               color: Colors.white,
//
//                               fontSize: 20.0,
//                               fontWeight:
//                               FontWeight.bold
//                           )),
//                       Text("How can we help you today? ",
//                           style: TextStyle(
//                               color: Colors.white,
//                               fontSize: 12.0))
//                     ],
//                   ),
//
//                 ],
//               ),
//               Padding(
//                 padding:
//                 const EdgeInsets.only(left: 16.0, right: 16.0, top: 74.0),
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.stretch,
//                   children: [
//                     Stack(children: <Widget>[
//
//                       Container(
//                         decoration: BoxDecoration(
//                           boxShadow: [
//
//                             BoxShadow(
//                               color: Colors.grey.withOpacity(0.1),
//                               spreadRadius: 1,
//                               blurRadius: 7,
//                               offset:
//                               Offset(0, 3), // changes position of shadow
//                             ),
//                           ],
//                         ),
//                         child: Card(
//                             semanticContainer: true,
//                             clipBehavior: Clip.antiAliasWithSaveLayer,
//                             elevation: .0,
//                             shape: RoundedRectangleBorder(
//                                 borderRadius:
//                                 BorderRadius.all(Radius.circular(5.0))),
//                             child: Padding(
//                               padding: const EdgeInsets.only(
//                                   top: 300.0, bottom: 20.0),
//                               child: Row(
//                                 children: [
//                                   Expanded(
//                                     child: Column(
//                                       children: [
//
//                                         SizedBox(height: 40.0),
//
//                                         Row(
//
//                                           mainAxisAlignment:
//                                           MainAxisAlignment.center,
//                                           children: [
//
//                                             Container(
//
//                                               margin: EdgeInsets.all(25),
//                                               // ignore: deprecated_member_use
//                                               child: FlatButton(
//                                                 child: Text('Rendez-vous', style: TextStyle(fontSize: 13.0),),
//                                                 color: Colors.lightBlue,
//                                                 textColor: Colors.white,
//                                                 onPressed: () {
//                                                   Navigator.push(context, new MaterialPageRoute(
//                                                       builder: (context) => new HomeScreen())
//                                                   );
//                                                 },
//                                               ),
//                                             ),
//
//                                             // SizedBox(
//                                             //   width: 30.0,
//                                             // ),
//                                             // Container(
//                                             //   decoration: BoxDecoration(
//                                             //     color: ArgonColors.initial,
//                                             //     borderRadius:
//                                             //     BorderRadius.circular(3.0),
//                                             //     boxShadow: [
//                                             //       BoxShadow(
//                                             //         color: Colors.grey
//                                             //             .withOpacity(0.3),
//                                             //         spreadRadius: 1,
//                                             //         blurRadius: 7,
//                                             //         offset: Offset(0,
//                                             //             3), // changes position of shadow
//                                             //      ),
//                                             //     ],
//                                             //   ),
//                                             //   child: Text(
//                                             //     "Question",
//                                             //     style: TextStyle(
//                                             //         color: ArgonColors.white,
//                                             //         fontSize: 12.0,
//                                             //         fontWeight:
//                                             //         FontWeight.bold),
//                                             //   ),
//                                             //   padding: EdgeInsets.symmetric(
//                                             //       horizontal: 8.0,
//                                             //       vertical: 8.0),
//                                             // )
//
//                                             Container(
//                                               margin: EdgeInsets.all(25),
//                                               child: FlatButton(
//                                                 child: Text('Questions', style: TextStyle(fontSize: 13.0),),
//                                                 color: Colors.lightBlue,
//                                                 textColor: Colors.white,
//                                                 onPressed: () {
//                                                   Navigator.push(context, new MaterialPageRoute(
//                                                       builder: (context) => new Question())
//                                                   );
//                                                 },
//                                               ),
//                                             )],
//                                         ),
//                                       ],
//                                     ),
//                                   ),
//                                 ],
//                               ),
//                             )),
//                       ),
//                       FractionalTranslation(
//                           translation: Offset(0.0, -0.5),
//                           child: Align(
//                             child: CircleAvatar(
//                               backgroundImage: AssetImage("assets/img/profile-screen-avatar.jpg"),
//                               radius: 65.0,
//                               // maxRadius: 200.0,
//                             ),
//                             alignment: FractionalOffset(0.5, 0.0),
//                           ))
//                     ]),
//                   ],
//                 ),
//               ),
//             ]),
//           )
//         ]));
//   }
// }
//
//
//
//
//
