import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
class AddConsultation {
  Dio dio = new Dio();

  addConsultation(name,filenumber,weight,
      height,reasonofconsulatation,diagnosticresult,notes) async {
    try {
      return await dio.post(
          'https://salty-shelf-68011.herokuapp.com/consultations/addnewconsultation',
          data:{"name":name,"filenumber":filenumber,"weight":weight,
            "height":height,"resonofconsulatation":reasonofconsulatation,
            "diagnosticresult":diagnosticresult,"notes":notes},
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
