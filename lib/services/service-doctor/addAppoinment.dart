import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
class AddAppoinment {
  Dio dio = new Dio();

  static final AddAppoinment _instance = AddAppoinment._internal();
  factory AddAppoinment() => _instance;
  AddAppoinment._internal() {
    dio = Dio(BaseOptions(
        connectTimeout: 150000, receiveTimeout: 10000));
    initializeInterceptor();
  }
  void initializeInterceptor() {
    dio.interceptors.add(
      PrettyDioLogger(
          requestHeader: true,
          requestBody: true,
          responseBody: true,
          responseHeader: false,
          error: true,
          compact: true,
          maxWidth: 90),
    );}

  addappoin(name,phonenumber,email,date,time) async {
    try {
      return await dio.post(
          'https://salty-shelf-68011.herokuapp.com/appoinment/addnewappoinment',
          data: {"name":name,"phonenumber":phonenumber,"email":email,"date":date,"time":time},
          options: Options(contentType: Headers.formUrlEncodedContentType));
    } on DioError catch (e) {
      print(e.response.data);
      Fluttertoast.showToast(
          msg:e.response.data['msg'],
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 16.0
      );
    }
  }
}
