import 'package:flutter/material.dart';
import 'package:habit_note/Scenes/HomePage/home_page_factory.dart';

class LoginPageRouter {
  static void goToHomePage(BuildContext context, username, emailAddress, password) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => HomePageFactory.create(username, emailAddress, password))
    );
  }
}