import 'package:flutter/material.dart';
import 'package:argon_flutter/services/service-doctor/AuthDoctor.dart';

class ConsultationsDetailsScreen extends StatefulWidget {
  final Map consultationsDetails;
  ConsultationsDetailsScreen({this.consultationsDetails});
  @override
  _ConsultationsDetailsScreenState createState() => _ConsultationsDetailsScreenState();
}

class _ConsultationsDetailsScreenState extends State<ConsultationsDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("${widget.consultationsDetails["name"]}"),
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
                  Text("Date :"),
                  Text("${widget.consultationsDetails["date"]}"),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(12, 12, 12, 10),
              child: Row(
                children: [
                  Text("Time :"),
                  Text("${widget.consultationsDetails["time"]}"),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(12, 12, 12, 10),
              child: Row(
                children: [
                  Text("Name :"),
                  Text("${widget.consultationsDetails["name"]}"),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(12, 12, 12, 10),
              child: Row(
                children: [
                  Text("File number :"),
                  Text("${widget.consultationsDetails["filenumber"]}"),
                ],
              ),
            ),

            Padding(
              padding: EdgeInsets.fromLTRB(12, 12, 12, 10),
              child: Row(
                children: [
                  Text("Weight :"),
                  Text("${widget.consultationsDetails["weight"]}"),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(12, 12, 12, 10),
              child: Row(
                children: [
                  Text("Height :"),
                  Text("${widget.consultationsDetails["height"]}"),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(12, 12, 12, 10),
              child: Row(
                children: [
                  Text("Reason of consultation :"),
                  Text("${widget.consultationsDetails["reasonofconsultation"]}"),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(12, 12, 12, 10),
              child: Row(
                children: [
                  Text("Diagnostic result :"),
                  Text("${widget.consultationsDetails["diagnosticresult"]}"),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(12, 12, 12, 10),
              child: Row(
                children: [
                  Text("Notes :"),
                  Text("${widget.consultationsDetails["notes"]}"),
                ],
              ),
            ),

          ],
        ),
      ),
    );
  }
}
