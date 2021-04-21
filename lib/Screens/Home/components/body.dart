import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:fyp/Screens/Admin/admin_screen.dart';
import 'package:fyp/Screens/DoctorNotification/notification_screen.dart';
import 'package:fyp/Screens/Doctors/doctors_screen.dart';
import 'package:fyp/Screens/DoctorsProfile/doctorsProfile_screen.dart';
import 'package:firebase_auth/firebase_auth.dart' as auth;
import 'package:fyp/Screens/Home/home_screen.dart';
import 'package:fyp/Screens/Notification/notification_screen.dart';
import 'package:fyp/Screens/UsersProfile/usersProfile_screen.dart';
import 'package:fyp/Screens/Welcome/welcome_screen.dart';
import 'package:fyp/Screens/model/user.dart';
import 'package:fyp/Screens/services/authenticate.dart';
import 'package:fyp/Screens/services/helper.dart';
import 'package:fyp/constants.dart';
import 'package:fyp/main.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:line_icons/line_icons.dart';

var tstyle = TextStyle(color: Colors.white.withOpacity(0.6), fontSize: 50);

class Body extends StatefulWidget {
  final User user;
  Body({Key key, this.user}) : super(key: key);
  @override
  createState() => _BodyState(user);
}

class _BodyState extends State<Body> {
  final User user;
  _BodyState(this.user);

  PageController controller = PageController();
  @override
  Widget build(BuildContext context) {
    var padding = EdgeInsets.symmetric(horizontal: 18, vertical: 5);
    double gap = 10;

    int _index = 0;
    List<Widget> pages = [
      HomeScreen(),
      Doctors(),
      NotificationScreen(),
      UsersProfile(
        user: user,
      )
    ];
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: kBackgroundColor,
      ),
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
                onTap: () => Navigator.of(context).push(new MaterialPageRoute(
                      builder: (BuildContext context) => UsersProfile(
                        user: user,
                      ),
                    ))),

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
                // Navigator.of(context).push(new MaterialPageRoute(
                //   builder: (BuildContext context) => Update(),
                // ));
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
      //extendBody: true,
      body: PageView.builder(
          itemCount: 4,
          controller: controller,
          onPageChanged: (page) {
            setState(() {
              _index = page;
            });
          },
          itemBuilder: (context, position) {
            return pages[position];
          }),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          color: kBackgroundColor,
          borderRadius: BorderRadius.only(
              topRight: Radius.circular(35), topLeft: Radius.circular(35)),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 23),
          child: GNav(
            curve: Curves.fastOutSlowIn,
            duration: Duration(milliseconds: 900),
            tabs: [
              GButton(
                gap: gap,
                icon: LineIcons.home,
                iconColor: Colors.white,
                iconActiveColor: kPrimaryColor,
                text: 'Home',
                textColor: kPrimaryColor,
                backgroundColor: kPrimaryLightColor.withOpacity(0.2),
                iconSize: 24,
                padding: padding,
              ),
              GButton(
                gap: gap,
                icon: LineIcons.user,
                iconColor: Colors.white,
                iconActiveColor: kPrimaryColor,
                text: 'Doctors',
                textColor: kPrimaryColor,
                backgroundColor: kPrimaryLightColor.withOpacity(0.2),
                iconSize: 24,
                padding: padding,
              ),
              GButton(
                gap: gap,
                icon: Icons.notifications_none_outlined,
                iconColor: Colors.white,
                iconActiveColor: kPrimaryColor,
                text: 'Notifications',
                textColor: kPrimaryColor,
                backgroundColor: kPrimaryLightColor.withOpacity(0.2),
                iconSize: 24,
                padding: padding,
              ),
              GButton(
                gap: gap,
                icon: LineIcons.heart_o,
                iconColor: Colors.white,
                iconActiveColor: kPrimaryColor,
                text: 'Profile',
                textColor: kPrimaryColor,
                backgroundColor: kPrimaryLightColor.withOpacity(0.2),
                iconSize: 24,
                padding: padding,
              ),
            ],
            selectedIndex: _index,
            onTabChange: (index) {
              setState(() {
                _index = index;
              });
              controller.jumpToPage(index);
            },
          ),
        ),
      ),
    );
  }
}
