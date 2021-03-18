import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fyp/Screens/Doctors/components/background.dart';
import 'package:fyp/components/doctorList_field.dart';
import 'package:fyp/components/rounded_search_field.dart';

class Body extends StatelessWidget {
  const Body({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Background(
      child: Column(
        children: [
          //SizedBox(height: size.height * 0),
          Positioned(
              top: 0,
              child: AppBar(
                centerTitle: true,
                title: Text(
                  'Doctors List',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                backgroundColor: Colors.transparent,
              )),
          Container(
            width: size.width,
            height: size.height * .11,
            // decoration: BoxDecoration(color: Colors.black.withOpacity(0.3)),
            child: Column(
              children: [
                RoundedSearchField(
                  hintText: 'Dr. Example',
                  onChanged: (value) {},
                )
              ],
            ),
          ),
          SizedBox(
            width: size.width,
            height: size.height * .77,
            child: Container(
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(35),
                      topRight: Radius.circular(35))),
              child: Positioned(
                bottom: 0,
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      SizedBox(
                        height: size.height * .01,
                      ),
                      DoctorListField(
                        imageUrl: 'assets/images/doctor.jpg',
                        text: 'Doctor Name, speciality',
                      ),
                      DoctorListField(
                        imageUrl: 'assets/images/doctor.jpg',
                        text: 'Doctor Name, speciality',
                      ),
                      DoctorListField(
                        imageUrl: 'assets/images/doctor.jpg',
                        text: 'Doctor Name, speciality',
                      ),
                      DoctorListField(
                        imageUrl: 'assets/images/doctor.jpg',
                        text: 'Doctor Name, speciality',
                      ),
                      DoctorListField(
                        imageUrl: 'assets/images/doctor.jpg',
                        text: 'Doctor Name, speciality',
                      ),
                      DoctorListField(
                        imageUrl: 'assets/images/doctor.jpg',
                        text: 'Doctor Name, speciality',
                      ),
                      DoctorListField(
                        imageUrl: 'assets/images/doctor.jpg',
                        text: 'Doctor Name, speciality',
                      ),
                      DoctorListField(
                        imageUrl: 'assets/images/doctor.jpg',
                        text: 'Doctor Name, speciality',
                      ),
                      DoctorListField(
                        imageUrl: 'assets/images/doctor.jpg',
                        text: 'Doctor Name, speciality',
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
