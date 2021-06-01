import 'package:argon_flutter/screens/doctor/SignUpDoctor.dart';
import 'package:dio/dio.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'dart:ui';
import 'package:argon_flutter/services/service-doctor/AuthDoctor.dart';
import 'homedoctor.dart';

import 'package:flutter_secure_storage/flutter_secure_storage.dart';
final storage = new FlutterSecureStorage();

class DoctorLogin extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(

      debugShowCheckedModeBanner: false,

      home: new LoginDoctor(

      ),
    );
  }
}

class LoginDoctor extends StatefulWidget {
  @override
  _LoginDoctorState createState() => new _LoginDoctorState();
}

class _LoginDoctorState extends State<LoginDoctor> {
  get password => null;
  get email => null;
  set onChanged(onChanged) {}

  var emailController = TextEditingController();
  var passwordController = TextEditingController();


  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }



  @override
  Widget build(BuildContext context) {
    return new Scaffold(

        body : Container(
            padding: EdgeInsets.fromLTRB(1.0, 00.0, 1.0, 104.0),

            decoration: BoxDecoration(
              image: DecorationImage(

                image: AssetImage("assets/img/bb.jpg"),

                fit: BoxFit.cover,
              ),
            ),
          child: SingleChildScrollView(

            child: new Column(

              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Container(

                  child: Stack(
                    children: <Widget>[


                      Container(
                        padding: EdgeInsets.fromLTRB(16.0, 175.0, 60.0, 0.0),
                        child: Center(
                          child: Text('LOGIN',

                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 40.0, fontWeight: FontWeight.bold),
                            textAlign: TextAlign.center ,),

                        ),
                      ),
                    ],
                  ),
                ),
                Container(

                    padding: EdgeInsets.only(top: 35.0, left: 20.0, right: 20.0),
                    child: Column(

                      children: <Widget>[

                        TextField(
                          controller: emailController,
                          decoration: InputDecoration(
                              border: OutlineInputBorder(),
                              labelText: 'EMAIL',

                              labelStyle: TextStyle(
                                fontFamily: 'Montserrat',
                                fontWeight: FontWeight.bold,
                                color: Colors.white,

                              ),
                              focusedBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(color: Colors.blue)
                              )
                          ),
                          keyboardType: TextInputType.emailAddress,

                        ),
                        SizedBox(height: 30.0),
                        TextField(
                          controller: passwordController,
                          decoration: InputDecoration(
                              border: OutlineInputBorder(),
                              labelText: 'PASSWORD',
                              labelStyle: TextStyle(
                                  fontFamily: 'Montserrat',
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white),
                              focusedBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(color: Colors.blue))),
                          keyboardType: TextInputType.visiblePassword,
                          obscureText: true,

                        ),
                        SizedBox(height: 1.0),
                        Container(
                          alignment: Alignment(1.0, 0.0),
                          padding: EdgeInsets.only(top: 15.0, left: 20.0),
                          child: InkWell(
                            child: Text(
                              'Forgot Password',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontFamily: 'Montserrat',
                                  decoration: TextDecoration.underline),
                            ),
                          ),
                        ),
                        SizedBox(height: 40.0),

                        Container(

                          height: 50.0,
                          child: Material(
                            borderRadius: BorderRadius.circular(4.0),
                            shadowColor: Colors.blueAccent,
                            color: Colors.white,
                            elevation: 17.0,
                            child: GestureDetector(

                              child: Center(
                                child: FlatButton(
                                  child: Text('LOGIN') ,
                                  onPressed: (){
                                print(emailController.text);
                                print(passwordController.text);
                                if(emailController.text.isEmpty || passwordController.text.isEmpty) {
                                Fluttertoast.showToast(
                                msg: 'Email and password should not be empty.',
                                toastLength: Toast.LENGTH_SHORT,
                                gravity: ToastGravity.BOTTOM,
                                timeInSecForIosWeb : 1,
                                backgroundColor: Colors.red,
                                textColor: Colors.white,
                                fontSize: 16.0
                                );
                                }
                                else {
                                AuthDoctor().login(emailController.text, passwordController.text).then((val) async {
                                if (val.data['success']) {
                                var token = val.data['token'];
                                await storage.write(key: "token", value: token);
                                Navigator.push(context, new MaterialPageRoute(
                                builder: (context) => new Doctorhome()));
                                }
                                });
                                }
                                }
                                  ,
                                ),

                              ),
                            ),
                          ),
                        ),

                      ],
                    )),
                SizedBox(height: 23.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      'New to Care ?',
                      style: TextStyle(fontFamily: 'Montserrat',
                          color: Colors.white),
                    ),
                    SizedBox(width: 5.0),
                    InkWell(
                      child: Text(
                        'Sign up here',
                        style: TextStyle(
                            color: Colors.white,
                            fontFamily: 'Montserrat',
                            fontWeight: FontWeight.bold,
                            decoration: TextDecoration.underline),
                      ),
                      // onTap: ()  {
                      //   Navigator.push(context, new MaterialPageRoute(
                      //       builder: (context) => new SignUpDoctor())
                      //   );
                      // },
                    )
                  ],
                )
              ],
            ))),);

  }
}
