import 'dart:ffi';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fyp/Screens/Home/home_screen.dart';
import 'package:fyp/Screens/Login/components/background.dart';
import 'package:fyp/Screens/Signup/signup_screen.dart';
import 'package:fyp/components/already_have_an_account_acheck.dart';
import 'package:fyp/components/rounded_button.dart';
import 'package:fyp/components/rounded_input_field.dart';
import 'package:fyp/components/rounded_password_field.dart';

class Body extends StatefulWidget {
  const Body({
    Key key,
  }) : super(key: key);
  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  @override
  Widget build(BuildContext context) {
    String _email, _password;
    final auth = FirebaseAuth.instance;

    final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
    Size size = MediaQuery.of(context).size;

    @override
    void initState() {
      super.initState();
    }

    showError(String errormessage) async {
      showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: Text('ERROR'),
              content: Text(errormessage),
              actions: <Widget>[
                FlatButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    child: Text('OK'))
              ],
            );
          });
    }

    login() async {
      if (_formKey.currentState.validate()) {
        _formKey.currentState.save();

        try {
          await auth.signInWithEmailAndPassword(
              email: _email, password: _password);
        } catch (e) {
          showError(e.message);
          print(e);
        }
      }
    }

    return Background(
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Image(
              width: size.width * .7,
              fit: BoxFit.cover,
              image: AssetImage('assets/icons/login.png'),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 50),
              child: Container(
                width: size.width * .4,
                height: 02,
                color: Colors.white,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 40),
              child: ListTile(
                title: Text(
                  'Welcome',
                  style: TextStyle(
                      color: Colors.white, fontWeight: FontWeight.w700),
                ),
                subtitle: Text(
                  'Sign in to your account',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
            Container(
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(35),
                      topRight: Radius.circular(35))),
              child: Positioned(
                bottom: 0,
                child: Form(
                  key: _formKey,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      SizedBox(height: size.height * 0.03),
                      RoundedInputField(
                        hintText: "Your Email",
                        onChanged: (value) {
                          setState(() {
                            _password = value.trim();
                          });
                        },
                      ),
                      RoundedPasswordField(
                        onChanged: (value) {
                          setState(() {
                            _password = value.trim();
                          });
                        },
                      ),
                      RoundedButton(
                        text: "LOGIN",
                        press: () {
                          auth.signInWithEmailAndPassword(
                              email: _email, password: _password);
                          Navigator.pushReplacement(context,
                              MaterialPageRoute(builder: (context) {
                            return HomeScreen();
                          }));
                        },
                      ),
                      SizedBox(height: size.height * 0.05),
                      AlreadyHaveAnAccountCheck(
                        press: () {
                          auth.createUserWithEmailAndPassword(
                              email: _email, password: _password);
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                              builder: (context) {
                                return SignUpScreen();
                              },
                            ),
                          );
                        },
                      ),
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );

    void checkAuthentification() async {
      auth.authStateChanges().listen((user) {
        if (user != null) {
          print(user);

          Navigator.pushReplacementNamed(context, "/");
        }
      });
    }
  }
}
