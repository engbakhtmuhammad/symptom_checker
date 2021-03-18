import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fyp/Screens/Home/home_screen.dart';
import 'package:fyp/Screens/Questions/questions_screen.dart';
import 'package:fyp/Screens/Symptoms/components/background.dart';
import 'package:fyp/components/rounded_search_field.dart';
import 'package:fyp/components/symptoms_field.dart';

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
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            //SizedBox(height: size.height * 0),
            Positioned(
                top: 0,
                child: AppBar(
                  centerTitle: true,
                  title: Text(
                    'Symptoms',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  backgroundColor: Colors.transparent,
                )),
            Container(
              width: size.width,
              height: size.height * .13,
              // decoration: BoxDecoration(color: Colors.black.withOpacity(0.3)),
              child: Column(
                children: [
                  RoundedSearchField(
                    hintText: 'symptoms',
                    onChanged: (value) {},
                  )
                ],
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  width: size.width,
                  height: size.height * .656,
                  child: Container(
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(35),
                            topRight: Radius.circular(35))),
                    child: Positioned(
                      bottom: 0,
                      child: SingleChildScrollView(
                        scrollDirection: Axis.vertical,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: <Widget>[
                            SizedBox(height: size.height * .02),
                            SymptomsField(
                              symptom: 'Headache',
                            ),
                            SymptomsField(
                              symptom: 'stomach',
                            ),
                            SymptomsField(
                              symptom: 'Tokhi Hahaha',
                            ),
                            SymptomsField(
                              symptom: 'cough',
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                Container(
                  width: size.width,
                  height: size.height * .1,
                  margin: EdgeInsets.symmetric(horizontal: 45),
                  child: Row(
                    children: [
                      //make it iconButton

                      IconButton(
                          icon: Image.asset('assets/icons/left-arrow.png'),
                          onPressed: () => Navigator.push(context,
                                  MaterialPageRoute(builder: (context) {
                                return HomeScreen();
                              }))),
                      Spacer(),
                      IconButton(
                          icon: Image.asset('assets/icons/right-arrow.png'),
                          onPressed: () => Navigator.push(context,
                                  MaterialPageRoute(builder: (context) {
                                return QuestionScreen();
                              }))),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
