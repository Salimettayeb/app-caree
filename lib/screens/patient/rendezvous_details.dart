import 'package:flutter/material.dart';
import 'package:argon_flutter/services/service-doctor/AuthDoctor.dart';

class RendezvousDetailsScreen extends StatefulWidget {
  final Map rendezvoussDetails;
  RendezvousDetailsScreen({this.rendezvoussDetails});
  @override
  _RendezvousDetailsScreenState createState() => _RendezvousDetailsScreenState();
}

class _RendezvousDetailsScreenState extends State<RendezvousDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Rendez Vous"),
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
                  Text("${widget.rendezvoussDetails["date"]}"),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(12, 12, 12, 10),
              child: Row(
                children: [
                  Text("Time :"),
                  Text("${widget.rendezvoussDetails["time"]}"),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(12, 12, 12, 10),
              child: Row(
                children: [
                  Text("Contact :"),
                  Text("${widget.rendezvoussDetails["contact"]}"),
                ],
              ),
            ),
            SizedBox(height: 10,),
            Row(
              children: [
                Expanded(
                  flex: 5,
                  child:ButtonTheme(
                    height: 50,
                    child:  RaisedButton.icon(
                      onPressed: (){},
                      color: Colors.green,
                      icon: Icon(Icons.check),
                      label: Text("Accept"),
                    ),
                  )
                ),
                SizedBox(width: 10,),
                Expanded(
                  flex: 5,
                  child:ButtonTheme(
                    height: 50,
                    child:  RaisedButton.icon(
                      onPressed: (){},
                      color: Colors.red,
                      icon: Icon(Icons.cancel_outlined),
                      label: Text("Decline"),
                    ),
                  )
                )

              ],
            )
          ],
        ),
      ),
    );
  }
}
