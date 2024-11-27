import 'package:flutter/material.dart';
import 'package:habit_note/Scenes/HomePage/home_page_factory.dart';
import 'package:habit_note/Scenes/Login/login_factory.dart';

class RegistrationPageRouter {
  static void goToHomePage(BuildContext context, usernameController, emailAddress, password) {
    //WIP: Logar com o service da firebase, passando os dados de registro
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => HomePageFactory.create(usernameController, emailAddress, password))
    );
  }

  static void goToLoginPage(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => LoginPageFactory.create())
    );
  }
}
