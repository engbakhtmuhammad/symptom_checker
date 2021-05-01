import 'package:flutter/material.dart';
import 'package:fyp/constants.dart';

AppBar header(String titleText) {
  return AppBar(
      elevation: 0.0,
      title: Text(
        titleText,
        style: TextStyle(
            // color: Colors.white,
            // fontFamily: isAppTitle ? "Signatra" : "",
            // fontSize: isAppTitle ? 50.0 : 22.0,
            ),
      ),
      centerTitle: true,
      backgroundColor: kBackgroundColor);
}
