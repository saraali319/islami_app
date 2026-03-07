import 'package:flutter/material.dart';
import 'package:islami_app/screens/home_view.dart';
import 'package:islami_app/screens/intro_screen.dart';
import 'package:islami_app/screens/on_boarding_screen.dart';

void main(){
  runApp(MyApp());
}
class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
  return MaterialApp(
    debugShowCheckedModeBanner: false,
    routes:{
      IntroScreen.routeName:(context)=>IntroScreen(),
      OnBoardingScreen.routeName:(context)=>OnBoardingScreen(),
      HomeScreen.routeName:(context)=>HomeScreen(),

    },
        initialRoute: IntroScreen.routeName,
  );
  }

}