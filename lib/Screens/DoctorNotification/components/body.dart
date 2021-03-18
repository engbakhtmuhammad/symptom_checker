import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fyp/Screens/DoctorNotification/components/background.dart';
import 'package:fyp/components/notificationReply_field.dart';
import 'package:fyp/components/rounded_search_field.dart';

class Body extends StatelessWidget {
  const Body({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Background(
      child: SingleChildScrollView(
        child: Column(
          children: [
            Positioned(
                top: 0,
                child: AppBar(
                  centerTitle: true,
                  title: Text(
                    'Notifications',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  backgroundColor: Colors.transparent,
                )),
            RoundedSearchField(
              hintText: 'Search Notification',
              onChanged: (value) {},
            ),
            Container(
              width: size.width,
              height: size.height * .756,
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
                      SizedBox(
                        height: size.height * .01,
                      ),
                      NotificationReplyField(
                        imageUrl: 'assets/images/afridi.jpg',
                        symptoms: 'Symptoms1, Symptoms2 ',
                      ),
                      NotificationReplyField(
                        imageUrl: 'assets/images/afridi.jpg',
                        symptoms: 'Symptoms1, Symptoms2 ',
                      ),
                      NotificationReplyField(
                        imageUrl: 'assets/images/afridi.jpg',
                        symptoms: 'Symptoms1, Symptoms2 ',
                      ),
                      NotificationReplyField(
                        imageUrl: 'assets/images/afridi.jpg',
                        symptoms: 'Symptoms1, Symptoms2 ',
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
