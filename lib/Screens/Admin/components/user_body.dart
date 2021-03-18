import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fyp/Screens/Admin/components/background.dart';
import 'package:fyp/Screens/Admin/components/body.dart';
import 'package:fyp/components/rounded_search_field.dart';
import 'package:fyp/constants.dart';

//Having some error so we will look after

class UserBody extends StatefulWidget {
  @override
  _UserBodyState createState() => _UserBodyState();
}

class _UserBodyState extends State<UserBody> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Background(
      child: Column(
        children: [
          //SizedBox(height: size.height * 0),
          Positioned(
              top: 0,
              child: AppBar(
                actions: [
                  IconButton(
                      icon: Icon(Icons.logout),
                      //Logout function
                      onPressed: () {},
                      color: Colors.white)
                ],
                centerTitle: true,
                title: Text(
                  'All Docotors',
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
                RoundedSearchField(
                  hintText: 'Dr. Example',
                  onChanged: (value) {},
                )
              ],
            ),
          ),
          SizedBox(
            width: size.width,
            height: size.height * .64,
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
                  children: <Widget>[],
                ),
              ),
            ),
          ),
          SizedBox(
            height: size.height * .037,
          ),
          Container(
            width: size.width,
            height: size.height * .1,
            margin: EdgeInsets.symmetric(horizontal: 65),
            child: Row(
              children: [
                //make it iconButton

                IconButton(
                    icon: Image.asset('assets/icons/doctor.png'),
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) {
                        return Body();
                      }));
                    }),
                Spacer(),
                IconButton(
                    icon: Image.asset(
                      'assets/icons/user.png',
                      color: kPrimaryColor,
                    ),
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) {
                        return UserBody();
                      }));
                    }),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
