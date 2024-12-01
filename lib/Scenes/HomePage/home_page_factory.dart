import 'package:flutter/material.dart';
import 'package:habit_note/Scenes/HomePage/home_page_view.dart';

class HomePageFactory {
  static Widget create(emailAddress, password) {
    print("HomePageFactory" + emailAddress + password);
    return const HomePage();
  }
}
