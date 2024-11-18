import 'package:flutter/material.dart';
import 'package:habit_note/DesignSystem/Components/Buttons/SquaredButton/squared_button_view_model.dart';
import 'package:habit_note/DesignSystem/Shared/colors.dart';

class SquaredButton extends StatelessWidget {
  final SquaredButtonViewModel viewModel;

  const SquaredButton._({required this.viewModel});

  static Widget instantiate({required SquaredButtonViewModel viewModel}) {
    return SquaredButton._(viewModel: viewModel);
  }

  @override
  Widget build(BuildContext context) {
    Color buttonBackgroundColor = primaryBrandColor;
    Color buttonLabelColor = secondaryBrandColor;
    BorderSide? borderSide;

    switch (viewModel.style) {
      case SquaredButtonStyle.primary:
        buttonBackgroundColor = primaryBrandColor;
        buttonLabelColor = secondaryBrandColor;
        break;
      case SquaredButtonStyle.secondary:
        buttonBackgroundColor = secondaryBrandColor;
        buttonLabelColor = inputTextColor;
        borderSide = const BorderSide(
          color: Color.fromARGB(64, 0, 0, 0)
        );
        break;
      default:
    }

    return ElevatedButton(
      onPressed: viewModel.onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: buttonBackgroundColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
          side: borderSide ?? BorderSide.none,
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 12),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              viewModel.label,
              style: TextStyle(
                color: buttonLabelColor
              ),
            ),
          ],
        ),
      ),
    );
  }
}