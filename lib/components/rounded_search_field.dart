import 'package:flutter/material.dart';
import 'package:fyp/components/search_text_field.dart';
import 'package:fyp/constants.dart';

class RoundedSearchField extends StatelessWidget {
  final String hintText;
  final IconData icon;
  final ValueChanged<String> onChanged;
  const RoundedSearchField({
    Key key,
    this.hintText,
    this.icon = Icons.search,
    this.onChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SearchFieldContainer(
      child: TextField(
        onChanged: onChanged,
        cursorColor: kBackgroundColor,
        decoration: InputDecoration(
          icon: Icon(
            icon,
            color: kBackgroundColor,
            size: 25,
          ),
          suffixIcon: IconButton(
            icon: Icon(Icons.keyboard_voice_outlined),
            //onPressed open voice keyboard
            onPressed: () {},
            color: kBackgroundColor,
            iconSize: 20,
          ),
          hintText: hintText,
          hintStyle: TextStyle(fontSize: 13),
          border: InputBorder.none,
        ),
      ),
    );
  }
}
