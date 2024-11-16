enum SquaredButtonStyle {
  primary,
  secondary
}

class SquaredButtonViewModel {
  final SquaredButtonStyle style;
  final String label;
  final Function() onPressed;

  SquaredButtonViewModel({
    required this.style,
    required this.label,
    required this.onPressed
  });
}