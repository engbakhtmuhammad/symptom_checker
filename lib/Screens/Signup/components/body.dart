import 'package:flutter/material.dart';
import 'package:fyp/Screens/Signup/components/background.dart';
import 'package:fyp/Screens/Login/login_screen.dart';
import 'package:fyp/components/already_have_an_account_acheck.dart';
import 'package:fyp/components/rounded_button.dart';
import 'package:fyp/components/rounded_input_field.dart';
import 'package:fyp/components/rounded_password_field.dart';

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
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
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
                  'Create new account',
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
                    RoundedInputField(
                      hintText: "Your Email",
                      onChanged: (value) {},
                    ),
                    RoundedInputField(
                      hintText: "Username",
                      onChanged: (value) {},
                    ),
                    RoundedPasswordField(
                      onChanged: (value) {},
                    ),
                    RoundedButton(
                      text: "SIGNUP",
                      press: () {},
                    ),
                    SizedBox(height: size.height * 0.05),
                    AlreadyHaveAnAccountCheck(
                      login: false,
                      press: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) {
                              return LoginScreen();
                            },
                          ),
                        );
                      },
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
