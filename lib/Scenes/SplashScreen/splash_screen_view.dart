import 'dart:async';

import 'package:flutter/material.dart';
import 'package:habit_note/DesignSystem/Shared/colors.dart';
import 'package:habit_note/Scenes/SplashScreen/splash_screen_router.dart';

class SplashScreenPage extends StatefulWidget {
  const SplashScreenPage({super.key});

  @override
  State<SplashScreenPage> createState() => _SplashScreenPageState();
}

class _SplashScreenPageState extends State<SplashScreenPage> {
  @override
  void initState(){
    super.initState();
    Timer(const Duration(seconds: 2), () {
      SplashScreenRouter.goToOnBoardingPage(context);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primaryBrandColor,
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const SizedBox(height: 160,),
                  Image.asset('assets/Logo_1200x1200.png', height: 250,),
                ],
              ),
              const Text(
                '© Copyright HABIT 2021. All rights reserved'
              ),
            ],
          ),
        ),
      ),
    );
  }
}