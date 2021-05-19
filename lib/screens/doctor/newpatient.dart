import 'package:argon_flutter/constants/Theme.dart';
import 'package:argon_flutter/screens/doctor/drawer.dart';
import 'package:argon_flutter/services/service-doctor/addNewPatient.dart';
import 'package:argon_flutter/widgets/navbar.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';


class NewPatient extends StatefulWidget {

  @override

  _NewPatientState createState() => _NewPatientState();
}
enum SingingCharacter {Female, Male}
class _NewPatientState extends State<NewPatient> {
  var filenumberController = TextEditingController();
  var emailController = TextEditingController();
  var firstNameController = TextEditingController();
  var lastNameController = TextEditingController();
  var dateOfBirthController = TextEditingController();
  var ageController = TextEditingController();
  var professionController = TextEditingController();
  var phonenumberController = TextEditingController();
  var addressController = TextEditingController();



  String valueChoose = "Single";
  String childChosed = "0";
  String cityChosed = "Tunis";

  // ignore: non_constant_identifier_names
  List ListItem = [
    "Tunis",
    "La Manouba",
    "Ariana",
    "Ben Arous",
    "Le Kef",
    "Bizerte",
    "Gabes",
    "Tozeur",
    "Sousse",
    "Médenine",
    "Tataouine",
    "Gafsa",
    "Jendouba",
    "Kairouan",
    "Béja",
    "Mahdia",
    "Kasserine",
    "Kébili",
    "Monastir",
    "Nabeul",
    "Sfax",
    "Sidi bouzid",
    "Siliana",
    "Zaghouan"
  ];
  // ignore: non_constant_identifier_names
  List Marital = [
    "Single", "Married", "Divorced",
  ];
  // ignore: non_constant_identifier_names
  List Child = [
    "0", "1", "2", "3", "4", "5", "6", "7", "8", "9", "10"];
  SingingCharacter _gender = SingingCharacter.Female;
  @override
  Widget build(BuildContext context) {
      return Scaffold(
          appBar: Navbar(
            backButton: true,
            bgColor: Colors.lightBlue[400],

            title: ('New patient'),
          ),
          backgroundColor: ArgonColors.bgColorScreen,
          drawer: ArgonDrawer(currentPage: "Newpat"),
          body: SingleChildScrollView(
              child: Padding(
                  padding: EdgeInsets.only(right: 24, left: 24, bottom: 36),
                  child: SafeArea(
                    bottom: true,
                    child: Column(children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 8.0, top: 40),
                        child: Align(
                          alignment: Alignment.centerLeft,
                          child: Text("Gender",
                              style: TextStyle(
                                  color: ArgonColors.text,
                                  fontWeight: FontWeight.w600,
                                  fontSize: 16)),
                        ),
                      ),

                      Padding(
                        padding: const EdgeInsets.only(left: 8.0, top: 10),
                        child: Column(
                          children: <Widget>[
                            ListTile(
                              title: const Text('Female'),
                              leading: Radio<SingingCharacter>(
                                value: SingingCharacter.Female,
                                groupValue: _gender,
                                onChanged: (SingingCharacter value) {
                                  setState(() {
                                    _gender = value;
                                  });
                                },
                              ),
                            ),
                            ListTile(
                              title: const Text('Male'),
                              leading: Radio<SingingCharacter>(
                                value: SingingCharacter.Male,
                                groupValue: _gender,
                                onChanged: (SingingCharacter value) {
                                  setState(() {
                                    _gender = value;
                                  });
                                },
                              ),
                            ),
                          ],

                        ),
                      ),


                      Padding(
                        padding: const EdgeInsets.only(left: 8.0, top: 40),
                        child: Align(
                          alignment: Alignment.centerLeft,
                          child: Text("File number",
                              style: TextStyle(
                                  color: ArgonColors.text,
                                  fontWeight: FontWeight.w600,
                                  fontSize: 16)),
                        ),
                      ),
                      TextFormField(
                          controller : filenumberController,
                        decoration: const InputDecoration(
                            labelText: 'File number',
                            hintText: 'Enter the file number',
                            border: OutlineInputBorder()),
                        validator: (value) {
                          if (value.isEmpty) {
                            return 'Veuillez saisir un texte';
                          }
                          return null;
                        },
                      ),


                      Padding(
                        padding: const EdgeInsets.only(left: 8.0, top: 40),
                        child: Align(
                          alignment: Alignment.centerLeft,
                          child: Text("First name",
                              style: TextStyle(
                                  color: ArgonColors.text,
                                  fontWeight: FontWeight.w600,
                                  fontSize: 16)),
                        ),
                      ),
                      TextFormField(
                      controller: firstNameController,
                        decoration: const InputDecoration(
                            labelText: 'First name',
                            hintText: 'Enter the patient name',
                            border: OutlineInputBorder()),
                        validator: (value) {
                          if (value.isEmpty) {
                            return 'Veuillez saisir un texte';
                          }
                          return null;
                        },
                      ),


                      Padding(
                        padding: const EdgeInsets.only(left: 8.0, top: 40),
                        child: Align(
                          alignment: Alignment.centerLeft,
                          child: Text("Last name",
                              style: TextStyle(
                                  color: ArgonColors.text,
                                  fontWeight: FontWeight.w600,
                                  fontSize: 16)),
                        ),
                      ),
                      TextFormField(
                          controller: lastNameController,
                        decoration: const InputDecoration(
                            labelText: 'Last name',
                            hintText: 'Enter the patient First name',
                            border: OutlineInputBorder()),
                        validator: (value) {
                          if (value.isEmpty) {
                            return 'Veuillez saisir un texte';
                          }
                          return null;
                        },
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 8.0, top: 40),
                        child: Align(
                          alignment: Alignment.centerLeft,
                          child: Text("Date of birth",
                              style: TextStyle(
                                  color: ArgonColors.text,
                                  fontWeight: FontWeight.w600,
                                  fontSize: 16)),
                        ),
                      ),
                      TextFormField(
                        controller: dateOfBirthController,
                        decoration: const InputDecoration(
                            labelText: 'datefbirth',
                            hintText: 'Enter the patient First name',
                            border: OutlineInputBorder()),
                        validator: (value) {
                          if (value.isEmpty) {
                            return 'Veuillez saisir un texte';
                          }
                          return null;
                        },
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 8.0, top: 40),
                        child: Align(
                          alignment: Alignment.centerLeft,
                          child: Text("Age",
                              style: TextStyle(
                                  color: ArgonColors.text,
                                  fontWeight: FontWeight.w600,
                                  fontSize: 16)),
                        ),
                      ),
                      TextFormField(
                          controller: ageController,
                        decoration: const InputDecoration(
                            labelText: 'Age',
                            hintText: 'Age',
                            border: OutlineInputBorder()),
                        validator: (value) {
                          if (value.isEmpty) {
                            return 'Veuillez saisir un texte';
                          }
                          return null;
                        },
                      ),


                      Padding(
                        padding: const EdgeInsets.only(left: 8.0, top: 40),
                        child: Align(
                          alignment: Alignment.centerLeft,
                          child: Text("Profession/schooling",
                              style: TextStyle(
                                  color: ArgonColors.text,
                                  fontWeight: FontWeight.w600,
                                  fontSize: 16)),
                        ),
                      ),
                      TextFormField(
                        controller: professionController,
                        decoration: const InputDecoration(
                            labelText: 'Profession/schooling',
                            hintText: 'Enter the profession or the schooling',
                            border: OutlineInputBorder()),
                        validator: (value) {
                          if (value.isEmpty) {
                            return 'Veuillez saisir un texte';
                          }
                          return null;
                        },
                      ),

                      Padding(
                        padding: const EdgeInsets.only(left: 8.0, top: 40),
                        child: Align(
                          alignment: Alignment.centerLeft,
                          child: Text("Marital status",
                              style: TextStyle(
                                  color: ArgonColors.text,
                                  fontWeight: FontWeight.w600,
                                  fontSize: 16)),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 8.0, top: 10),
                        child: DropdownButton(
                          hint: Text("Select the state"),
                          dropdownColor: Colors.white,
                          icon: Icon(Icons.arrow_drop_down),
                          iconSize: 36,
                          isExpanded: true,
                          style: TextStyle(color: Colors.black
                          ),
                          value: valueChoose,
                          onChanged: (newValue) {
                            setState(() {
                              valueChoose = newValue;
                            });
                          },
                          items: Marital.map((valueItem) {
                            return DropdownMenuItem(value: valueItem,
                              child: Text(valueItem),
                            );
                          }).toList(),

                        ),
                      ),


                      Padding(
                        padding: const EdgeInsets.only(left: 8.0, top: 40),
                        child: Align(
                          alignment: Alignment.centerLeft,
                          child: Text("Number of children",
                              style: TextStyle(
                                  color: ArgonColors.text,
                                  fontWeight: FontWeight.w600,
                                  fontSize: 16)),
                        ),
                      ),


                      Padding(
                        padding: const EdgeInsets.only(left: 8.0, top: 10),
                        child: DropdownButton(
                          hint: Text("Select child number"),
                          dropdownColor: Colors.white,
                          icon: Icon(Icons.arrow_drop_down),
                          iconSize: 36,
                          isExpanded: true,
                          style: TextStyle(color: Colors.black
                          ),
                          value: childChosed,
                          onChanged: (newValue) {
                            setState(() {
                              childChosed = newValue;
                            });
                          },
                          items: Child.map((valueItem) {
                            return DropdownMenuItem(value: valueItem,
                              child: Text(valueItem),
                            );
                          }).toList(),

                        ),
                      ),


                      Padding(
                        padding: const EdgeInsets.only(left: 8.0, top: 30),
                        child: Align(
                          alignment: Alignment.centerLeft,
                          child: Text("Phone number",
                              style: TextStyle(
                                  color: ArgonColors.text,
                                  fontWeight: FontWeight.w600,
                                  fontSize: 16)),
                        ),
                      ),
                      TextFormField(
                        controller: phonenumberController,
                        decoration: const InputDecoration(
                            labelText: 'Phone number',
                            hintText: 'Enter the phone number',
                            border: OutlineInputBorder()),
                        validator: (value) {
                          if (value.isEmpty) {
                            return 'Veuillez saisir un texte';
                          }
                          return null;
                        },
                      ),

                      Padding(
                        padding: const EdgeInsets.only(left: 8.0, top: 30),
                        child: Align(
                          alignment: Alignment.centerLeft,
                          child: Text("Email address",
                              style: TextStyle(
                                  color: ArgonColors.text,
                                  fontWeight: FontWeight.w600,
                                  fontSize: 16)),
                        ),
                      ),
                      TextFormField(
                        controller: emailController,
                        decoration: const InputDecoration(
                            labelText: 'Email address',
                            hintText: 'Enter the email address',
                            border: OutlineInputBorder()),
                        validator: (value) {
                          if (value.isEmpty) {
                            return 'Veuillez saisir un texte';
                          }
                          return null;
                        },
                      ),


                      Padding(
                        padding: const EdgeInsets.only(left: 8.0, top: 30),
                        child: Align(
                          alignment: Alignment.centerLeft,
                          child: Text("Address",
                              style: TextStyle(
                                  color: ArgonColors.text,
                                  fontWeight: FontWeight.w600,
                                  fontSize: 16)),
                        ),
                      ),
                      TextFormField(
                      controller: addressController,
                        decoration: const InputDecoration(
                            labelText: 'Address',
                            hintText: 'Enter the+ address',
                            border: OutlineInputBorder()),
                        validator: (value) {
                          if (value.isEmpty) {
                            return 'Veuillez saisir un texte';
                          }
                          return null;
                        },
                      ),

                      Padding(
                        padding: const EdgeInsets.only(left: 8.0, top: 30),
                        child: Align(
                          alignment: Alignment.centerLeft,
                          child: Text("State",
                              style: TextStyle(
                                  color: ArgonColors.text,
                                  fontWeight: FontWeight.w600,
                                  fontSize: 16)),
                        ),
                      ),

                      Padding(
                        padding: const EdgeInsets.only(left: 8.0, top: 10),
                        child: DropdownButton(
                          hint: Text("Select the city"),
                          dropdownColor: Colors.white,
                          icon: Icon(Icons.arrow_drop_down),
                          iconSize: 36,
                          isExpanded: true,
                          style: TextStyle(color: Colors.black
                          ),
                          value: cityChosed,
                          onChanged: (newValue) {
                           setState(() {
                             cityChosed = newValue;
                           });
                          },
                          items: ListItem.map((valueItem) {
                            return DropdownMenuItem(value: valueItem,
                              child: Text(valueItem),
                            );
                          }).toList(),

                        ),
                      ),

                      SizedBox(
                        width: double.infinity,
                        child: Padding(
                          padding:
                          const EdgeInsets.only(
                              left: 25.0, right: 25.0, top: 30),
                          // ignore: deprecated_member_use
                          child: RaisedButton(
                            textColor: ArgonColors.white,
                            color: Colors.lightBlue[400],
                            // onPressed: () {
                            //   // Respond to button press
                            //   Navigator.pushReplacementNamed(
                            //       context, '/newpatient');
                            // },
                            onPressed: () {
                              print(_gender);
                              print(filenumberController.text);
                              print(firstNameController.text);
                              print(lastNameController.text);
                              print(dateOfBirthController.text);
                              print(ageController.text);
                              print(professionController.text);
                              print(valueChoose);
                              print(childChosed);
                              print(phonenumberController.text);
                              print(emailController.text);
                              print(addressController.text);
                              print(cityChosed);

                              if (
                                  filenumberController.text.isEmpty ||
                                  firstNameController.text.isEmpty ||
                                  lastNameController.text.isEmpty ||
                                  dateOfBirthController.text.isEmpty ||
                                  ageController.text.isEmpty ||
                                  professionController.text.isEmpty ||
                                  valueChoose.isEmpty || childChosed.isEmpty ||
                                  phonenumberController.text.isEmpty ||
                                  emailController.text.isEmpty ||
                                  addressController.text.isEmpty ||
                                  cityChosed.isEmpty) {
                                Fluttertoast.showToast(
                                    msg: 'all fields should not be empty.',
                                    toastLength: Toast.LENGTH_SHORT,
                                    gravity: ToastGravity.BOTTOM,
                                    timeInSecForIosWeb: 1,
                                    backgroundColor: Colors.red,
                                    textColor: Colors.white,
                                    fontSize: 16.0
                                );
                              }
                              else {
                                Addfiche().addfichepatient(
                                    _gender,
                                    filenumberController.text,
                                    firstNameController.text,
                                    lastNameController.text,
                                    dateOfBirthController.text,
                                    ageController.text,
                                    professionController.text,
                                    valueChoose,
                                    childChosed,
                                    phonenumberController.text,
                                    emailController.text,
                                    addressController.text,
                                    cityChosed).then((val) {
                                  if (val.data['success']) {
                                    var token = val.data['token'];
                                    Fluttertoast.showToast(
                                        msg: 'Patient Added',
                                        toastLength: Toast.LENGTH_SHORT,
                                        gravity: ToastGravity.BOTTOM,
                                        timeInSecForIosWeb: 1,
                                        backgroundColor: Colors.green,
                                        textColor: Colors.white,
                                        fontSize: 16.0
                                    );
                                  }
                                });
                              }
                              Shape:
                              RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(4.0),
                              );
                              child:
                              Padding(
                                  padding: EdgeInsets.only(
                                      left: 16.0, right: 16.0, top: 12, bottom: 12),
                                  child: Text("Add New Patient",
                                      style: TextStyle(
                                          fontWeight: FontWeight.w600,
                                          fontSize: 16.0)));
                            }),
                        ),


                      )
                    ]),


                  )

              )

          )

      );
    }}


