import 'package:flutter/material.dart';

class OnBoardingModel {
  String imagePath;
  String title;
  String ?subTitle;
  OnBoardingModel({required this.imagePath,required this.title,this.subTitle});


}
List<OnBoardingModel> onBoardingModel=[
  OnBoardingModel(
    imagePath: 'assets/images/onboarding_logo1.png',
    title: 'Welcome To Islmi App',
  ),
  OnBoardingModel(
    imagePath:'assets/images/onboarding_logo2.png',
    title:'Welcome To Islami',
    subTitle:'We Are Very Excited To Have You In Our Community'
  ),
  OnBoardingModel(
      imagePath:'assets/images/onboarding_logo3.png',
      title:'Reading the Quran',
      subTitle:'Read, and your Lord is the Most Generous'
  ),
  OnBoardingModel(
      imagePath:'assets/images/onboarding_logo4.png',
      title:'Bearish',
      subTitle:'Praise the name of your Lord, the Most High'
  ),
  OnBoardingModel(
      imagePath:'assets/images/onboarding_logo5.png',
      title:'Holy Quran Radio',
      subTitle:'You can listen to the Holy Quran Radio through the application for free and easily'
  ),

];