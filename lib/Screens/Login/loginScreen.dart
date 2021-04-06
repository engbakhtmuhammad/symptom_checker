import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart' as auth;
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:fyp/components/already_have_an_account_acheck.dart';
import 'package:fyp/components/rounded_button.dart';
import 'package:fyp/components/text_field_container.dart';
import 'package:fyp/constants.dart';
import 'package:fyp/main.dart';
import 'package:fyp/Screens/model/user.dart';
import 'package:fyp/Screens/services/authenticate.dart';
import 'package:fyp/Screens/services/helper.dart';
import 'package:fyp/Screens/Home/components/body.dart';

class LoginScreen extends StatefulWidget {
  @override
  State createState() {
    return _LoginScreen();
  }
}

class _LoginScreen extends State<LoginScreen> {
  GlobalKey<FormState> _key = new GlobalKey();
  AutovalidateMode _validate = AutovalidateMode.disabled;
  String email = '', password = '';

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
          height: size.height,
          width: double.infinity,
          child: Stack(alignment: Alignment.center, children: <Widget>[
            Positioned(
              top: -150,
              left: 0,
              child: Image.asset(
                "assets/images/back1.png",
                width: size.width,
                fit: BoxFit.cover,
              ),
            ),
            SingleChildScrollView(
              child: Form(
                key: _key,
                autovalidateMode: _validate,
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
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            SizedBox(height: size.height * 0.03),
                            TextFieldContainer(
                              child: TextFormField(
                                textAlignVertical: TextAlignVertical.center,
                                textInputAction: TextInputAction.next,
                                validator: validateEmail,
                                onSaved: (String val) {
                                  email = val;
                                },
                                onFieldSubmitted: (_) =>
                                    FocusScope.of(context).nextFocus(),
                                keyboardType: TextInputType.emailAddress,
                                decoration: InputDecoration(
                                  icon: Icon(
                                    Icons.email,
                                    color: kPrimaryColor,
                                  ),
                                  hintText: "Your Email",
                                  border: InputBorder.none,
                                ),
                              ),
                            ),
                            TextFieldContainer(
                              child: TextFormField(
                                textAlignVertical: TextAlignVertical.center,
                                validator: validatePassword,
                                onSaved: (String val) {
                                  password = val;
                                },
                                onFieldSubmitted: (password) async {
                                  await login();
                                },
                                obscureText: true,
                                textInputAction: TextInputAction.done,
                                decoration: InputDecoration(
                                  hintText: "Password",
                                  icon: Icon(
                                    Icons.lock,
                                    color: kPrimaryColor,
                                  ),
                                  suffixIcon: Icon(
                                    Icons.visibility,
                                    color: kPrimaryColor,
                                  ),
                                  border: InputBorder.none,
                                ),
                              ),
                            ),
                            RoundedButton(
                              text: "LOGIN",
                              press: () async {
                                await login();
                              },
                            ),
                            SizedBox(height: size.height * 0.05),
                            AlreadyHaveAnAccountCheck(
                              press: () {},
                            ),
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ])),
    );
  }

  login() async {
    if (_key.currentState.validate()) {
      _key.currentState.save();
      showProgress(context, 'Logging in, please wait...', false);
      User user = await loginWithUserNameAndPassword();
      if (user != null)
        pushAndRemoveUntil(
            context,
            Body(
              user: user,
            ),
            false);
    } else {
      setState(() {
        _validate = AutovalidateMode.onUserInteraction;
      });
    }
  }

  Future<User> loginWithUserNameAndPassword() async {
    try {
      auth.UserCredential result = await auth.FirebaseAuth.instance
          .signInWithEmailAndPassword(
              email: email.trim(), password: password.trim());
      DocumentSnapshot documentSnapshot = await FireStoreUtils.firestore
          .collection(USERS)
          .doc(result.user.uid)
          .get();
      User user;
      if (documentSnapshot != null && documentSnapshot.exists) {
        user = User.fromJson(documentSnapshot.data());
        user.active = true;
        await FireStoreUtils.updateCurrentUser(user);
        hideProgress();
        MyAppState.currentUser = user;
      }
      return user;
    } on auth.FirebaseAuthException catch (exception) {
      hideProgress();
      switch ((exception).code) {
        case "invalid-email":
          showAlertDialog(context, 'Couldn\'t Authenticate', 'malformedEmail');
          break;
        case "wrong-password":
          showAlertDialog(context, 'Couldn\'t Authenticate', 'Wrong password');
          break;
        case "user-not-found":
          showAlertDialog(context, 'Couldn\'t Authenticate',
              'No user corresponds to this email');
          break;
        case "user-disabled":
          showAlertDialog(
              context, 'Couldn\'t Authenticate', 'This user is disabled');
          break;
        case 'too-many-requests':
          showAlertDialog(context, 'Couldn\'t Authenticate',
              'Too many requests, Please try again later.');
          break;
      }
      print(exception.toString());
      return null;
    } catch (e) {
      hideProgress();
      showAlertDialog(
          context, 'Couldn\'t Authenticate', 'Login failed. Please try again.');
      print(e.toString());
      return null;
    }
  }
}
