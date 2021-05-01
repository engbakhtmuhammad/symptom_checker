import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fyp/components/header.dart';
import 'package:fyp/components/notificationReply_field.dart';
import 'package:fyp/components/rounded_search_field.dart';

import '../../constants.dart';

class DoctorNotificationScreen extends StatelessWidget {
  const DoctorNotificationScreen({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: header("Notifications"),
      body: SingleChildScrollView(
        child: Column(children: [
          Container(
            width: size.width,
            height: size.height * .125,
            decoration: BoxDecoration(
                color: kBackgroundColor,
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(35),
                    bottomRight: Radius.circular(35))),
            child: Column(
              children: [
                RoundedSearchField(
                  hintText: 'Notification',
                  onChanged: (value) {},
                )
              ],
            ),
          ),
          Column(
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
        ]),
      ),
    );
  }
}
