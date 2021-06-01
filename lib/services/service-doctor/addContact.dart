import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
class AddContact {
  Dio dio = new Dio();

  static final AddContact _instance = AddContact._internal();
  factory AddContact() => _instance;
  AddContact._internal() {
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

  addcontact(doctorId,name,job,phonenumber,email,address) async {
    try {
      return await dio.post(
          'https://salty-shelf-68011.herokuapp.com/contact/addnewcontact',
          data: {"doctorId":doctorId,"name":name,"job":job,"phonenumber":phonenumber,"email":email,"address":address},
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
