import 'package:flutter/material.dart';
import 'package:fyp/components/text_field_container.dart';
import 'package:fyp/constants.dart';

class RoundedPasswordField extends StatelessWidget {
  final ValueChanged<String> onChanged;
  const RoundedPasswordField({
    Key key,
    this.onChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String _password;
    return TextFieldContainer(
      child: TextFormField(
        validator: (input) {
          if (input.length < 6) {
            return "Provide Minimum 6 character";
          }
        },
        onSaved: (input) => _password = input,
        obscureText: true,
        onChanged: onChanged,
        cursorColor: kPrimaryColor,
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
    );
  }
}
