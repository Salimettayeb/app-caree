import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
class Addrendezvous {
  Dio dio = new Dio();

  static final Addrendezvous _instance = Addrendezvous._internal();
  factory Addrendezvous() => _instance;
  Addrendezvous._internal() {
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

  addrdv(doctorId,userId,date,time,contact) async {
    try {
      return await dio.post(
          'https://salty-shelf-68011.herokuapp.com/rendezvous/addnewrendezvous',
          data: {"doctorId":doctorId,"userId":userId,"date":date,"time":time,"contact":contact},
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
