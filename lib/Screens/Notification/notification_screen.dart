import 'package:flutter/material.dart';
import 'package:fyp/Screens/Notification/components/body.dart';

class NotificationScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Body(),
    );
  }
}

// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';

// void main() {
//   runApp(possibleCondition());
// }

// class possibleCondition extends StatelessWidget {
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: Scaffold(
//         appBar: AppBar(
//           title: Text("Possible Conditions"),
//           flexibleSpace: Image(
//             image: AssetImage("assets/images/back1.png"),
//             fit: BoxFit.cover,
//           ),
//         ),
//         backgroundColor: Colors.red,
//         body: SafeArea(
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: <Widget>[
//               SizedBox(
//                 width: 20,
//                 height: 40,
//               ),
//               Container(
//                 margin: EdgeInsets.symmetric(vertical: 10, horizontal: 60),
//                 child: Text(
//                   "Disease 1",
//                   style: TextStyle(
//                       fontSize: 20,
//                       fontWeight: FontWeight.bold,
//                       color: Colors.grey),
//                 ),
//               ),
//               Container(
//                 margin: EdgeInsets.symmetric(vertical: 10, horizontal: 60),
//                 child: Text(
//                   "Disease 2",
//                   style: TextStyle(
//                       fontSize: 20,
//                       fontWeight: FontWeight.bold,
//                       color: Colors.grey),
//                 ),
//               ),
//               Container(
//                 margin: EdgeInsets.symmetric(vertical: 10, horizontal: 60),
//                 child: Text(
//                   "Disease 3",
//                   style: TextStyle(
//                       fontSize: 20,
//                       fontWeight: FontWeight.bold,
//                       color: Colors.grey),
//                 ),
//               ),
//               Container(
//                 margin: EdgeInsets.symmetric(vertical: 10, horizontal: 60),
//                 child: Text(
//                   "Disease 4",
//                   style: TextStyle(
//                       fontSize: 20,
//                       fontWeight: FontWeight.bold,
//                       color: Colors.grey),
//                 ),
//               ),
//               Container(
//                 margin: EdgeInsets.symmetric(vertical: 10, horizontal: 60),
//                 child: Text(
//                   "Disease 5",
//                   style: TextStyle(
//                       fontSize: 20,
//                       fontWeight: FontWeight.bold,
//                       color: Colors.grey),
//                 ),
//               ),
//               SizedBox(
//                 width: 10,
//                 height: 60,
//               ),
//               Container(
//                 color: Colors.grey,
//                 margin: EdgeInsets.symmetric(vertical: 0, horizontal: 50),
//                 child: SizedBox(
//                   width: 350,
//                   height: 4,
//                 ),
//               ),
//               Container(
//                 margin: EdgeInsets.symmetric(vertical: 0, horizontal: 30),
//                 child: Text(
//                   "Post these symptoms to doctors to get reply from them and suggestions for treatment",
//                   style: TextStyle(
//                     color: Colors.black54,
//                     fontSize: 20,
//                   ),
//                 ),
//               ),
//               SizedBox(
//                 width: 10,
//                 height: 100,
//               ),
//               Container(
//                 padding: EdgeInsets.all(5),
//                 margin: EdgeInsets.symmetric(vertical: 0, horizontal: 40),
//                 child: RaisedButton(
//                   shape: RoundedRectangleBorder(
//                       borderRadius: BorderRadius.circular(20),
//                       side: BorderSide(color: Colors.teal)),
//                   onPressed: () {},
//                   color: Colors.teal,
//                   child: Text(
//                     "  POST TO DOCTORS  ",
//                     style: TextStyle(
//                         fontSize: 20, wordSpacing: 10, color: Colors.white),
//                   ),
//                 ),
//               ),
//               RaisedButton(
//                 onPressed: () {
//                   Navigator.pop(context);
//                 },
//                 child: Text("Go back"),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
