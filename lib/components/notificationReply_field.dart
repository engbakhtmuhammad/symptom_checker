import 'package:flutter/material.dart';
import 'package:fyp/constants.dart';

class NotificationReplyField extends StatelessWidget {
  final String imageUrl;
  final String symptoms;

  const NotificationReplyField({
    Key key,
    this.imageUrl,
    this.symptoms,
  }) : super(key: key);
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
          height: size.height * .13,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(25),
              color: kPrimaryLightColor),
          child: Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 18, right: 15),
                child: CircleAvatar(
                  radius: size.height * .042,
                  backgroundImage: AssetImage(imageUrl),
                ),
              ),
              Padding(
                  padding: const EdgeInsets.only(right: 10),
                  child: Column(
                    children: [
                      Container(
                          height: size.height * .05,
                          width: size.width * .65,
                          child: SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: Row(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(left: 10),
                                  child: Text(
                                    symptoms,
                                  ),
                                ),
                              ],
                            ),
                          )),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          RaisedButton(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20.0),
                            ),
                            onPressed: () {},
                            color: kPrimaryColor,
                            textColor: Colors.white,
                            child: Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 80),
                              child: Text("Reply".toUpperCase(),
                                  style: TextStyle(fontSize: 10)),
                            ),
                          ),
                        ],
                      )
                    ],
                  )),
            ],
          ),
        ),
      ),
    ]);
  }
}
