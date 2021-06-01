import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
class AddMedfolder {
  Dio dio = new Dio();

  static final AddMedfolder _instance = AddMedfolder._internal();
  factory AddMedfolder() => _instance;
  AddMedfolder._internal() {
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
  addmedfolder(doctorId,name,filenumber,personnalantecedents,familyantecedent,riskfactors,notes) async {
    try {
      return await dio.post(
          'https://salty-shelf-68011.herokuapp.com/medicalfolder/addnewmedfolder',
          data: {"doctorId":doctorId,"name":name,"filenumber":filenumber,"personnalantecedents":personnalantecedents,"familyantecedent":familyantecedent,"riskfactors":riskfactors,"notes":notes},
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
