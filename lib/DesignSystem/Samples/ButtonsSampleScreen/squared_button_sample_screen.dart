import 'package:flutter/material.dart';
import 'package:habit_note/DesignSystem/Components/Buttons/SquaredButton/squared_button.dart';
import 'package:habit_note/DesignSystem/Components/Buttons/SquaredButton/squared_button_view_model.dart';

class SquaredButtonSampleScreen extends StatelessWidget {
  const SquaredButtonSampleScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Squared Button Sample Scrren"),
      ),
      body: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SquaredButton.instantiate(
              viewModel: SquaredButtonViewModel(
                label: "No",
                onPressed: () {},
                style: SquaredButtonStyle.secondary
              )
            ),
            const SizedBox(width: 8,),
            SquaredButton.instantiate(
              viewModel: SquaredButtonViewModel(
                label: "Exit",
                onPressed: () {},
                style: SquaredButtonStyle.primary
              )
            )
          ],
        ),
      ),
    );
  }
}