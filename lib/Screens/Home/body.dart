import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fyp/Screens/Doctors/doctors_screen.dart';
import 'package:fyp/Screens/Home/home_screen.dart';
import 'package:fyp/Screens/Notification/notificationScreen.dart';
import 'package:fyp/Screens/UsersProfile/userProfileScreen.dart';
import 'package:fyp/Screens/model/user.dart';
import 'package:fyp/constants.dart';
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

  PageController _pageController;
  int pageIndex = 0;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _pageController = PageController();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  onPageChanged(int pageIndex) {
    setState(() {
      this.pageIndex = pageIndex;
    });
  }

  onTap(int pageIndex) {
    _pageController.animateToPage(
      pageIndex,
      duration: Duration(milliseconds: 300),
      curve: Curves.bounceIn,
    );
  }

  @override
  Widget build(BuildContext context) {
    //   var padding = EdgeInsets.symmetric(horizontal: 18, vertical: 5);
    //   double gap = 10;

    // int _index = 0;
    // List<Widget> pages = [
    //   HomeScreen(),
    //   Doctors(),
    //   NotificationScreen(),
    //   UsersProfile(
    //     user: user,
    //   )
    // ];
    return Scaffold(
      // appBar: AppBar(
      //   elevation: 0.0,
      //   backgroundColor: kBackgroundColor,
      // ),
      extendBody: true,
      body: PageView(
        children: <Widget>[
          HomeScreen(user: user),
          Doctors(),
          NotificationScreen(),
          UsersProfile(
            user: user,
          )
        ],
        controller: _pageController,
        onPageChanged: onPageChanged,
        physics: NeverScrollableScrollPhysics(),
      ),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          color: kBackgroundColor,
          borderRadius: BorderRadius.only(
              topRight: Radius.circular(35), topLeft: Radius.circular(35)),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
          child: CupertinoTabBar(
              border: Border(top: BorderSide(color: kBackgroundColor)),
              backgroundColor: kBackgroundColor,
              currentIndex: pageIndex,
              onTap: onTap,
              activeColor: kPrimaryColor,
              items: [
                BottomNavigationBarItem(icon: Icon(Icons.whatshot)),
                BottomNavigationBarItem(icon: Icon(Icons.verified_user)),
                BottomNavigationBarItem(icon: Icon(Icons.notifications_active)),
                BottomNavigationBarItem(icon: Icon(Icons.account_circle)),
              ]),
          // child: GNav(
          //   curve: Curves.fastOutSlowIn,
          //   duration: Duration(milliseconds: 900),
          //   tabs: [
          //     GButton(
          //       gap: gap,
          //       icon: LineIcons.home,
          //       iconColor: Colors.white,
          //       iconActiveColor: kPrimaryColor,
          //       text: 'Home',
          //       textColor: kPrimaryColor,
          //       backgroundColor: kPrimaryLightColor.withOpacity(0.2),
          //       iconSize: 24,
          //       padding: padding,
          //     ),
          //     GButton(
          //       gap: gap,
          //       icon: LineIcons.user,
          //       iconColor: Colors.white,
          //       iconActiveColor: kPrimaryColor,
          //       text: 'Doctors',
          //       textColor: kPrimaryColor,
          //       backgroundColor: kPrimaryLightColor.withOpacity(0.2),
          //       iconSize: 24,
          //       padding: padding,
          //     ),
          //     GButton(
          //       gap: gap,
          //       icon: Icons.notifications_none_outlined,
          //       iconColor: Colors.white,
          //       iconActiveColor: kPrimaryColor,
          //       text: 'Notifications',
          //       textColor: kPrimaryColor,
          //       backgroundColor: kPrimaryLightColor.withOpacity(0.2),
          //       iconSize: 24,
          //       padding: padding,
          //     ),
          //     GButton(
          //       gap: gap,
          //       icon: LineIcons.heart_o,
          //       iconColor: Colors.white,
          //       iconActiveColor: kPrimaryColor,
          //       text: 'Profile',
          //       textColor: kPrimaryColor,
          //       backgroundColor: kPrimaryLightColor.withOpacity(0.2),
          //       iconSize: 24,
          //       padding: padding,
          //     ),
          //   ],
          //   selectedIndex: _index,
          //   onTabChange: (index) {
          //     setState(() {
          //       _index = index;
          //     });
          //     _pageController.jumpToPage(index);
          //   },
          // ),
        ),
      ),
    );
  }
}
