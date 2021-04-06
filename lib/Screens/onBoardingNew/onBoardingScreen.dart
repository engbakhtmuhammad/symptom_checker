import 'package:flutter/material.dart';
import 'package:fyp/Screens/Welcome/welcome_screen.dart';
import 'package:fyp/constants.dart';
import 'package:fyp/Screens/services/helper.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnBoardingScreen extends StatefulWidget {
  @override
  _OnBoardingScreenState createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  PageController pageController = PageController();
  final List<String> _titlesList = [
    'Consult Doctors',
    'Stay Update',
    'check your symptom that you feel.',
  ];

  final List<String> _subtitlesList = [
    'Get valueable suggestions by consulting meeting with doctors.',
    'get news and update from the world wide heath.',
    'Get Started'
  ];

  final List<dynamic> _imageList = [
    'assets/images/doctor.png',
    'assets/images/share.png',
    'assets/images/symptoms.png',
  ];
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kPrimaryColor, //change color
      body: Stack(
        children: <Widget>[
          PageView.builder(
            itemBuilder: (context, index) => getPage(
                _imageList[index],
                _titlesList[index],
                _subtitlesList[index],
                context,
                index + 1 == _titlesList.length),
            controller: pageController,
            itemCount: _titlesList.length,
            onPageChanged: (int index) {
              setState(() {
                _currentIndex = index;
              });
            },
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 50.0),
            child: Align(
              alignment: Alignment.bottomCenter,
              child: SmoothPageIndicator(
                controller: pageController,
                count: _titlesList.length,
                effect: ScrollingDotsEffect(
                    activeDotColor: Colors.white,
                    dotColor: Colors.grey.shade400, //change color
                    dotWidth: 8,
                    dotHeight: 8),
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget getPage(dynamic image, String title, String subTitle,
      BuildContext context, bool isLastPage) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        image is String
            ? Image.asset(
                image,
                width: 150,
                height: 150,
                fit: BoxFit.cover,
              )
            : Icon(
                image as IconData,
                color: Colors.white,
                size: 150,
              ),
        SizedBox(height: 40),
        Text(
          title.toUpperCase(),
          style: TextStyle(
              color: Colors.white, fontSize: 18.0, fontWeight: FontWeight.bold),
          textAlign: TextAlign.center,
        ),
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: _currentIndex + 1 == _titlesList.length
              ? OutlineButton(
                  onPressed: () {
                    setFinishedOnBoarding();
                    pushReplacement(context, new WelcomeScreen());
                  },
                  child: Text(
                    "Get Started",
                    style: TextStyle(
                        fontSize: 18.0,
                        color: Colors.white,
                        fontWeight: FontWeight.w500),
                  ),
                  borderSide: BorderSide(color: Colors.white),
                  shape: StadiumBorder(),
                )
              : Text(
                  subTitle,
                  style: TextStyle(color: Colors.white, fontSize: 14.0),
                  textAlign: TextAlign.center,
                ),
        ),
      ],
    );
  }

  Future<bool> setFinishedOnBoarding() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.setBool(FINISHED_ON_BOARDING, true);
  }
}
