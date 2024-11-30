import 'package:flutter/material.dart';
import 'package:habit_note/Scenes/OnBoarding/onboarding_factory.dart';

class SplashScreenRouter {
  static void goToOnBoardingPage(BuildContext context){
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => OnBoardingPageFactory.create())
    );
  }
}