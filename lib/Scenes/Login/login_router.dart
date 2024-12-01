import 'package:flutter/material.dart';
import 'package:habit_note/Scenes/HomePage/home_page_factory.dart';
import 'package:habit_note/Scenes/Registration/registration_factory.dart';

class LoginPageRouter {
  static void goToRegistrationPage(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => RegistrationPageFactory.create())
    );
  }

  static void goToHomePage(BuildContext context, emailAddress, password) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => HomePageFactory.create(emailAddress, password))
    );
  }
}