import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
 class AuthDoctor {
   Dio dio = new Dio();

   login(email,password) async {
     try {
       return await dio.post(
           'https://salty-shelf-68011.herokuapp.com/doctor/authenticateDoctor',
       data: {"email" :email,"password" :password},
         options: Options(contentType:Headers.formUrlEncodedContentType));
   }
   on DioError catch (e) {
     Fluttertoast.showToast(
     msg: e.response.data ['msg'],
     toastLength: Toast.LENGTH_SHORT,
     gravity: ToastGravity.BOTTOM,
     backgroundColor: Colors.red,
     textColor: Colors.white,
     fontSize: 16.0
     );
     }
   }

   adddoctor(email,name, password) async {
     try {
       return await dio.post(
           'https://salty-shelf-68011.herokuapp.com/doctor/adddoctor',
           data: {"email": email,"name": name, "password": password},
           options: Options(contentType: Headers.formUrlEncodedContentType));
     } on DioError catch (e) {
       Fluttertoast.showToast(
           msg: e.response.data['msg'],
           toastLength: Toast.LENGTH_SHORT,
           gravity: ToastGravity.BOTTOM,
           backgroundColor: Colors.red,
           textColor: Colors.white,
           fontSize: 16.0
       );
     }
   }
   }
