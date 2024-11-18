import 'package:flutter/material.dart';
import 'package:habit_note/DesignSystem/Components/Buttons/RoundedButton/rounded_button_view_model.dart';
import 'package:habit_note/DesignSystem/Shared/colors.dart';

class RoundedButton extends StatelessWidget {
  final RoundedButtonViewModel viewModel;

  const RoundedButton._({required this.viewModel});

  static Widget instantiate({required RoundedButtonViewModel viewModel}) {
    return RoundedButton._(viewModel: viewModel);
  }

  @override
  Widget build(BuildContext context) {
    Color buttonBackgroundColor = primaryBrandColor;
    Color buttonLabelColor = secondaryBrandColor;

    switch (viewModel.style) {
      case RoundedButtonStyle.primary:
        buttonBackgroundColor = primaryBrandColor;
        buttonLabelColor = secondaryBrandColor;
        break;
      case RoundedButtonStyle.secondary:
        buttonBackgroundColor = secondaryBrandColor;
        buttonLabelColor = primaryBrandColor;
        break;
      default:
    }

    return ElevatedButton(
      onPressed: viewModel.onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: buttonBackgroundColor
      ),
      child: viewModel.icon != null ?
      Padding(
        padding: const EdgeInsets.all(12.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              viewModel.icon,
              size: 24,
              color: buttonLabelColor,
            ),
            const SizedBox(width: 16,),
            Text(
              viewModel.label,
              style: TextStyle(
                color: buttonLabelColor
              ),
            )
          ],
        ),
      ) :
      Padding(
        padding: const EdgeInsets.all(12.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              viewModel.label,
              style: TextStyle(
                color: buttonLabelColor
              ),
            )
          ],
        ),
      )
    );
  }
}