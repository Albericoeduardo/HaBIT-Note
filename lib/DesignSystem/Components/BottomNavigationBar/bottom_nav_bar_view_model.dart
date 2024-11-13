import 'package:flutter/material.dart';

class BottomNavBarViewModel {
  final Function(int)? onIndexChanged;
  final List<BottomNavigationBarItem> bottomTabs;

  BottomNavBarViewModel({
    required this.bottomTabs,
    this.onIndexChanged
  });
}
