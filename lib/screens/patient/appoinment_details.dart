import 'package:flutter/material.dart';
import 'package:argon_flutter/services/service-doctor/AuthDoctor.dart';

class AppoinmentsDetailsScreen extends StatefulWidget {
  final Map appoinmentsDetails;
  AppoinmentsDetailsScreen({this.appoinmentsDetails});
  @override
  _AppoinmentsDetailsScreenState createState() => _AppoinmentsDetailsScreenState();
}

class _AppoinmentsDetailsScreenState extends State<AppoinmentsDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("${widget.appoinmentsDetails["name"]}"),
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
                  Text("Name :"),
                  Text("${widget.appoinmentsDetails["name"]}"),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(12, 12, 12, 10),
              child: Row(
                children: [
                  Text("Phone Number :"),
                  Text("${widget.appoinmentsDetails["phonenumber"]}"),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(12, 12, 12, 10),
              child: Row(
                children: [
                  Text("Email :"),
                  Text("${widget.appoinmentsDetails["email"]}"),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(12, 12, 12, 10),
              child: Row(
                children: [
                  Text("Date :"),
                  Text("${widget.appoinmentsDetails["date"]}"),
                ],
              ),
            ),

            Padding(
              padding: EdgeInsets.fromLTRB(12, 12, 12, 10),
              child: Row(
                children: [
                  Text("Time :"),
                  Text("${widget.appoinmentsDetails["time"]}"),
                ],
              ),
            ),
            SizedBox(height: 10,),
            Row(
              children: [
                Expanded(
                    child:ButtonTheme(
                      height: 50,
                      child:  RaisedButton.icon(
                        onPressed: (){
                        },
                        color: Colors.lightBlue,
                        icon: Icon(Icons.circle_notifications),
                        label: Text("Remind"),
                      ),
                    )
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
