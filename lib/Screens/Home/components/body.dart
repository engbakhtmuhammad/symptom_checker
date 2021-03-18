import 'package:flutter/material.dart';
import 'package:fyp/Screens/Admin/admin_screen.dart';
import 'package:fyp/Screens/Bio/bio_screen.dart';
import 'package:fyp/Screens/DoctorNotification/notification_screen.dart';
import 'package:fyp/Screens/DoctorsProfile/doctorsProfile_screen.dart';
import 'package:fyp/Screens/Home/components/background.dart';
import 'package:fyp/Screens/Symptoms/symptoms_screen.dart';
import 'package:fyp/Screens/update/update_screen.dart';
import 'package:fyp/components/news_field.dart';
import 'package:fyp/components/rounded_button.dart';
import 'package:fyp/constants.dart';

class Body extends StatefulWidget {
  const Body({
    Key key,
  }) : super(key: key);
  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      drawer: Drawer(
          child: ListView(
        children: <Widget>[
          UserAccountsDrawerHeader(
            accountName: Text("Shahid Afridi"),
            accountEmail: Text("shahid.afridi@gmail.com"),
            currentAccountPicture: GestureDetector(
                child: CircleAvatar(
                  backgroundColor: Colors.transparent,
                  backgroundImage: AssetImage('assets/images/afridi.jpg'),
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
