import 'package:flutter/material.dart';
import 'package:habit_note/DesignSystem/Components/BottomNavigationBar/bottom_nav_bar_view_model.dart';
import 'package:habit_note/DesignSystem/Shared/colors.dart';

class BottomNavBar extends StatelessWidget {
  final BottomNavBarViewModel viewModel;
  final int currentIndex;

  const BottomNavBar._({required this.viewModel, required this.currentIndex});

  static Widget instantiate({required BottomNavBarViewModel viewModel, required int currentIndex}) {
    return BottomNavBar._(viewModel: viewModel, currentIndex: currentIndex);
  }

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      items: viewModel.bottomTabs,
      type: BottomNavigationBarType.fixed,
      showSelectedLabels: true,
      currentIndex: currentIndex,
      onTap: viewModel.onIndexChanged,
      selectedItemColor: textColor,
      unselectedItemColor: textColor,
      backgroundColor: backgroundColor,
      iconSize: 36,
      selectedFontSize: 18,
      unselectedFontSize: 18,
    );
  }
}
