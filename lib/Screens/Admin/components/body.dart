import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fyp/Screens/Admin/components/background.dart';
import 'package:fyp/Screens/Login/login_screen.dart';
import 'package:fyp/Screens/Signup/signup_screen.dart';
import 'package:fyp/components/doctorList_field.dart';
import 'package:fyp/components/rounded_search_field.dart';
import 'package:fyp/constants.dart';

class Body extends StatelessWidget {
  const Body({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Background(
        child: SingleChildScrollView(
          child: Column(
            children: [
              //SizedBox(height: size.height * 0),
              Positioned(
                  top: 0,
                  child: AppBar(
                    actions: [
                      IconButton(
                          icon: Icon(Icons.logout),
                          //Logout function
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => LoginScreen()));
                          },
                          color: Colors.white)
                    ],
                    centerTitle: true,
                    title: Text(
                      'All Docotors',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    backgroundColor: Colors.transparent,
                  )),
              RoundedSearchField(
                hintText: 'Dr. Example',
                onChanged: (value) {},
              ),
              Container(
                width: size.width,
                height: size.height * .6945,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(35),
                        topRight: Radius.circular(35))),
                child: Positioned(
                  bottom: 0,
                  child: Stack(
                    children: <Widget>[
                      //this column will be use to show the list of doctors
                      SingleChildScrollView(
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
                          ],
                        ),
                      ),
                      Positioned(
                          bottom: 10,
                          right: 20,
                          child: FloatingActionButton(
                            child: Icon(
                              Icons.add,
                              color: Colors.white,
                            ),
                            backgroundColor: kPrimaryColor,
                            //onPress admin can add/create account for doctor
                            onPressed: () {
                              Navigator.push(context,
                                  MaterialPageRoute(builder: (context) {
                                return SignUpScreen();
                              }));
                            },
                          ))
                    ],
                  ),
                ),
              ),
              Container(
                width: size.width,
                height: size.height * .1,
                padding: EdgeInsets.symmetric(horizontal: 65),
                child: Row(
                  children: [
                    //make it iconButton

                    IconButton(
                        icon: Image.asset('assets/icons/doctor.png',
                            color: kPrimaryColor),
                        onPressed: () {}),
                    Spacer(),
                    IconButton(
                        icon: Image.asset(
                          'assets/icons/user.png',
                        ),
                        onPressed: () {
                          // Navigator.push(context,
                          //     MaterialPageRoute(builder: (context) {
                          //   return UserBody();
                          // }));
                        }),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
