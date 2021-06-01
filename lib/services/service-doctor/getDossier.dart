import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'dart:convert';

final storage = new FlutterSecureStorage();

class GetDossier {
  Dio dio = new Dio();
  static final GetDossier _instance = GetDossier._internal();
  factory GetDossier() => _instance;
  GetDossier._internal() {
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

  getAllDossier() async {
    try {
      String token = await storage.read(key: "token");
      dio.options.headers['content-Type'] = 'application/json';
      dio.options.headers["Authorization"] = "Bearer $token";
      return await dio.get(
          'https://salty-shelf-68011.herokuapp.com/medicalfolder/getinfomedicalfolder');
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
