import 'package:flutter/material.dart';
import 'package:fyp/constants.dart';

class PossibleConditionField extends StatelessWidget {
  final String possibleCondition;
  PossibleConditionField({Key key, this.possibleCondition}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.only(top: 10, left: 10, right: 10),
      child: Container(
        width: size.width,
        height: 50,
        decoration: BoxDecoration(
            color: kPrimaryLightColor, borderRadius: BorderRadius.circular(10)),
        child: GestureDetector(
          onTap: () {},
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Text(
              possibleCondition,
              style: TextStyle(fontSize: 13),
            ),
          ),
        ),
      ),
    );
  }
}
