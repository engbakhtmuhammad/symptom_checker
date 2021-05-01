import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fyp/Screens/Admin/admin_screen.dart';
import 'package:fyp/Screens/Bio/bio_screen.dart';
import 'package:fyp/Screens/DoctorNotification/doctorNotificationScreen.dart';
import 'package:fyp/Screens/DoctorsProfile/doctorsProfile_screen.dart';
import 'package:fyp/Screens/UsersProfile/userProfileScreen.dart';
import 'package:fyp/Screens/Welcome/welcome_screen.dart';
import 'package:fyp/Screens/model/user.dart';
import 'package:fyp/Screens/services/authenticate.dart';
import 'package:fyp/Screens/services/helper.dart';
import 'package:fyp/Screens/services/news.dart';
import 'package:fyp/Screens/Home/article_view.dart';
import 'package:fyp/components/header.dart';
import 'package:fyp/constants.dart';
import 'package:firebase_auth/firebase_auth.dart' as auth;

import '../../main.dart';

var tstyle = TextStyle(color: Colors.white.withOpacity(0.6), fontSize: 50);

class HomeScreen extends StatefulWidget {
  final User user;
  HomeScreen({Key key, this.user}) : super(key: key);
  @override
  createState() => _HomeScreenState(user);
}

class _HomeScreenState extends State<HomeScreen> {
  final User user;
  _HomeScreenState(this.user);
  bool _loading;
  var newslist;

  void getNews() async {
    News news = News();
    await news.getNews();
    newslist = news.news;
    setState(() {
      _loading = false;
    });
  }

  @override
  void initState() {
    _loading = true;
    // TODO: implement initState
    //
    super.initState();
    SystemChrome.setEnabledSystemUIOverlays([]);
    getNews();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: header(""),
      drawer: Drawer(
          child: ListView(
        children: <Widget>[
          UserAccountsDrawerHeader(
            accountName: Text(user.fullName()),
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
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            GestureDetector(
              onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (BuildContext context) => BioScreen())),
              child: Container(
                width: size.width,
                height: size.height * .125,
                decoration: BoxDecoration(
                    color: kBackgroundColor,
                    borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(35),
                        bottomRight: Radius.circular(35))),
                child: Row(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 40, top: 10),
                          child: Text(
                            "How You Feel!",
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 20),
                          ),
                        ),
                        SizedBox(
                            width: size.width / 1.5,
                            child: Padding(
                              padding: const EdgeInsets.only(
                                left: 40,
                              ),
                              child: Text(
                                "Tap here to check your symptom before it become worse",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w400,
                                    fontSize: 15),
                              ),
                            ))
                      ],
                    ),
                    Spacer(),
                    Padding(
                      padding: const EdgeInsets.only(
                        right: 30,
                      ),
                      child: Image.asset("assets/images/fever.png"),
                    )
                  ],
                ),
                // child: RoundedButton(
                //     text: 'Check Symptoms',
                //     press: () {
                //       Navigator.push(context, MaterialPageRoute(builder: (context) {
                //         return BioScreen();
                //       }));
                //     }),
              ),
            ),
            Center(
              child: _loading
                  ? Center(
                      child: CircularProgressIndicator(),
                    )
                  : Container(
                      margin: EdgeInsets.only(top: 16),
                      child: ListView.builder(
                          itemCount: newslist.length,
                          shrinkWrap: true,
                          physics: ClampingScrollPhysics(),
                          itemBuilder: (context, index) {
                            return NewsTile(
                              imgUrl: newslist[index].urlToImage ?? "",
                              title: newslist[index].title ?? "",
                              desc: newslist[index].description ?? "",
                              content: newslist[index].content ?? "",
                              posturl: newslist[index].articleUrl ?? "",
                            );
                          }),
                    ),
            )
          ],
        ),
      ),
    );
  }
}

class NewsTile extends StatelessWidget {
  final String imgUrl, title, desc, content, posturl;

  NewsTile(
      {this.imgUrl,
      this.desc,
      this.title,
      this.content,
      @required this.posturl});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => ArticleView(
                      postUrl: posturl,
                    )));
      },
      child: Container(
          margin: EdgeInsets.only(bottom: 24),
          width: MediaQuery.of(context).size.width,
          child: Container(
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 16),
              alignment: Alignment.bottomCenter,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                      bottomRight: Radius.circular(6),
                      bottomLeft: Radius.circular(6))),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  ClipRRect(
                      borderRadius: BorderRadius.circular(6),
                      child: Image.network(
                        imgUrl,
                        height: 200,
                        width: MediaQuery.of(context).size.width,
                        fit: BoxFit.cover,
                      )),
                  SizedBox(
                    height: 12,
                  ),
                  Text(
                    title,
                    maxLines: 2,
                    style: TextStyle(
                        color: Colors.black87,
                        fontSize: 20,
                        fontWeight: FontWeight.w500),
                  ),
                  SizedBox(
                    height: 4,
                  ),
                  Text(
                    desc,
                    maxLines: 2,
                    style: TextStyle(color: Colors.black54, fontSize: 14),
                  )
                ],
              ),
            ),
          )),
    );
  }
}
