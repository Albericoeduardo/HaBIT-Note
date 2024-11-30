import 'package:flutter/material.dart';
import 'package:habit_note/Scenes/Login/login_factory.dart';

class OnBoardingPageRouter {
  static void goToLoginPage(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => LoginPageFactory.create())
    );
  }
}