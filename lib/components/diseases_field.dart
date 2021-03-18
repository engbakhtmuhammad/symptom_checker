import 'package:flutter/material.dart';
import 'package:fyp/constants.dart';

class DiseasesField extends StatelessWidget {
  final String overview;
  final String diagnosedBy;
  final String treatment;
  final String madeWorseBy;
  final String riskFactors;
  final String howCommon;

  const DiseasesField({
    Key key,
    this.overview,
    this.diagnosedBy,
    this.treatment,
    this.madeWorseBy,
    this.riskFactors,
    this.howCommon,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(15),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            ListTile(
              title: Text('Overview',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: kBackgroundColor,
                      fontSize: 20)),
              subtitle: Text(overview,
                  style: TextStyle(fontWeight: FontWeight.w500, fontSize: 16)),
            ),
            ListTile(
              title: Text('How Common',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: kBackgroundColor,
                      fontSize: 20)),
              subtitle: Text(howCommon,
                  style: TextStyle(fontWeight: FontWeight.w500, fontSize: 16)),
            ),
            ListTile(
              title: Text('Diagnosed By',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: kBackgroundColor,
                      fontSize: 20)),
              subtitle: Text(diagnosedBy,
                  style: TextStyle(fontWeight: FontWeight.w500, fontSize: 16)),
            ),
            ListTile(
              title: Text('Made Worsen By',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: kBackgroundColor,
                      fontSize: 20)),
              subtitle: Text(madeWorseBy,
                  style: TextStyle(fontWeight: FontWeight.w500, fontSize: 16)),
            ),
            ListTile(
              title: Text('Risk Factors',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: kBackgroundColor,
                      fontSize: 20)),
              subtitle: Text(riskFactors,
                  style: TextStyle(fontWeight: FontWeight.w500, fontSize: 16)),
            ),
            ListTile(
              title: Text('Treatment',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: kBackgroundColor,
                      fontSize: 20)),
              subtitle: Text(treatment,
                  style: TextStyle(fontWeight: FontWeight.w500, fontSize: 16)),
            )
          ],
        ));
  }
}
