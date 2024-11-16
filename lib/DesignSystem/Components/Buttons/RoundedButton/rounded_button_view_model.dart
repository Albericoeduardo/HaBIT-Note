import 'package:flutter/material.dart';

enum RoundedButtonStyle {
  primary,
  secondary
}

class RoundedButtonViewModel {
  final RoundedButtonStyle style;
  final String label;
  final IconData? icon;
  final Function() onPressed;

  RoundedButtonViewModel({
    required this.style,
    required this.label,
    required this.onPressed,
    this.icon
  });
}