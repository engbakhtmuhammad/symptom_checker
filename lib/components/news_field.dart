import 'package:flutter/material.dart';
import 'package:fyp/constants.dart';

class NewsField extends StatelessWidget {
  final String imageUrl;
  final String text;

  const NewsField({
    Key key,
    this.imageUrl,
    this.text,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Column(children: [
      SizedBox(
        height: size.height * .01,
      ),
      Container(
        width: size.width,
        height: size.height * .14,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20), color: kPrimaryLightColor),
        child: Row(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 10),
              child: Container(
                width: size.width * .25,
                height: size.height * .118,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(imageUrl),
                    fit: BoxFit.cover,
                  ),
                  borderRadius: BorderRadius.circular(20),
                  color: kPrimaryLightColor,
                ),
              ),
            ),
            Container(
              width: size.width * .7,
              height: size.height * .118,
              child: Padding(
                padding: const EdgeInsets.only(left: 10, right: 10),
                child: Text(
                  text,
                  maxLines: 6,
                  style: TextStyle(fontSize: 14.2),
                ),
              ),
            ),
          ],
        ),
      ),
    ]);
  }
}
