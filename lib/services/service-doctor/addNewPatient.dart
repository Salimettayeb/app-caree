import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
class Addfiche {
  Dio dio = new Dio();


  addfichepatient(doctorId,_gender,filenumber,firstname,lastname,
      dateofbirth,age,profession,valueChoose,
      childChosed,phonenumber,email,
      address,cityChosed ) async {
    try {
      return await dio.post(
          'https://salty-shelf-68011.herokuapp.com/fichepatient/addnewfiche',
          data: {"doctorId": doctorId,"gender":_gender,"filenumber": filenumber, "firstname": firstname, "lastname": lastname, "dateofbirth":dateofbirth,
            "age":age,"profession":profession,"valueChoose":valueChoose,"childChosed":childChosed,"phonenumber":phonenumber,
            "email":email,"address":address,"cityChosed":cityChosed},
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
