import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

 class AuthDoctor {

   Dio dio = new Dio();

   Map<String, dynamic> parseJwt(String token) {
     final parts = token.split('.');
     if (parts.length != 3) {
       throw Exception('invalid token');
     }

     final payload = _decodeBase64(parts[1]);
     final payloadMap = json.decode(payload);
     if (payloadMap is! Map<String, dynamic>) {
       throw Exception('invalid payload');
     }

     return payloadMap;
   }

   String _decodeBase64(String str) {
     String output = str.replaceAll('-', '+').replaceAll('_', '/');

     switch (output.length % 4) {
       case 0:
         break;
       case 2:
         output += '==';
         break;
       case 3:
         output += '=';
         break;
       default:
         throw Exception('Illegal base64url string!"');
     }

     return utf8.decode(base64Url.decode(output));
   }



   login(email,password) async {
// Create storage

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
