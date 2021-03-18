import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fyp/Screens/PossibleConditions/possibleCondition_screen.dart';
import 'package:fyp/Screens/Questions/components/background.dart';
import 'package:fyp/constants.dart';

import 'mySymptoms.dart';

class Body extends StatefulWidget {
  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  //
  List<User> users;
  User selectedUser;
  int selectedRadio;
  int selectedRadioTile;
  @override
  void initState() {
    super.initState();
    selectedRadio = 0;
    selectedRadioTile = 0;
    users = User.getUsers();
  }

  setSelectedRadio(int val) {
    setState(() {
      selectedRadio = val;
    });
  }

  setSelectedRadioTile(int val) {
    setState(() {
      selectedRadioTile = val;
    });
  }

  setSelectedUser(User user) {
    setState(() {
      selectedUser = user;
    });
  }

  List<Widget> createRadioListUsers() {
    List<Widget> widgets = [];
    for (User user in users) {
      widgets.add(
        RadioListTile(
          value: user,
          groupValue: selectedUser,
          title: Text(user.firstName),
          onChanged: (currentUser) {
            print("Current User ${currentUser.firstName}");
            setSelectedUser(currentUser);
          },
          selected: selectedUser == user,
          activeColor: kPrimaryColor,
        ),
      );
    }
    return widgets;
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    bool valueFirst = false;
    return Background(
      child: SingleChildScrollView(
        child: Column(
          children: [
            Positioned(
                top: 0,
                child: AppBar(
                  centerTitle: true,
                  title: Text(
                    'Questions',
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
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: <Widget>[
                          SizedBox(
                            height: size.height * .03,
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 28),
                            child: Text(
                              "Which symptom is bothering you the most?",
                              style: TextStyle(
                                  fontSize: 17,
                                  color: kBackgroundColor,
                                  fontWeight: FontWeight.w500),
                            ),
                          ),
                          SizedBox(height: size.height * .02),
                          Column(
                            children: createRadioListUsers(),
                          )
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
                                return PossibleCondition();
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
