import 'package:flutter/material.dart';
import 'package:habit_note/DesignSystem/Components/LinkedLabel/linked_label.dart';
import 'package:habit_note/DesignSystem/Components/LinkedLabel/linked_label_view_model.dart';

class LinkedLabelSampleScreen extends StatelessWidget {
  const LinkedLabelSampleScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Linked Label Sample Screen"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(64.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            LinkedLabel.instantiate(
              viewModel: LinkedLabelViewModel(
                fullText: "Already have an account? Login here",
                linkedText: "Login here",
                onLinkTap: () {}
              )
            ),
            const SizedBox(height: 20,),
            LinkedLabel.instantiate(
              viewModel: LinkedLabelViewModel(
                fullText: "Dont have an account yet? Create an account here",
                linkedText: "Create an account here",
                onLinkTap: () {}
              )
            )
          ],
        ),
      ),
    );
  }
}