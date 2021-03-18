import 'package:flutter/material.dart';
import 'package:fyp/constants.dart';

class ProfileField extends StatelessWidget {
  final String text;
  final Color color;
  final IconData icon;
  final Function press;
  const ProfileField({
    Key key,
    this.text,
    this.color,
    this.icon,
    this.press,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      margin: EdgeInsets.symmetric(vertical: 5),
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
      width: size.width - 10,
      height: 70,
      decoration: BoxDecoration(
        color: kPrimaryLightColor,
        borderRadius: BorderRadius.circular(25),
      ),
      child: Row(
        children: [
          IconButton(
            icon: Icon(
              icon,
              size: 35,
              color: color,
            ),
            onPressed: press,
          ),
          Padding(
              padding: EdgeInsets.symmetric(horizontal: 20), child: Text(text))
        ],
      ),
    );
    // return SearchFieldContainer(
    //   child: TextField(
    //     onChanged: onChanged,
    //     cursorColor: kBackgroundColor,
    //     decoration: InputDecoration(
    //       icon: Icon(
    //         icon,
    //         color: kBackgroundColor,
    //         size: 35,
    //       ),
    //       suffixIcon: IconButton(
    //         icon: Icon(Icons.keyboard_voice_outlined),
    //         //onPressed open voice keyboard
    //         onPressed: () {},
    //         color: kBackgroundColor,
    //         iconSize: 30,
    //       ),
    //       hintText: hintText,
    //       border: InputBorder.none,
    //     ),
    //   ),
    // );
  }
}

// return Container(
//       width: size.width -5,
//       height: 100,
//       color: Colors.red,
//     );
