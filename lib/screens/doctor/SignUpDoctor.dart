// import 'package:argon_flutter/screens/doctor/logindoctor.dart';
// import 'package:argon_flutter/services/service-doctor/AuthDoctor.dart';
// import 'package:argon_flutter/services/service-patient/AuthPatient.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:fluttertoast/fluttertoast.dart';
// class Doctor extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return new MaterialApp(
//       debugShowCheckedModeBanner: false,
//       home: new SignUpDoctor(),
//     );
//   }
// }
//
//
// class SignUpDoctor extends StatefulWidget {
//   @override
//   _SignUpDoctorState createState() => new _SignUpDoctorState();
// }
//
//
// class _SignUpDoctorState extends State<SignUpDoctor> {
//   var emailController = TextEditingController();
//   var firstNameController = TextEditingController();
//   var lastNameController = TextEditingController();
//   var passwordController = TextEditingController();
//   @override
//   void dispose() {
//     // Clean up the controller when the widget is disposed.
//     emailController.dispose();
//     passwordController.dispose();
//     super.dispose();
//   }
//
//   Widget build(BuildContext context) {
//     return new Scaffold(
//       body: Container(
//         padding: EdgeInsets.fromLTRB(1.0, 00.0, 1.0, 100.0),
//
//         decoration: BoxDecoration(
//             image: DecorationImage(
//               image: AssetImage("assets/img/bb.jpg"),
//               fit: BoxFit.cover,
//             ),
//           ),
//           child : SingleChildScrollView(
//           child: new Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: <Widget>[
//               Container(
//                 child: Stack(
//                   children: <Widget>[
//                     Container(
//                       padding: EdgeInsets.fromLTRB(20.0, 90.0, 30.0, 60.0),
//                       child: Center(
//                         child: Text(
//                           'SIGNUP',
//                           style: TextStyle(
//                               color: Colors.white,
//                               fontSize: 40.0,
//                               fontWeight: FontWeight.bold),
//                           textAlign: TextAlign.center,
//                         ),
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//               Container(
//                   padding: EdgeInsets.only(top: 25.0, left: 20.0, right: 20.0),
//                   child: Column(
//                     children: <Widget>[
//                       TextField(
//                         controller: firstNameController,
//                         decoration: InputDecoration(
//                             border: OutlineInputBorder(),
//                             labelText: 'FIRST NAME',
//                             labelStyle: TextStyle(
//                               fontFamily: 'Montserrat',
//                               fontWeight: FontWeight.bold,
//                               color: Colors.white,
//                             ),
//                             focusedBorder: UnderlineInputBorder(
//                                 borderSide: BorderSide(color: Colors.blue))),
//                       ),
//                       SizedBox(height: 15.0),
//                       TextField(
//                         controller: lastNameController,
//                         decoration: InputDecoration(
//                             border: OutlineInputBorder(),
//                             labelText: 'LAST NAME',
//                             labelStyle: TextStyle(
//                                 fontFamily: 'Montserrat',
//                                 fontWeight: FontWeight.bold,
//                                 color: Colors.white),
//                             focusedBorder: UnderlineInputBorder(
//                                 borderSide: BorderSide(color: Colors.blue))),
//                         obscureText: false,
//                       ),
//                       SizedBox(height: 13.0),
//                       TextField(
//                         controller: emailController,
//                         decoration: InputDecoration(
//                             border: OutlineInputBorder(),
//                             labelText: 'EMAIL',
//                             labelStyle: TextStyle(
//                                 fontFamily: 'Montserrat',
//                                 fontWeight: FontWeight.bold,
//                                 color: Colors.white),
//                             focusedBorder: UnderlineInputBorder(
//                                 borderSide: BorderSide(color: Colors.blue))),
//                         keyboardType: TextInputType.emailAddress,
//                       ),
//
//                       SizedBox(height: 13.0),
//                       TextField(
//                         controller: passwordController,
//                         decoration: InputDecoration(
//                             border: OutlineInputBorder(),
//                             labelText: 'PASSWORD',
//                             labelStyle: TextStyle(
//                                 fontFamily: 'Montserrat',
//                                 fontWeight: FontWeight.bold,
//                                 color: Colors.white),
//                             focusedBorder: UnderlineInputBorder(
//                                 borderSide: BorderSide(color: Colors.blue))),
//                         obscureText: true,
//                         keyboardType: TextInputType.visiblePassword,
//
//                       ),
//                       SizedBox(height: 40.0),
//                       Container(
//                         height: 50.0,
//                         child: Material(
//                           borderRadius: BorderRadius.circular(4.0),
//                           shadowColor: Colors.blueAccent,
//                           color: Colors.white,
//                           elevation: 17.0,
//                           child: GestureDetector(
//                             child: Center(
//                               child: FlatButton(
//                                 child: Text('SIGN UP') ,
//                                 onPressed: (){
//                                   if(emailController.text.isEmpty || passwordController.text.isEmpty || firstNameController.text.isEmpty || lastNameController.text.isEmpty) {
//                                     Fluttertoast.showToast(
//                                         msg: 'Email, First Name, Last Name and password should not be empty.',
//                                         toastLength: Toast.LENGTH_SHORT,
//                                         gravity: ToastGravity.BOTTOM,
//                                         timeInSecForIosWeb : 1,
//                                         backgroundColor: Colors.red,
//                                         textColor: Colors.white,
//                                         fontSize: 16.0
//                                     );
//                                   }
//                                   else {
//                                     var name = firstNameController.text + " " + lastNameController.text;
//                                     AuthDoctor().adddoctor(emailController.text,name,passwordController.text).then((val) {
//                                       if (val.data['success']) {
//                                         var token = val.data['token'];
//                                         Fluttertoast.showToast(
//                                             msg: 'Inscription Doctor avec succes',
//                                             toastLength: Toast.LENGTH_SHORT,
//                                             gravity: ToastGravity.BOTTOM,
//                                             timeInSecForIosWeb : 1,
//                                             backgroundColor: Colors.green,
//                                             textColor: Colors.white,
//                                             fontSize: 16.0
//                                         );
//
//                                       }
//                                     });
//                                   }
//                                 },
//                               ),
//
//                             ),
//                           ),
//                         ),
//                       ),
//                     ],
//                   )),
//               SizedBox(height: 10.0),
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: <Widget>[
//                   Text(
//                     'Already have an account ?',
//                     style: TextStyle(
//                         fontFamily: 'Montserrat', color: Colors.white),
//                   ),
//                   SizedBox(width: 5.0),
//                   InkWell(
//                     onTap: () {
//                       Navigator.push(context, new MaterialPageRoute(
//                           builder: (context) => new LoginDoctor())
//                       );
//                     },
//                     child: Text(
//                       'Sign In',
//                       style: TextStyle(
//                           color: Colors.white,
//                           fontFamily: 'Montserrat',
//                           fontWeight: FontWeight.bold,
//                           decoration: TextDecoration.underline),
//                     ),
//                   )
//                 ],
//               )
//             ],
//           )),
//       ),);
//   }
// }
//
//
