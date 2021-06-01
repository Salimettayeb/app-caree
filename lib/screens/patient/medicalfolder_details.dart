import 'package:flutter/material.dart';
import 'package:argon_flutter/services/service-doctor/AuthDoctor.dart';

class MedicalFoldersScreen extends StatefulWidget {
  final Map medicalFolders;
  MedicalFoldersScreen({this.medicalFolders});
  @override
  _MedicalFoldersScreenState createState() => _MedicalFoldersScreenState();
}

class _MedicalFoldersScreenState extends State<MedicalFoldersScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("${widget.medicalFolders["name"]}"),
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
                  Text("${widget.medicalFolders["name"]}"),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(12, 12, 12, 10),
              child: Row(
                children: [
                  Text("Filenumber :"),
                  Text("${widget.medicalFolders["filenumber"]}"),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(12, 12, 12, 10),
              child: Row(
                children: [
                  Text("Personnal antecedents :"),
                  Text("${widget.medicalFolders["personnalantecedents"]}"),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(12, 12, 12, 10),
              child: Row(
                children: [
                  Text("Family antecedent :"),
                  Text("${widget.medicalFolders["familyantecedent"]}"),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(12, 12, 12, 10),
              child: Row(
                children: [
                  Text("Risk factors :"),
                  Text("${widget.medicalFolders["riskfactors"]}"),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(12, 12, 12, 10),
              child: Row(
                children: [
                  Text("Notes :"),
                  Text("${widget.medicalFolders["notes"]}"),
                ],
              ),
            ),

          ],
        ),
      ),
    );
  }
}
