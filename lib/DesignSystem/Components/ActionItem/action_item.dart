import 'package:flutter/material.dart';
import 'package:habit_note/DesignSystem/Components/ActionItem/action_item_view_model.dart';
import 'package:habit_note/DesignSystem/Shared/colors.dart';

class ActionItem extends StatelessWidget {
  final ActionItemViewModel viewModel;

  const ActionItem._({required this.viewModel});

  static Widget instantiate({required ActionItemViewModel viewModel}) {
    return ActionItem._(viewModel: viewModel);
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Icon(
          viewModel.icon,
          size: 36,
          color: textColor,
        ),
        const SizedBox(width: 12,),
        Text(
          viewModel.label,
          style: const TextStyle(
            color: textColor,
            fontSize: 24,
            fontWeight: FontWeight.w500
          ),
        )
      ],
    );
  }
}