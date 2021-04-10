import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fyp/Screens/Bio/bio_screen.dart';

import 'package:fyp/components/news_field.dart';
import 'package:fyp/components/rounded_button.dart';
import 'package:fyp/constants.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SingleChildScrollView(
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
    );
  }
}
