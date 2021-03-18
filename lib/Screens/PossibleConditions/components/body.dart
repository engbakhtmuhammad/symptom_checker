import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fyp/Screens/Disease/disease_screen.dart';
import 'package:fyp/Screens/PossibleConditions/components/background.dart';
import 'package:fyp/components/possibleCondition_field.dart';
import 'package:fyp/components/rounded_button.dart';

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
            //SizedBox(height: size.height * 0),
            Positioned(
                top: 0,
                child: AppBar(
                  centerTitle: true,
                  title: Text(
                    'Possible Conditions',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  backgroundColor: Colors.transparent,
                )),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  width: size.width,
                  height: size.height * .5,
                  child: Container(
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(35),
                            topRight: Radius.circular(35))),
                    child: Positioned(
                      bottom: 0,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: <Widget>[
                          ListTile(
                            trailing: Text('Understanding your results'),
                          ),
                          PossibleConditionField(
                            possibleCondition: 'Nazla Zukam tokha tokha',
                          ),
                          PossibleConditionField(
                            possibleCondition: 'Nazla Zukam tokha tokha',
                          ),
                          PossibleConditionField(
                            possibleCondition: 'Nazla Zukam tokha tokha',
                          ),
                          PossibleConditionField(
                            possibleCondition: 'Nazla Zukam tokha tokha',
                          )
                        ],
                      ),
                    ),
                  ),
                ),
                Container(
                  width: size.width,
                  height: size.height * .3,
                  child: Column(
                    children: [
                      Divider(
                        color: Colors.black,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 30, vertical: 10),
                        child: Text(
                          'Post these symptoms to doctors to get reply and suggestions for treatment',
                          style: TextStyle(fontSize: 15),
                        ),
                      ),
                      RoundedButton(
                        text: 'Post to Doctors',
                        press: () {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) {
                            return Disease();
                          }));
                        },
                      )
                    ],
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
                                return Disease();
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
