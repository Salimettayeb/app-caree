import 'package:argon_flutter/components/category_card.dart';
import 'package:argon_flutter/components/doctor_card.dart';
import 'package:argon_flutter/components/search_bar.dart';
import 'package:argon_flutter/components/doctor_card.dart';
import 'package:argon_flutter/constant.dart';
import 'package:flutter/material.dart';
import 'package:argon_flutter/screens/Patient/DrawerPatient.dart';
import 'package:flutter/material.dart';

import 'package:argon_flutter/constants/Theme.dart';

//widgets
import 'package:argon_flutter/widgets/navbar.dart';



import 'package:flutter_svg/svg.dart';

class HomeScreenPatient extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(

      appBar: Navbar(
        bgColor: Colors.lightBlue[400],
        title: "Care",

      ), // key: _scaffoldKey,
      drawer: PatientDrawer(currentPage: "HomePatient"),

      body: SafeArea(

        bottom: false,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,

            children: <Widget>[

              Padding(
                padding: EdgeInsets.symmetric(horizontal: 30,vertical: 10),

                child: Row(

                  mainAxisAlignment: MainAxisAlignment.spaceBetween,

                ),
              ),
              SizedBox(
                height: 50,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 30),
                child: Text(
                  'Find your desired\ndoctor',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 32,
                    color: kTitleTextColor,
                  ),
                ),
              ),
              SizedBox(
                height: 30,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 30),
                child: SearchBar(
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 30),
                child: Text(
                  'Favorite Doctors',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: kTitleTextColor,
                    fontSize: 18,
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              buildDoctorList(),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 30),
                child: Text(
                  'Spetiality',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: kTitleTextColor,
                    fontSize: 18,
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              buildCategoryList(),
              SizedBox(
                height: 20,
              ),

            ],
          ),
        ),
      ),
    );
  }

  buildCategoryList() {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: <Widget>[
          SizedBox(
            width: 30,
          ),
          CategoryCard(
            'Cardiologist',
            'assets/icons/heart_surgeon.png',
            kBlueColor,
          ),
          SizedBox(
            width: 10,
          ),
          CategoryCard(
            'Pediatrician',
            'assets/ped.png',
            kBlueColor,
          ),
          SizedBox(
            width: 10,
          ),

          CategoryCard(
            'Generalist',
            'assets/scope.png',
            kBlueColor,
          ),
          SizedBox(
            width: 10,
          ),
          CategoryCard(
            'Ophthalmologist',
            'assets/icons/eye_specialist.png',
            kBlueColor,
          ),
          SizedBox(
            width: 30,
          ),
          CategoryCard(
            'Orthopedist',
            'assets/oo.png',
            kBlueColor,
          ),
          SizedBox(
            width: 30,
          ),
          CategoryCard(
            'Otolaryngologist',
            'assets/salem.png',
            kBlueColor,
          ),
          SizedBox(
            width: 30,
          ),
          CategoryCard(
            'Nephrologist',
            'assets/ne.png',
            kBlueColor,
          ),
          SizedBox(
            width: 30,
          ),
          CategoryCard(
            'dermatologist',
            'assets/derma.png',
            kBlueColor,
          ),
          SizedBox(
            width: 30,
          ),
          CategoryCard(
            'Dentist',
            'assets/icons/dental_surgeon.png',
            kBlueColor,
          ),

        ],
      ),
    );
  }

  buildDoctorList() {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: 30,
      ),
      child: Column(
        children: <Widget>[
          DoctorCard(
            'Dr.Salim Ettayeb',
            'Generalist - Ariana',
            'assets/images/doctor2.png',
            kBlueColor,
          ),


          SizedBox(
            height: 20,
          ),
          DoctorCard(
            'Dr.Asma Lachiheb',
            'Cardiologist - Tunis',
            'assets/images/doctor3.png',
            kOrangeColor,
          ),
          SizedBox(
            height: 20,
          ),
        ],
      ),
    );
  }
}

