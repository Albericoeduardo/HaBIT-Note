import 'package:flutter/material.dart';
import 'package:habit_note/DesignSystem/Components/InputField/input_field_view_model.dart';
import 'package:habit_note/DesignSystem/Shared/colors.dart';

class InputField extends StatefulWidget {
  final InputFieldViewModel viewModel;

  const InputField._({required this.viewModel});

  static Widget instantiate({required InputFieldViewModel viewModel}) {
    return InputField._(viewModel: viewModel);
  }

  @override
  State<InputField> createState() => _InputFieldState();
}

class _InputFieldState extends State<InputField> {
  late bool obscureText;
  String? errorMsg;

  @override
  void initState() {
    super.initState();
    obscureText = widget.viewModel.isPassword;
    widget.viewModel.controller.addListener(validateInput);
  }

  void validateInput() {
    setState(() {
      errorMsg = widget.viewModel.validator?.call(widget.viewModel.controller.text);
    });
  }

  void togglePasswordVisibility() {
    setState(() {
      obscureText = !obscureText;
    });
  }

  @override
  Widget build(BuildContext context) {
    InputDecoration decoration = InputDecoration(
      filled: true,
      prefixIcon: widget.viewModel.prefixIcon,
      prefixIconColor: primaryBrandColor,
      suffixIcon: widget.viewModel.isPassword
        ? IconButton(
          icon: Icon(obscureText ? Icons.visibility_off : Icons.visibility, color: inputTextColor,),
          onPressed: togglePasswordVisibility,
        ) : 
        widget.viewModel.suffixIcon,
      fillColor: widget.viewModel.isEnabled ? Colors.white : Colors.grey.shade400,
      hintText: widget.viewModel.placeholder.isNotEmpty ? widget.viewModel.placeholder : null,
      hintStyle: const TextStyle(color: inputTextColor),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(4),
        borderSide: const BorderSide(color: inputTextColor),
      ),
      errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(4),
        borderSide: const BorderSide(color: Colors.red),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(4),
        borderSide: const BorderSide(color: inputTextColor),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(4),
        borderSide: const BorderSide(color: inputTextColor),
      ),
      disabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(4),
        borderSide: const BorderSide(color: Colors.grey),
      ),
      errorText: errorMsg,
    );

    return TextFormField(
      controller: widget.viewModel.controller,
      obscureText: obscureText,
      decoration: decoration,
      style: const TextStyle(color: Colors.black),
      enabled: widget.viewModel.isEnabled
    );
  }
}