import 'package:flutter/material.dart';

class Background extends StatelessWidget {
  final Widget child;
  const Background({
    Key key,
    @required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      height: size.height,
      width: double.infinity,
      child: Stack(
        alignment: Alignment.center,
        children: <Widget>[
          Positioned(
            top: size.height * -0.45,
            left: 0,
            child: Image.asset(
              "assets/images/back1.png",
              width: size.width,
              fit: BoxFit.cover,
            ),
          ),
          child,
        ],
      ),
    );
  }
}
