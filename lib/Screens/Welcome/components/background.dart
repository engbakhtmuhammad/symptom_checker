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
            top: 0,
            child: Image.asset("assets/images/back2.png",
                width: size.width,
                height: size.height * .739,
                fit: BoxFit.fill),
          ),
          // Positioned(
          //     bottom: 0,
          //     left: 0,
          //     child: Container(
          //       height: size.height * .1,
          //       width: size.width,
          //       decoration: BoxDecoration(
          //           color: kBackgroundColor,
          //           borderRadius: BorderRadius.only(
          //               topLeft: Radius.circular(35),
          //               topRight: Radius.circular(35))),
          //     )),
          child,
        ],
      ),
    );
  }
}
