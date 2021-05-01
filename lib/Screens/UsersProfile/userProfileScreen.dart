import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';

import 'package:firebase_auth/firebase_auth.dart' as auth;
import 'package:flutter/material.dart';

import 'package:fyp/Screens/update/components/update_screen.dart';
import 'package:fyp/Screens/Welcome/welcome_screen.dart';
import 'package:fyp/Screens/model/user.dart';
import 'package:fyp/Screens/services/authenticate.dart';
import 'package:fyp/Screens/services/helper.dart';
import 'package:fyp/components/header.dart';
import 'package:fyp/components/profile_field.dart';
import 'package:fyp/constants.dart';
import 'package:fyp/main.dart';

class UsersProfile extends StatefulWidget {
  final User user;
  UsersProfile({Key key, this.user}) : super(key: key);
  @override
  createState() => _UsersProfileState(user);
}

class _UsersProfileState extends State<UsersProfile> {
  final User user;
  _UsersProfileState(this.user);
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: header("Profile"),
      body: SingleChildScrollView(
        child: Stack(children: [
          Column(
            children: [
              Container(
                height: size.height * .18,
                decoration: BoxDecoration(
                    color: kBackgroundColor,
                    borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(35),
                        bottomRight: Radius.circular(35))),
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.only(
                        right: 30, left: 30, top: size.height * .065),
                    child: ListTile(
                      title: Center(
                          child: Text(
                        user.fullName(),
                        style: TextStyle(fontWeight: FontWeight.w600),
                      )),
                      subtitle: Text(user.bio =
                          "User bio User bio User bio User bio User bio User bio"),
                    ),
                  ),
                  SizedBox(height: size.height * .02),
                  ProfileField(
                    text: user.email,
                    icon: Icons.pin_drop_outlined,
                    color: Colors.red,
                  ),
                  ProfileField(
                    text: user.phoneNumber,
                    icon: Icons.phone_outlined,
                    color: Colors.green,
                  ),
                  ProfileField(
                    text: user.language = 'Languages user speaks',
                    icon: Icons.language_outlined,
                    color: Colors.blue,
                  ),
                  ProfileField(
                    text: 'Edit Information',
                    icon: Icons.edit,
                    color: Colors.orange,
                    press: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => Update(
                                    user: user,
                                  )));
                    },
                  ),
                  ProfileField(
                    text: 'log out from your account',
                    icon: Icons.logout,
                    color: Colors.red,
                    press: () async {
                      user.active = false;
                      user.lastOnlineTimestamp = Timestamp.now();
                      FireStoreUtils.updateCurrentUser(user);
                      await auth.FirebaseAuth.instance.signOut();
                      MyAppState.currentUser = null;
                      pushAndRemoveUntil(context, WelcomeScreen(), false);
                    },
                  ),
                  // ProfileField(
                  //   text: '',
                  //   icon: Icons.logout,
                  //   color: kPrimaryLightColor,
                  // ),
                ],
              ),
            ],
          ),
          Positioned(
            top: size.height * .09,
            left: size.width / 2 - size.height * 0.08,
            child: CircleAvatar(
              radius: size.height * .08,
              backgroundColor: Colors.transparent,
              backgroundImage: NetworkImage(user.profilePictureURL),
            ),
          ),
          Positioned(
              top: 10,
              right: 10,
              child: Image(
                image: AssetImage("assets/images/hospital-bed.png"),
                width: size.width * .25,
              )),
        ]),
      ),
    );
  }
}
