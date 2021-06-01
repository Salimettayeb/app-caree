import 'package:flutter/material.dart';
import 'package:argon_flutter/services/service-doctor/AuthDoctor.dart';

class PatientDetailsScreen extends StatefulWidget {
  final Map patientDetails;
  PatientDetailsScreen({this.patientDetails});
  @override
  _PatientDetailsScreenState createState() => _PatientDetailsScreenState();
}

class _PatientDetailsScreenState extends State<PatientDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("${widget.patientDetails["firstname"]} ${widget.patientDetails["lastname"]}"),
        centerTitle: true,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.fromLTRB(12, 12, 12, 10),
              child: Row(
                children: [
                  Text("Gender :"),
                  Text("${widget.patientDetails["gender"]}"),
                ],
              ),
            ),
          Padding(
            padding: EdgeInsets.fromLTRB(12, 12, 12, 10),
            child: Row(
              children: [
                Text("Filenumber :"),
                Text("${widget.patientDetails["filenumber"]}"),
              ],
            ),
          ),
            Padding(
              padding: EdgeInsets.fromLTRB(12, 12, 12, 10),
              child: Row(
                children: [
                  Text("First name :"),
                  Text("${widget.patientDetails["firstname"]}"),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(12, 12, 12, 10),
              child: Row(
                children: [
                  Text("Last name :"),
                  Text("${widget.patientDetails["lastname"]}"),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(12, 12, 12, 10),
              child: Row(
                children: [
                  Text("Date of birth :"),
                  Text("${widget.patientDetails["dateofbirth"]}"),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(12, 12, 12, 10),
              child: Row(
                children: [
                  Text("Age :"),
                  Text("${widget.patientDetails["age"]}"),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(12, 12, 12, 10),
              child: Row(
                children: [
                  Text("Profession :"),
                  Text("${widget.patientDetails["profession"]}"),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(12, 12, 12, 10),
              child: Row(
                children: [
                  Text("Status :"),
                  Text("${widget.patientDetails["valueChoose"]}"),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(12, 12, 12, 10),
              child: Row(
                children: [
                  Text("Number of children :"),
                  Text("${widget.patientDetails["childChosed"]}"),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(12, 12, 12, 10),
              child: Row(
                children: [
                  Text("Phone number :"),
                  Text("${widget.patientDetails["phonenumber"]}"),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(12, 12, 12, 10),
              child: Row(
                children: [
                  Text("Email :"),
                  Text("${widget.patientDetails["email"]}"),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(12, 12, 12, 10),
              child: Row(
                children: [
                  Text("Address :"),
                  Text("${widget.patientDetails["address"]}"),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(12, 12, 12, 10),
              child: Row(
                children: [
                  Text("City :"),
                  Text("${widget.patientDetails["cityChosed"]}"),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
