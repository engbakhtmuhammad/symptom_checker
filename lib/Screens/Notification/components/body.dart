import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fyp/components/notification_field.dart';
import 'package:fyp/components/rounded_search_field.dart';
import 'package:fyp/constants.dart';

class Body extends StatelessWidget {
  const Body({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SingleChildScrollView(
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
            NotificationField(
              imageUrl: 'assets/images/afridi.jpg',
              symptom: 'Symptoms ',
              overview: 'this is the overview of the above symptom',
            ),
            NotificationField(
              imageUrl: 'assets/images/afridi.jpg',
              symptom: 'Symptoms ',
              overview: 'this is the overview of the above symptom',
            ),
            NotificationField(
              imageUrl: 'assets/images/afridi.jpg',
              symptom: 'Symptoms ',
              overview: 'this is the overview of the above symptom',
            ),
            NotificationField(
              imageUrl: 'assets/images/afridi.jpg',
              symptom: 'Symptoms ',
              overview: 'this is the overview of the above symptom',
            ),
            NotificationField(
              imageUrl: 'assets/images/afridi.jpg',
              symptom: 'Symptoms ',
              overview: 'this is the overview of the above symptom',
            ),
            NotificationField(
              imageUrl: 'assets/images/afridi.jpg',
              symptom: 'Symptoms ',
              overview: 'this is the overview of the above symptom',
            ),
            NotificationField(
              imageUrl: 'assets/images/afridi.jpg',
              symptom: 'Symptoms ',
              overview: 'this is the overview of the above symptom',
            ),
            NotificationField(
              imageUrl: 'assets/images/afridi.jpg',
              symptom: 'Symptoms ',
              overview: 'this is the overview of the above symptom',
            ),
            NotificationField(
              imageUrl: 'assets/images/afridi.jpg',
              symptom: 'Symptoms ',
              overview: 'this is the overview of the above symptom',
            ),
            NotificationField(
              imageUrl: 'assets/images/afridi.jpg',
              symptom: 'Symptoms ',
              overview: 'this is the overview of the above symptom',
            ),
          ],
        ),
      ]),
    );
  }
}
