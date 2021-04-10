import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fyp/Screens/DoctorsProfile/components/background.dart';

import 'package:fyp/Screens/Login/loginScreen.dart';
import 'package:fyp/Screens/model/user.dart';
import 'package:fyp/Screens/update/components/update_screen.dart';
import 'package:fyp/components/profile_field.dart';
import 'package:fyp/constants.dart';

class Body extends StatelessWidget {
  const Body({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Profile"),
        elevation: 0.0,
        backgroundColor: kBackgroundColor,
      ),
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
                        "Doctor Name",
                        style: TextStyle(fontWeight: FontWeight.w600),
                      )),
                      subtitle: Text(
                          "User bio User bio User bio User bio User bio User bio"),
                    ),
                  ),
                  SizedBox(height: size.height * .02),
                  ProfileField(
                    text: "Doctor Email",
                    icon: Icons.pin_drop_outlined,
                    color: Colors.red,
                  ),
                  ProfileField(
                    text: "phone number",
                    icon: Icons.phone_outlined,
                    color: Colors.green,
                  ),
                  ProfileField(
                    text: "Languages Doctor speak",
                    icon: Icons.language_outlined,
                    color: Colors.blue,
                  ),
                  ProfileField(
                    text: 'Edit Information',
                    icon: Icons.edit,
                    color: Colors.orange,
                    press: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => Update()));
                    },
                  ),
                  ProfileField(
                    text: 'log out from your account',
                    icon: Icons.logout,
                    color: Colors.red,
                    press: () {},
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
              backgroundImage: AssetImage("assets/images/doctorProfiles.png"),
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
