// import 'package:argon_flutter/constant.dart';
// import 'package:argon_flutter/screens/home_screen_patient.dart';
// import 'package:flutter/material.dart';
//
// class OnboardingScreen extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: kBackgroundColor,
//       body: SafeArea(
//         bottom: false,
//         child: Stack(
//           children: <Widget>[
//             Align(
//               alignment: Alignment.bottomCenter,
//               child: Image.asset(
//                 'assets/images/onboard-background.png',
//                 width: MediaQuery.of(context).size.width,
//                 fit: BoxFit.fitWidth,
//               ),
//             ),
//             Positioned(
//               top: MediaQuery.of(context).size.height / 6,
//               child: Padding(
//                 padding: EdgeInsets.symmetric(
//                   horizontal: MediaQuery.of(context).size.width / 8,
//                 ),
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: <Widget>[
//                     Text(
//                       'Choose The Doctor\nYou Want',
//                       style: TextStyle(
//                         fontWeight: FontWeight.bold,
//                         fontSize: 32,
//                         color: Colors.white ,
//                       ),
//                     ),
//                     SizedBox(
//                       height: 20,
//                     ),
//                     Text(
//                       'Lorem ipsum dolor amet, consectetur\nadipiscing inet deli',
//                       style: TextStyle(
//                         fontSize: 16,
//                         color: Colors.white,
//                       ),
//                     ),
//                     SizedBox(
//                       height: 20,
//                     ),
//                     MaterialButton(
//                       onPressed: () {
//                         Navigator.push(
//                           context,
//                           MaterialPageRoute(
//                             builder: (context) => HomeScreen(),
//                           ),
//                         );
//                       },
//                       color: kOrangeColor,
//                       padding: EdgeInsets.symmetric(
//                         horizontal:110,
//                       ),
//                       shape: RoundedRectangleBorder(
//                         borderRadius: BorderRadius.circular(20),
//                       ),
//                       child: Text(
//                         'Get Started',
//                         style: TextStyle(
//                           color: kWhiteColor,
//                           fontSize: 16,
//                         ),
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
