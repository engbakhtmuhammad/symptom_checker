import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fyp/Screens/Doctors/components/background.dart';
import 'package:fyp/components/doctorList_field.dart';
import 'package:fyp/components/header.dart';
import 'package:fyp/components/rounded_search_field.dart';
import 'package:fyp/constants.dart';
import 'package:http/http.dart';

class Body extends StatelessWidget {
  const Body({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: header("All Doctors"),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              width: size.width,
              height: size.height * .125,
              decoration: BoxDecoration(
                  color: kBackgroundColor,
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(35),
                      bottomRight: Radius.circular(35))),
              child: Column(
                children: [
                  RoundedSearchField(
                    hintText: 'Dr. Example',
                    onChanged: (value) {},
                  )
                ],
              ),
            ),
            Column(
              children: [
                SizedBox(
                  height: size.height * .01,
                ),
                DoctorListField(
                  imageUrl: 'assets/images/doctor.jpg',
                  name: 'Doctor Name, speciality',
                ),
                DoctorListField(
                  imageUrl: 'assets/images/doctor.jpg',
                  name: 'Doctor Name, speciality',
                ),
                DoctorListField(
                  imageUrl: 'assets/images/doctor.jpg',
                  name: 'Doctor Name, speciality',
                ),
                DoctorListField(
                  imageUrl: 'assets/images/doctor.jpg',
                  name: 'Doctor Name, speciality',
                ),
                DoctorListField(
                  imageUrl: 'assets/images/doctor.jpg',
                  name: 'Doctor Name, speciality',
                ),
                DoctorListField(
                  imageUrl: 'assets/images/doctor.jpg',
                  name: 'Doctor Name, speciality',
                ),
                DoctorListField(
                  imageUrl: 'assets/images/doctor.jpg',
                  name: 'Doctor Name, speciality',
                ),
                DoctorListField(
                  imageUrl: 'assets/images/doctor.jpg',
                  name: 'Doctor Name, speciality',
                ),
                DoctorListField(
                  imageUrl: 'assets/images/doctor.jpg',
                  name: 'Doctor Name, speciality',
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
