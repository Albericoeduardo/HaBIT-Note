import 'package:flutter/material.dart';
import 'package:habit_note/DesignSystem/Components/Buttons/RoundedButton/rounded_button.dart';
import 'package:habit_note/DesignSystem/Components/Buttons/RoundedButton/rounded_button_view_model.dart';
import 'package:habit_note/DesignSystem/Shared/colors.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:habit_note/Scenes/OnBoarding/onboarding_router.dart';

class OnBoardingPage extends StatefulWidget {
  const OnBoardingPage({super.key});

  @override
  State<OnBoardingPage> createState() => _OnBoardingPageState();
}

class _OnBoardingPageState extends State<OnBoardingPage> {
  final PageController pageController = PageController();
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    String notesSvg = 'assets/amico.svg';
    String todoSvg = 'assets/cuate.svg';

    final Widget notesSvgWidget = SvgPicture.asset(notesSvg);
    final Widget todoSvgWidget = SvgPicture.asset(todoSvg);

    final List<Widget> onboardingScreens = [
      OnBoardingScreenContent(
        image: notesSvgWidget,
        title: "Take Notes",
        description: "Quickly capture what’s on your mind",
      ),
      OnBoardingScreenContent(
        image: todoSvgWidget,
        title: "To-dos",
        description: "List out your day-to-day tasks",
      ),
    ];

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.menu),
          onPressed: () {

          },
          color: primaryBrandColor,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(40),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "WELCOME TO",
              style: TextStyle(
                color: textColor,
                fontSize: 18
              ),
            ),
            const Text(
              "Habit Note",
              style: TextStyle(
                color: textColor,
                fontSize: 18,
                fontWeight: FontWeight.bold
              ),
            ),
            const SizedBox(height: 50,),
            Expanded(
              child: PageView(
                controller: pageController,
                onPageChanged: (index) {
                  setState(() {
                    currentIndex = index;
                  });
                },
                children: onboardingScreens,
              ),
            ),
            const SizedBox(height: 50,),
            const Text(
              "Take Notes",
              style: TextStyle(
                color: textColor,
                fontSize: 18,
                fontWeight: FontWeight.bold
              ),
            ),
            const Text(
              "Quickly capture what’s on your mind",
              style: TextStyle(
                color: textColor,
                fontSize: 18
              ),
            ),
            const SizedBox(height: 25,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(
                2,
                (index) => GestureDetector(
                  onTap: () {
                    pageController.animateToPage(
                      index,
                      duration: const Duration(milliseconds: 300),
                      curve: Curves.easeInOut
                    );
                  },
                  child: AnimatedContainer(
                    duration: const Duration(microseconds: 300),
                    margin: const EdgeInsets.symmetric(horizontal: 5),
                    height: 16,
                    width: currentIndex == index ? 64 : 32,
                    decoration: BoxDecoration(
                      color: currentIndex == index ? primaryBrandColor : Colors.white,
                      borderRadius: BorderRadius.circular(100)
                    ),
                  ),
                )
              ),
            ),
            const SizedBox(height: 50,),
            RoundedButton.instantiate(
              viewModel: RoundedButtonViewModel(
                label: "CREATE ACCOUNT",
                style: RoundedButtonStyle.primary,
                onPressed: () {
                  OnBoardingPageRouter.goToRegistrationPage(context);
                },
              )
            ),
            const SizedBox(height: 25,),
            RoundedButton.instantiate(
              viewModel: RoundedButtonViewModel(
                label: "LOG IN",
                style: RoundedButtonStyle.secondary,
                onPressed: () {
                  OnBoardingPageRouter.goToLoginPage(context);
                },
              )
            ),
          ],
        ),
      ),
    );
  }
}

class OnBoardingScreenContent extends StatelessWidget {
  final Widget image;
  final String title;
  final String description;

  const OnBoardingScreenContent({
    required this.image,
    required this.title,
    required this.description,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return image;
  }
}