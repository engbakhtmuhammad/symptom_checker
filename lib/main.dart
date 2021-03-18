import 'package:flutter/material.dart';
import 'package:fyp/Screens/Bio/bio_screen.dart';
import 'package:fyp/Screens/Welcome/welcome_screen.dart';

import 'constants.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'FYP UI',
      theme: ThemeData(
        primarySwatch: Colors.cyan,
        primaryColor: kPrimaryColor,
        scaffoldBackgroundColor: Colors.white,
      ),
      home: WelcomeScreen(),
    );
  }
}
