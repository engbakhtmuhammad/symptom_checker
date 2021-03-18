import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fyp/Screens/Disease/components/background.dart';
import 'package:fyp/Screens/Home/home_screen.dart';
import 'package:fyp/components/diseases_field.dart';

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
                  //Name of the disease from database
                  title: Text(
                    'Disease Name',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  backgroundColor: Colors.transparent,
                )),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  width: size.width,
                  height: size.height * .78,
                  child: Container(
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
                            DiseasesField(
                              overview:
                                  'This is overview of the diseas, This is overview of the diseas, This is overview of the diseas, This is overview of the diseas, This is overview of the diseas,',
                              howCommon:
                                  'This is overview of the diseas, This is overview of the diseas, This is overview of the diseas, This is overview of the diseas, This is overview of the diseas,',
                              diagnosedBy:
                                  'This is overview of the diseas, This is overview of the diseas, This is overview of the diseas, This is overview of the diseas, This is overview of the diseas,',
                              madeWorseBy:
                                  'This is overview of the diseas, This is overview of the diseas, This is overview of the diseas, This is overview of the diseas, This is overview of the diseas,',
                              riskFactors:
                                  'This is overview of the diseas, This is overview of the diseas, This is overview of the diseas, This is overview of the diseas, This is overview of the diseas,',
                              treatment:
                                  'This is overview of the diseas, This is overview of the diseas, This is overview of the diseas, This is overview of the diseas, This is overview of the diseas,',
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
                    child: Center(
                      child: GestureDetector(
                        onTap: () {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) {
                            return HomeScreen();
                          }));
                        },
                        child: Text(
                          'Finish',
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                              fontSize: 20),
                        ),
                      ),
                    )),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
