import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart' as auth;
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fyp/Screens/Admin/components/body.dart';
import 'package:fyp/Screens/model/doctor.dart';
import 'package:fyp/components/rounded_button.dart';
import 'package:fyp/components/text_field_container.dart';
import 'package:fyp/constants.dart';
import 'package:fyp/main.dart';
import 'package:fyp/Screens/model/user.dart';
import 'package:fyp/Screens/services/authenticate.dart';
import 'package:fyp/Screens/services/helper.dart';
import 'package:image_picker/image_picker.dart';
import 'package:fyp/Screens/signUp/background.dart';

File _image;

class DoctorSignUp extends StatefulWidget {
  @override
  State createState() => _SignUpState();
}

class _SignUpState extends State<DoctorSignUp> {
  final ImagePicker _imagePicker = ImagePicker();
  TextEditingController _passwordController = new TextEditingController();
  GlobalKey<FormState> _key = new GlobalKey();
  AutovalidateMode _validate = AutovalidateMode.disabled;
  String firstName, lastName, email, mobile, password, confirmPassword;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    if (Platform.isAndroid) {
      retrieveLostData();
    }

    return Scaffold(
      // appBar: AppBar(
      //   elevation: 0.0,
      //   backgroundColor: Colors.transparent,
      //   iconTheme: IconThemeData(color: Colors.black),
      // ),
      body: Background(
        child: Stack(
          children: [
            Positioned(
                top: 0,
                child: AppBar(
                  centerTitle: true,
                  elevation: 0.0,
                  backgroundColor: Colors.transparent,
                )),
            Positioned(
              top: size.height * .2,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    width: size.width,
                    height: size.height * .8,
                    child: SingleChildScrollView(
                      child: Container(
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(35),
                                  topRight: Radius.circular(35))),
                          child: Form(
                              key: _key,
                              autovalidateMode: _validate,
                              child: formUI())),
                    ),
                  ),
                ],
              ),
            ),
            Positioned(
              top: size.height * .13,
              left: size.width / 2 - size.height * 0.08,
              child: CircleAvatar(
                radius: size.height * .08,
                backgroundColor: Colors.transparent,
                child: ClipOval(
                  child: SizedBox(
                    width: 170,
                    height: 170,
                    child: _image == null
                        ? Image.asset(
                            'assets/images/placeholder.jpg',
                            fit: BoxFit.cover,
                          )
                        : Image.file(
                            _image,
                            fit: BoxFit.cover,
                          ),
                  ),
                ),
              ),
            ),
            Positioned(
              top: size.height * .23,
              left: size.width / 2 - size.height * .14,
              right: 0,
              child: FloatingActionButton(
                  backgroundColor: kPrimaryColor,
                  child: Icon(Icons.camera_alt),
                  mini: true,
                  onPressed: _onCameraClick),
            )
          ],
        ),
      ),
    );
  }

  Future<void> retrieveLostData() async {
    final LostData response = await _imagePicker.getLostData();
    if (response == null) {
      return;
    }
    if (response.file != null) {
      setState(() {
        _image = File(response.file.path);
      });
    }
  }

  _onCameraClick() {
    final action = CupertinoActionSheet(
      message: Text(
        "Add profile picture",
        style: TextStyle(fontSize: 15.0),
      ),
      actions: <Widget>[
        CupertinoActionSheetAction(
          child: Text("Choose from gallery"),
          isDefaultAction: false,
          onPressed: () async {
            Navigator.pop(context);
            PickedFile image =
                await _imagePicker.getImage(source: ImageSource.gallery);
            if (image != null)
              setState(() {
                _image = File(image.path);
              });
          },
        ),
        CupertinoActionSheetAction(
          child: Text("Take a picture"),
          isDestructiveAction: false,
          onPressed: () async {
            Navigator.pop(context);
            PickedFile image =
                await _imagePicker.getImage(source: ImageSource.camera);
            if (image != null)
              setState(() {
                _image = File(image.path);
              });
          },
        )
      ],
      cancelButton: CupertinoActionSheetAction(
        child: Text("Cancel"),
        onPressed: () {
          Navigator.pop(context);
        },
      ),
    );
    showCupertinoModalPopup(context: context, builder: (context) => action);
  }

  Widget formUI() {
    Size size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          SizedBox(height: size.height * .1),
          TextFieldContainer(
              child: TextFormField(
                  validator: validateName,
                  onSaved: (String val) {
                    firstName = val;
                  },
                  textInputAction: TextInputAction.next,
                  onFieldSubmitted: (_) => FocusScope.of(context).nextFocus(),
                  decoration: InputDecoration(
                      hintText: 'First Name', border: InputBorder.none))),
          TextFieldContainer(
            child: TextFormField(
                validator: validateName,
                onSaved: (String val) {
                  lastName = val;
                },
                textInputAction: TextInputAction.next,
                onFieldSubmitted: (_) => FocusScope.of(context).nextFocus(),
                decoration: InputDecoration(
                    hintText: 'Last Name', border: InputBorder.none)),
          ),
          TextFieldContainer(
            child: TextFormField(
                keyboardType: TextInputType.phone,
                textInputAction: TextInputAction.next,
                onFieldSubmitted: (_) => FocusScope.of(context).nextFocus(),
                validator: validateMobile,
                onSaved: (String val) {
                  mobile = val;
                },
                decoration: InputDecoration(
                    hintText: 'Phone Number', border: InputBorder.none)),
          ),
          TextFieldContainer(
            child: TextFormField(
                keyboardType: TextInputType.emailAddress,
                textInputAction: TextInputAction.next,
                onFieldSubmitted: (_) => FocusScope.of(context).nextFocus(),
                validator: validateEmail,
                onSaved: (String val) {
                  email = val;
                },
                decoration: InputDecoration(
                    hintText: 'Email Address', border: InputBorder.none)),
          ),
          TextFieldContainer(
            child: TextFormField(
                obscureText: true,
                textInputAction: TextInputAction.next,
                onFieldSubmitted: (_) => FocusScope.of(context).nextFocus(),
                controller: _passwordController,
                validator: validatePassword,
                onSaved: (String val) {
                  password = val;
                },
                decoration: InputDecoration(
                    hintText: 'Password', border: InputBorder.none)),
          ),
          TextFieldContainer(
            child: TextFormField(
                textInputAction: TextInputAction.done,
                onFieldSubmitted: (_) {
                  _sendToServer();
                },
                obscureText: true,
                validator: (val) =>
                    validateConfirmPassword(_passwordController.text, val),
                onSaved: (String val) {
                  confirmPassword = val;
                },
                decoration: InputDecoration(
                    hintText: 'Confirm Password', border: InputBorder.none)),
          ),
          RoundedButton(
            press: _sendToServer,
            text: "Sign Up",
          )
        ],
      ),
    );
  }

  _sendToServer() async {
    if (_key.currentState.validate()) {
      _key.currentState.save();
      showProgress(context, 'Creating new account, Please wait...', false);
      var profilePicUrl = '';
      try {
        auth.UserCredential result = await auth.FirebaseAuth.instance
            .createUserWithEmailAndPassword(
                email: email.trim(), password: password.trim());
        if (_image != null) {
          updateProgress('Uploading image, Please wait...');
          profilePicUrl = await FireStoreUtils()
              .uploadUserImageToFireStorage(_image, result.user.uid);
        }
        Doctor doctor = Doctor(
            email: email,
            firstName: firstName,
            phoneNumber: mobile,
            doctorID: result.user.uid,
            active: true,
            lastName: lastName,
            profilePictureURL: profilePicUrl);
        await FireStoreUtils.firestore
            .collection(DOCTORS)
            .doc(result.user.uid)
            .set(doctor.toJson());
        hideProgress();
        MyAppState.currentDoctor = doctor;
        pushAndRemoveUntil(context, Body(doctor: doctor), false);
      } on auth.FirebaseAuthException catch (error) {
        hideProgress();
        String message = 'Couldn\'t sign up';
        switch (error.code) {
          case 'email-already-in-use':
            message = 'Email address already in use';
            break;
          case 'invalid-email':
            message = 'validEmail';
            break;
          case 'operation-not-allowed':
            message = 'Email/password accounts are not enabled';
            break;
          case 'weak-password':
            message = 'password is too weak.';
            break;
          case 'too-many-requests':
            message = 'Too many requests, '
                'Please try again later.';
            break;
        }
        showAlertDialog(context, 'Failed', message);
        print(error.toString());
      } catch (e) {
        print('_SignUpState._sendToServer $e');
        hideProgress();
        showAlertDialog(context, 'Failed', 'Couldn\'t sign up');
      }
    } else {
      setState(() {
        _validate = AutovalidateMode.onUserInteraction;
      });
    }
  }

  @override
  void dispose() {
    _passwordController.dispose();
    _image = null;
    super.dispose();
  }
}
