import 'package:flutter/material.dart';
import 'package:argon_flutter/services/service-doctor/AuthDoctor.dart';

class DailyrecipDetailsScreen extends StatefulWidget {
  final Map dailyrecipsDetails;
  DailyrecipDetailsScreen({this.dailyrecipsDetails});
  @override
  _DailyrecipDetailsScreenState createState() => _DailyrecipDetailsScreenState();
}

class _DailyrecipDetailsScreenState extends State<DailyrecipDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("${widget.dailyrecipsDetails["title"]}"),
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
                  Text("Title :"),
                  Text("${widget.dailyrecipsDetails["title"]}"),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(12, 12, 12, 10),
              child: Row(
                children: [
                  Text("Amount :"),
                  Text("${widget.dailyrecipsDetails["amount"]}"),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
