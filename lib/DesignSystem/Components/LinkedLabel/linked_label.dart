import 'package:flutter/material.dart';
import 'package:habit_note/DesignSystem/Components/LinkedLabel/linked_label_view_model.dart';
import 'package:habit_note/DesignSystem/Shared/colors.dart';

class LinkedLabel extends StatelessWidget {
  final LinkedLabelViewModel viewModel;

  const LinkedLabel._({required this.viewModel});

  static Widget instantiate({required LinkedLabelViewModel viewModel}) {
    return LinkedLabel._(viewModel: viewModel);
  }

  @override
  Widget build(BuildContext context) {
    final int startIndex = viewModel.fullText.indexOf(viewModel.linkedText);
    
    if (startIndex == -1) {
      return Text(viewModel.fullText);
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          viewModel.fullText.substring(0, startIndex),
          style: const TextStyle(color: textColor, fontSize: 18),
        ),
        GestureDetector(
          onTap: viewModel.onLinkTap,
          child: Text(
            viewModel.linkedText,
            style: const TextStyle(color: primaryBrandColor, fontSize: 18),
          ),
        )
      ],
    );
  }
}
