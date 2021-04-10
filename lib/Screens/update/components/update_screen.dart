import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fyp/Screens/model/user.dart';
import 'package:fyp/Screens/services/helper.dart';
import 'package:fyp/Screens/update/components/background.dart';
import 'package:fyp/components/text_field_container.dart';
import 'package:fyp/constants.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

File _image;

class Update extends StatefulWidget {
  final User user;
  Update({Key key, this.user}) : super(key: key);
  @override
  createState() => _UpdateState(user);
}

class _UpdateState extends State<Update> {
  final User user;
  _UpdateState(this.user);
  final ImagePicker _imagePicker = ImagePicker();
  TextEditingController _passwordController = new TextEditingController();
  GlobalKey<FormState> _key = new GlobalKey();
  AutovalidateMode _validate = AutovalidateMode.disabled;
  String firstName, lastName, email, mobile, password, confirmPassword;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    String firstName, lastName, email, mobile, password, confirmPassword;

    return Scaffold(
      body: Background(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Positioned(
                  top: 0,
                  child: AppBar(
                    elevation: 0.0,
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
                  child: Stack(
                    children: <Widget>[
                      //this column will be use to show the list of doctors
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Center(
                            child: Form(
                                key: _key,
                                autovalidateMode: _validate,
                                child: formUI()),
                          )
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                  width: size.width,
                  height: size.height * .1,
                  padding: EdgeInsets.symmetric(horizontal: 65),
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
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
      ),
    );
  }

  Widget formUI() {
    Size size = MediaQuery.of(context).size;
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        Padding(
          padding:
              const EdgeInsets.only(left: 8.0, top: 32, right: 8, bottom: 8),
          child: Stack(
            alignment: Alignment.bottomCenter,
            children: <Widget>[
              CircleAvatar(
                radius: 65,
                backgroundColor: Colors.grey.shade400,
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
              Positioned(
                left: 80,
                right: 0,
                child: FloatingActionButton(
                    backgroundColor: kPrimaryColor,
                    child: Icon(Icons.edit),
                    mini: true,
                    onPressed: _onCameraClick),
              )
            ],
          ),
        ),
        TextFieldContainer(
            child: TextFormField(
                validator: validateName,
                onSaved: (String val) {
                  user.firstName = val;
                },
                textInputAction: TextInputAction.next,
                onFieldSubmitted: (_) => FocusScope.of(context).nextFocus(),
                decoration: InputDecoration(
                    hintText: user.firstName, border: InputBorder.none))),
        TextFieldContainer(
          child: TextFormField(
              validator: validateName,
              onSaved: (String val) {
                user.lastName = val;
              },
              textInputAction: TextInputAction.next,
              onFieldSubmitted: (_) => FocusScope.of(context).nextFocus(),
              decoration: InputDecoration(
                  hintText: user.lastName, border: InputBorder.none)),
        ),
        TextFieldContainer(
          child: TextFormField(
              keyboardType: TextInputType.phone,
              textInputAction: TextInputAction.next,
              validator: validateMobile,
              onSaved: (String val) {
                user.phoneNumber = val;
              },
              decoration: InputDecoration(
                  hintText: user.phoneNumber, border: InputBorder.none)),
        ),
      ],
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

  Future updateUserData(String firstName, String lastName, String phoneNumber,
      String bio, String userID) async {}
}
