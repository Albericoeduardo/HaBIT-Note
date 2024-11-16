import 'package:flutter/material.dart';
import 'package:habit_note/DesignSystem/Components/Buttons/RoundedButton/rounded_button.dart';
import 'package:habit_note/DesignSystem/Components/Buttons/RoundedButton/rounded_button_view_model.dart';

class RoundedButtonSampleScreen extends StatelessWidget {
  const RoundedButtonSampleScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Rounded Button Sample Screen"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(48.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            RoundedButton.instantiate(
              viewModel: RoundedButtonViewModel(
                label: "CREATE ACCOUNT",
                onPressed: () {},
                style: RoundedButtonStyle.primary,
              )
            ),
            const SizedBox(height: 20,),
            RoundedButton.instantiate(
              viewModel: RoundedButtonViewModel(
                label: "LOG IN",
                onPressed: () {},
                style: RoundedButtonStyle.secondary,
              )
            ),
            const SizedBox(height: 20,),
            RoundedButton.instantiate(
              viewModel: RoundedButtonViewModel(
                label: "LOG OUT",
                icon: Icons.logout_outlined,
                onPressed: () {},
                style: RoundedButtonStyle.secondary,
              )
            )
          ],
        ),
      ),
    );
  }
}