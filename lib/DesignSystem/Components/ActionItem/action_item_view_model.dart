import 'package:flutter/material.dart';

class ActionItemViewModel {
  final Function() onTap;
  final String label;
  final IconData icon;

  ActionItemViewModel({
    required this.onTap,
    required this.label,
    required this.icon
  });
}