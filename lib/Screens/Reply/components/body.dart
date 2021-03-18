import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fyp/Screens/Reply/components/background.dart';
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
      body: Background(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            //SizedBox(height: size.height * 0),
            Positioned(
                top: 0,
                child: AppBar(
                  centerTitle: true,
                  title: Text(
                    'Reply to User',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  backgroundColor: Colors.transparent,
                )),
            Container(
              width: size.width,
              height: size.height * .11,
              // decoration: BoxDecoration(color: Colors.black.withOpacity(0.3)),
              child: Column(
                children: [
                  ProfileField(
                    icon: Icons.person,
                    text: 'Symptoms of the users...',
                    color: kBackgroundColor,
                  )
                ],
              ),
            ),
            SizedBox(
              width: size.width,
              height: size.height * .675,
              child: Container(
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
                      Column(
                        children: [],
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Container(
                width: size.width,
                height: size.height * .1,
                padding: EdgeInsets.symmetric(horizontal: 65),
                child: Center(
                  child: IconButton(
                      icon: Image.asset('assets/icons/sent.png'),
                      onPressed: null),
                )),
          ],
        ),
      ),
    );
  }
}
