import 'package:flutter/material.dart';

class SymptomsField extends StatelessWidget {
  final String symptom;

  const SymptomsField({
    Key key,
    this.symptom,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Column(children: [
      SizedBox(
        height: size.height * .01,
      ),
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30),
        child: Container(
          width: size.width,
          height: size.height * .065,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20), color: Colors.teal[400]),
          child: ListTile(
            title: Padding(
              padding: const EdgeInsets.only(left: 10),
              child: Text(
                symptom,
                style: TextStyle(color: Colors.white),
              ),
            ),
            trailing: IconButton(
                icon: Icon(Icons.add), color: Colors.white, onPressed: () {}),
          ),
        ),
      ),
    ]);
  }
}
