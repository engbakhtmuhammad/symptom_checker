import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:fyp/Screens/Admin/admin_screen.dart';
import 'package:fyp/Screens/Bio/bio_screen.dart';
import 'package:fyp/Screens/DoctorNotification/notification_screen.dart';
import 'package:fyp/Screens/DoctorsProfile/doctorsProfile_screen.dart';
import 'package:fyp/Screens/Home/components/background.dart';
import 'package:firebase_auth/firebase_auth.dart' as auth;
import 'package:fyp/Screens/Welcome/welcome_screen.dart';
import 'package:fyp/Screens/model/user.dart';
import 'package:fyp/Screens/services/authenticate.dart';
import 'package:fyp/Screens/services/helper.dart';
import 'package:fyp/Screens/update/update_screen.dart';
import 'package:fyp/components/news_field.dart';
import 'package:fyp/components/rounded_button.dart';
import 'package:fyp/constants.dart';
import 'package:fyp/main.dart';

class Body extends StatefulWidget {
  final User user;
  Body({Key key, this.user}) : super(key: key);
  @override
  createState() => _BodyState(user);
}

class _BodyState extends State<Body> {
  final User user;
  _BodyState(this.user);
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      drawer: Drawer(
          child: ListView(
        children: <Widget>[
          UserAccountsDrawerHeader(
            accountName: Text(user.firstName + " " + user.lastName),
            accountEmail: Text(user.email),
            currentAccountPicture: GestureDetector(
                child: CircleAvatar(
                  backgroundColor: Colors.transparent,
                  backgroundImage: NetworkImage(user.profilePictureURL),
                ),
                onTap: () => print("Current User")),

            //.. This line of code provides the usage of multiple accounts
            /* otherAccountsPictures: <Widget>[
              GestureDetector(
                onTap: ()=> switchUser(),
                child: CircleAvatar(
                  backgroundImage: NetworkImage(otherProfilePic)
                ),
              ),
            ], */
            decoration: BoxDecoration(
              color: kBackgroundColor,
            ),
          ),
          ListTile(
              title: Text("Doctor"),
              leading: Icon(Icons.person),
              onTap: () {
                Navigator.of(context).pop();
                Navigator.of(context).push(new MaterialPageRoute(
                  builder: (BuildContext context) => DoctorsProfile(),
                ));
              }),
          ListTile(
              title: Text("Admin"),
              leading: Icon(Icons.admin_panel_settings_outlined),
              onTap: () {
                Navigator.of(context).pop();
                Navigator.of(context).push(new MaterialPageRoute(
                  builder: (BuildContext context) => Admin(),
                ));
              }),
          ListTile(
              title: Text("Reply"),
              leading: Icon(Icons.send),
              onTap: () {
                Navigator.of(context).pop();
                Navigator.of(context).push(new MaterialPageRoute(
                  builder: (BuildContext context) => DoctorNotificationScreen(),
                ));
              }),
          ListTile(
              title: Text("Edit Information"),
              leading: Icon(Icons.edit),
              onTap: () {
                Navigator.of(context).pop();
                Navigator.of(context).push(new MaterialPageRoute(
                  builder: (BuildContext context) => Update(),
                ));
              }),
          ListTile(
            title: Text("Log out"),
            leading: Icon(Icons.logout),
            onTap: () async {
              user.active = false;
              user.lastOnlineTimestamp = Timestamp.now();
              FireStoreUtils.updateCurrentUser(user);
              await auth.FirebaseAuth.instance.signOut();
              MyAppState.currentUser = null;
              pushAndRemoveUntil(context, WelcomeScreen(), false);
            },
          ),
          Divider(
            thickness: 1.0,
          ),
          ListTile(
            title: Text("Close"),
            trailing: Icon(Icons.cancel),
            onTap: () => Navigator.of(context).pop(),
          ),
        ],
      )),
      body: Background(
        child: Column(
          children: [
            //SizedBox(height: size.height * 0),
            Positioned(
                top: 0,
                child: AppBar(
                  backgroundColor: Colors.transparent,
                )),
            Container(
              height: size.height * 0.78,
              width: size.width,
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(35),
                      topRight: Radius.circular(35))),
              child: Positioned(
                bottom: 0,
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      RoundedButton(
                          text: 'Check Symptoms',
                          press: () {
                            Navigator.push(context,
                                MaterialPageRoute(builder: (context) {
                              return BioScreen();
                            }));
                          }),
                      NewsField(
                        imageUrl: 'assets/images/afridi.jpg',
                        text:
                            'Pakistan cricketer Shahid Afridi isn’t stranger to making comebacks from retirement but has now made it clear that he won’t be returning to international cricket again.In his final international appearance, Afridi led World XI in a charity T20 game against the West Indies at Lord’s on Thursday. During the match, former England captain and commentator Nasser Hussain jokingly asked the big-hitting Pakistan all-rounder if he had plans for another comeback.',
                      ),
                      NewsField(
                        imageUrl: 'assets/images/afridi.jpg',
                        text:
                            'Pakistan cricketer Shahid Afridi isn’t stranger to making comebacks from retirement but has now made it clear that he won’t be returning to international cricket again.In his final international appearance, Afridi led World XI in a charity T20 game against the West Indies at Lord’s on Thursday. During the match, former England captain and commentator Nasser Hussain jokingly asked the big-hitting Pakistan all-rounder if he had plans for another comeback.',
                      ),
                      NewsField(
                        imageUrl: 'assets/images/afridi.jpg',
                        text:
                            'Pakistan cricketer Shahid Afridi isn’t stranger to making comebacks from retirement but has now made it clear that he won’t be returning to international cricket again.In his final international appearance, Afridi led World XI in a charity T20 game against the West Indies at Lord’s on Thursday. During the match, former England captain and commentator Nasser Hussain jokingly asked the big-hitting Pakistan all-rounder if he had plans for another comeback.',
                      ),
                      NewsField(
                        imageUrl: 'assets/images/afridi.jpg',
                        text:
                            'Pakistan cricketer Shahid Afridi isn’t stranger to making comebacks from retirement but has now made it clear that he won’t be returning to international cricket again.In his final international appearance, Afridi led World XI in a charity T20 game against the West Indies at Lord’s on Thursday. During the match, former England captain and commentator Nasser Hussain jokingly asked the big-hitting Pakistan all-rounder if he had plans for another comeback.',
                      ),
                      NewsField(
                        imageUrl: 'assets/images/afridi.jpg',
                        text:
                            'Pakistan cricketer Shahid Afridi isn’t stranger to making comebacks from retirement but has now made it clear that he won’t be returning to international cricket again.In his final international appearance, Afridi led World XI in a charity T20 game against the West Indies at Lord’s on Thursday. During the match, former England captain and commentator Nasser Hussain jokingly asked the big-hitting Pakistan all-rounder if he had plans for another comeback.',
                      ),
                      NewsField(
                        imageUrl: 'assets/images/afridi.jpg',
                        text:
                            'Pakistan cricketer Shahid Afridi isn’t stranger to making comebacks from retirement but has now made it clear that he won’t be returning to international cricket again.In his final international appearance, Afridi led World XI in a charity T20 game against the West Indies at Lord’s on Thursday. During the match, former England captain and commentator Nasser Hussain jokingly asked the big-hitting Pakistan all-rounder if he had plans for another comeback.',
                      ),
                      NewsField(
                        imageUrl: 'assets/images/afridi.jpg',
                        text:
                            'Pakistan cricketer Shahid Afridi isn’t stranger to making comebacks from retirement but has now made it clear that he won’t be returning to international cricket again.In his final international appearance, Afridi led World XI in a charity T20 game against the West Indies at Lord’s on Thursday. During the match, former England captain and commentator Nasser Hussain jokingly asked the big-hitting Pakistan all-rounder if he had plans for another comeback.',
                      ),
                      NewsField(
                        imageUrl: 'assets/images/afridi.jpg',
                        text:
                            'Pakistan cricketer Shahid Afridi isn’t stranger to making comebacks from retirement but has now made it clear that he won’t be returning to international cricket again.In his final international appearance, Afridi led World XI in a charity T20 game against the West Indies at Lord’s on Thursday. During the match, former England captain and commentator Nasser Hussain jokingly asked the big-hitting Pakistan all-rounder if he had plans for another comeback.',
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
