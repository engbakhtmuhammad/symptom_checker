import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fyp/Screens/Doctors/doctors_screen.dart';
import 'package:fyp/Screens/Notification/notification_screen.dart';
import 'package:fyp/Screens/Home/components/body.dart';
import 'package:fyp/Screens/UsersProfile/usersProfile_screen.dart';
import 'package:fyp/constants.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:line_icons/line_icons.dart';

var tstyle = TextStyle(color: Colors.white.withOpacity(0.6), fontSize: 50);

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  var padding = EdgeInsets.symmetric(horizontal: 18, vertical: 5);
  double gap = 10;

  int _index = 0;
  List<Widget> pages = [
    Body(),
    Doctors(),
    NotificationScreen(),
    UsersProfile()
  ];
  PageController controller = PageController();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        extendBody: true,
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
      ),
    );
  }
}
