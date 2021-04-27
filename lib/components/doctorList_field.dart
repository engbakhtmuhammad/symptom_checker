import 'package:flutter/material.dart';
import 'package:fyp/constants.dart';

class DoctorListField extends StatelessWidget {
  final String imageUrl;
  final String name;
  final String bio;

  const DoctorListField({Key key, this.imageUrl, this.name, this.bio})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Column(children: [
      SizedBox(
        height: size.height * .01,
      ),
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: Container(
          width: size.width,
          height: size.height * .1,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(25),
              color: kPrimaryLightColor),
          child: Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 10, right: 15),
                child: CircleAvatar(
                  radius: size.height * .04,
                  backgroundImage: AssetImage(imageUrl),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(right: 10),
                child: Text(
                  name,
                  style: TextStyle(fontSize: 16),
                ),
              ),
            ],
          ),
        ),
      ),
    ]);
  }
}
