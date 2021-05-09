import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
class AuthPatient {
  Dio dio = new Dio();

  login(email,password) async {
    try {
      print('weslet donnee l login');
      var re = await dio.post(
          'https://salty-shelf-68011.herokuapp.com/authenticate',
          data: {"email" :email,"password" :password},
          options: Options(contentType:Headers.formUrlEncodedContentType));
      print(re);
      return re;
    }
    on DioError catch (e) {
      print(e);
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

  addpatient(email,name, password) async {
    try {
      return await dio.post(
          'https://salty-shelf-68011.herokuapp.com/addUser',
          data:{"email": email,"name": name, "password": password},
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
