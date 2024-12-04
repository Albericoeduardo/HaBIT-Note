import 'package:flutter/material.dart';
import 'package:habit_note/Scenes/Login/login_factory.dart';
import 'package:habit_note/Scenes/Registration/registration_factory.dart';

class OnBoardingPageRouter {
  static void goToLoginPage(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => LoginPageFactory.create())
    );
  }

  static void goToRegistrationPage(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => RegistrationPageFactory.create())
    );
  }
}