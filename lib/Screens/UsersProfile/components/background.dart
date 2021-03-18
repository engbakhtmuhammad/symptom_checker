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
      color: Colors.white,
      height: size.height,
      width: double.infinity,
      child: Stack(
        alignment: Alignment.center,
        children: <Widget>[
          Positioned(
            top: -300,
            left: 0,
            child: Image.asset(
              "assets/images/back6.png",
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
