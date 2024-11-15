import 'package:flutter/material.dart';
import 'package:habit_note/DesignSystem/Components/ActionItem/action_item.dart';
import 'package:habit_note/DesignSystem/Components/ActionItem/action_item_view_model.dart';

class ActionItemSampleScreen extends StatelessWidget {
  const ActionItemSampleScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Action Item Sample Screen"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ActionItem.instantiate(
              viewModel: ActionItemViewModel(
                onTap: () {},
                label: "Add note",
                icon: Icons.keyboard
              )
            ),
            const SizedBox(height: 10),
            ActionItem.instantiate(
              viewModel: ActionItemViewModel(
                onTap: () {},
                label: "Add to-do",
                icon: Icons.check_box
              )
            ),
            const SizedBox(height: 40),
            ActionItem.instantiate(
              viewModel: ActionItemViewModel(
                onTap: () {},
                label: "Take photo",
                icon: Icons.photo_camera_rounded
              )
            ),
            const SizedBox(height: 10),
            ActionItem.instantiate(
              viewModel: ActionItemViewModel(
                onTap: () {},
                label: "Choose from gallery",
                icon: Icons.photo_library_rounded
              )
            )
          ],
        ),
      ),
    );
  }
}