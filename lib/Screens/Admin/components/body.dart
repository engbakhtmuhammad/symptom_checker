import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fyp/Screens/Admin/components/background.dart';
import 'package:fyp/Screens/Login/loginScreen.dart';
import 'package:fyp/Screens/model/doctor.dart';
import 'package:fyp/Screens/signUp/doctorSignUp.dart';
import 'package:fyp/components/doctorList_field.dart';
import 'package:fyp/components/rounded_search_field.dart';
import 'package:fyp/constants.dart';
import 'package:fyp/Screens/signUp/signUpScreen.dart';

class Body extends StatefulWidget {
  final Doctor doctor;
  Body({Key key, this.doctor}) : super(key: key);
  @override
  createState() => _BodyState(doctor);
}

class _BodyState extends State<Body> {
  final Doctor doctor;
  _BodyState(this.doctor);

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
                    elevation: 0.0,
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
                      // StreamBuilder(
                      //   stream: FirebaseFirestore.instance
                      //       .collection("users")
                      //       .snapshots(),
                      //   builder: (BuildContext context,
                      //       AsyncSnapshot<QuerySnapshot> snapshot) {
                      //     if (!snapshot.hasData) {
                      //       return Center(
                      //         child: CircularProgressIndicator(
                      //           valueColor:
                      //               AlwaysStoppedAnimation<Color>(Colors.red),
                      //         ),
                      //       );
                      //     } else {
                      //       return ListView.builder(
                      //           itemCount: snapshot.data.docs.length,
                      //           itemBuilder: (context, index) {
                      //             DocumentSnapshot doctorList =
                      //                 snapshot.data.docs[index];
                      //             return ListTile(
                      //               leading: Image.network(
                      //                   doctorList["profilePictureURL"]),
                      //               title: Text(doctorList["firstName"]),
                      //               subtitle: Text(doctorList["bio"]),
                      //             );
                      //           });
                      //     }
                      //   },
                      // ),
                      //
                      StreamBuilder(
                          stream: FirebaseFirestore.instance
                              .collection('users')
                              .snapshots(),
                          builder: (BuildContext context,
                              AsyncSnapshot<QuerySnapshot> snapshot) {
                            if (!snapshot.hasData) {
                              return Center(
                                child: CircularProgressIndicator(),
                              );
                            }

                            return ListView(
                              children: snapshot.data.docs.map((document) {
                                return DoctorListField(
                                  imageUrl: document["profilePictureURL"],
                                  name: document["firstName"],
                                  bio: document["bio"],
                                );
                              }).toList(),
                            );
                          }),
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
                                return DoctorSignUp();
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
