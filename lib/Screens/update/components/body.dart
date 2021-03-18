import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fyp/Screens/update/components/background.dart';

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
                    'Edit Information',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  backgroundColor: Colors.transparent,
                )),
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
                child:
                    Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                  Text(
                    'Update',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                        fontSize: 20),
                  ),
                  IconButton(
                      icon: Image.asset('assets/icons/updated.png'),
                      onPressed: null),
                ])),
          ],
        ),
      ),
    );
  }
}
