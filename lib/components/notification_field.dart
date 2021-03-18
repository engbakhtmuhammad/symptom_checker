import 'package:flutter/material.dart';
import 'package:fyp/constants.dart';

class NotificationField extends StatelessWidget {
  final String imageUrl;
  final String symptom;
  final String overview;

  const NotificationField({
    Key key,
    this.imageUrl,
    this.symptom,
    this.overview,
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
          height: size.height * .11,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(25),
              color: kPrimaryLightColor),
          child: Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 15, right: 10),
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
                          height: size.height * .034,
                          width: size.width * .65,
                          child: SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: Row(
                              children: [
                                Text(
                                  symptom,
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(fontWeight: FontWeight.w600),
                                ),
                                Text(overview, style: TextStyle(fontSize: 12)),
                              ],
                            ),
                          )),
                      SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          children: [
                            RaisedButton(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                              onPressed: () {},
                              color: Colors.teal[100],
                              textColor: Colors.grey[800],
                              child: Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 24),
                                child: Text("Delete".toUpperCase(),
                                    style: TextStyle(fontSize: 10)),
                              ),
                            ),
                            SizedBox(
                              width: size.width * .03,
                            ),
                            RaisedButton(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                              onPressed: () {},
                              color: kPrimaryColor,
                              textColor: Colors.white,
                              child: Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 24),
                                child: Text(" View ".toUpperCase(),
                                    style: TextStyle(fontSize: 10)),
                              ),
                            ),
                          ],
                        ),
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
