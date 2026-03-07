import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:islami_app/screens/on_boarding_screen.dart';

import 'home_view.dart';

class IntroScreen extends StatefulWidget {
  static const String routeName = "IntroScreen";

  @override
  State<IntroScreen> createState() => _IntroScreenState();
}

class _IntroScreenState extends State<IntroScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(seconds: 3), () {
      Navigator.pushNamed(context, OnBoardingScreen.routeName);
    });
  }

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Stack(
        children: [
          Image.asset(
            'assets/images/background.png',
            width: double.infinity,
            height: double.infinity,
            fit: BoxFit.cover,
          ),
          SafeArea(
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Image.asset(
                    'assets/images/mosque.png',
                    width: width * 0.7,
                  ).zoomIn(duration: Duration(milliseconds: 600)),
                  Image.asset(
                    'assets/images/route_logo.png',
                    width: width * 0.5,
                  ).zoomIn(duration: Duration(microseconds: 600)),
                ],
              ),
            ),
          ),
          Center(
            child: Image.asset(
              'assets/images/islami_logo.png',
              width: width * 0.4,
            ).zoomIn(duration: Duration(milliseconds: 600)),
          ),
          Positioned(
            left: 0,
            top: height * 0.2,
            child: Image.asset("assets/images/left_shape.png").slideInLeft(),
          ),
          Positioned(
            right: 0,
            bottom: height * 0.2,
            child: Image.asset("assets/images/right_shape.png").slideInRight(),
          ),
          Positioned(
            top: 0,
            right: width * 0.09,
            child: Image.asset('assets/images/glow.png').slideDown(),
          ),
        ],
      ),
    );
  }
}
