import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fyp/Screens/Bio/components/background.dart';
import 'package:fyp/Screens/PossibleConditions/possibleCondition_screen.dart';
import 'package:fyp/Screens/Symptoms/symptoms_screen.dart';
import 'package:fyp/components/text_field_container.dart';
import 'package:fyp/constants.dart';

class Body extends StatefulWidget {
  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  bool _button1Pressed = false;
  bool _button2Pressed = false;

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
                    'Your Bio',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  backgroundColor: Colors.transparent,
                )),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  width: size.width,
                  height: size.height * .785,
                  child: Container(
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(35),
                            topRight: Radius.circular(35))),
                    child: Positioned(
                      bottom: 0,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          SizedBox(
                            height: size.height * .03,
                          ),
                          Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 28, vertical: 10),
                                child: Text(
                                  "Symptom checker",
                                  style: TextStyle(
                                      fontSize: 28,
                                      color: kBackgroundColor,
                                      fontWeight: FontWeight.w800),
                                ),
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 60),
                                child: Text(
                                  "Identify possible conditions and",
                                  style: TextStyle(
                                      fontSize: 18,
                                      color: kBackgroundColor,
                                      fontWeight: FontWeight.w400),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(
                                    left: 60, right: 60, bottom: 10),
                                child: Text(
                                  "treatment related to your symptoms",
                                  style: TextStyle(
                                      fontSize: 18,
                                      color: kBackgroundColor,
                                      fontWeight: FontWeight.w400),
                                ),
                              ),
                              Text(
                                "This tool does not provide medical advice",
                                style: TextStyle(
                                  fontSize: 12,
                                  color: kBackgroundColor,
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 150, vertical: 10),
                                child: TextField(
                                  keyboardType: TextInputType.number,
                                  decoration: InputDecoration(
                                    border: OutlineInputBorder(
                                        borderSide: BorderSide(
                                            color: kBackgroundColor)),
                                    helperText: 'Enter your age. Ex: 23',
                                    labelText: 'Age',
                                    prefixIcon: const Icon(
                                      Icons.person,
                                      color: kBackgroundColor,
                                    ),
                                  ),
                                ),
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Container(
                                    margin: EdgeInsets.symmetric(vertical: 10),
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(20),
                                      child: FlatButton(
                                        padding: EdgeInsets.symmetric(
                                            vertical: 20, horizontal: 10),
                                        color: _button1Pressed
                                            ? kBackgroundColor
                                            : kPrimaryColor,
                                        onPressed: () {
                                          setState(() {
                                            _button1Pressed = true;
                                            _button2Pressed = false;
                                          });
                                        },
                                        child: Text(
                                          "Male",
                                          style: TextStyle(color: Colors.white),
                                        ),
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    width: size.width * .03,
                                  ),
                                  Container(
                                    margin: EdgeInsets.symmetric(vertical: 10),
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(20),
                                      child: FlatButton(
                                        padding: EdgeInsets.symmetric(
                                            vertical: 20, horizontal: 10),
                                        color: _button2Pressed
                                            ? kBackgroundColor
                                            : kPrimaryColor,
                                        onPressed: () {
                                          setState(() {
                                            _button2Pressed = true;
                                            _button1Pressed = false;
                                          });
                                        },
                                        child: Text(
                                          "Female",
                                          style: TextStyle(color: Colors.white),
                                        ),
                                      ),
                                    ),
                                  )
                                ],
                              )
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Container(
                  width: size.width,
                  height: size.height * .1,
                  padding: EdgeInsets.symmetric(horizontal: 45),
                  child: Row(
                    children: [
                      //make it iconButton

                      IconButton(
                          icon: Image.asset('assets/icons/left-arrow.png'),
                          onPressed: () => Navigator.pop(context)),
                      Spacer(),
                      IconButton(
                          icon: Image.asset('assets/icons/right-arrow.png'),
                          onPressed: () => Navigator.push(context,
                                  MaterialPageRoute(builder: (context) {
                                return Symptoms();
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
