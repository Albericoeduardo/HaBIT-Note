import 'package:flutter/material.dart';
import 'package:habit_note/DesignSystem/Components/BottomNavigationBar/bottom_nav_bar.dart';
import 'package:habit_note/DesignSystem/Components/BottomNavigationBar/bottom_nav_bar_view_model.dart';

class BottomNavBarSampleScreen extends StatefulWidget {
  const BottomNavBarSampleScreen({super.key});

  @override
  State<BottomNavBarSampleScreen> createState() => _BottomNavBarSampleScreenState();
}

class _BottomNavBarSampleScreenState extends State<BottomNavBarSampleScreen> {
  int actualIndex = 0;

  @override
  Widget build(BuildContext context) {
    final List<Widget> pages = [
      const Center(child: Text('Home Page')),
      const Center(child: Text('Messages Page')),
      const Center(child: Text('Label Page')),
      const Center(child: Text('Profile Page')),
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Bottom Tab Bar Page'),
      ),
      body: pages[actualIndex],
      bottomNavigationBar: BottomNavBar.instantiate(
        viewModel: BottomNavBarViewModel(
          bottomTabs: [
            const BottomNavigationBarItem(
              icon: Icon(Icons.sticky_note_2_outlined),
              label: "Notes",
            ),
            const BottomNavigationBarItem(
              icon: Icon(Icons.image_search),
              label: "OCR",
            ),
            const BottomNavigationBarItem(
              icon: Icon(Icons.help_outline),
              label: "Help",
            ),
            const BottomNavigationBarItem(
              icon: Icon(Icons.person_2_outlined),
              label: "Me",
            )
          ],
          onIndexChanged: (index) {
            setState(() {
              actualIndex = index;
            });
          },
        ),
        currentIndex: actualIndex,
      ),
    );
  }
}