import 'package:flutter/material.dart';
import 'package:habit_note/DesignSystem/Components/InputField/input_field.dart';
import 'package:habit_note/DesignSystem/Components/InputField/input_field_view_model.dart';

class InputFieldSampleScreen extends StatelessWidget {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController = TextEditingController();

  InputFieldSampleScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Input Field Sample Screen'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            InputField.instantiate(
              viewModel: InputFieldViewModel(
                controller: nameController,
                placeholder: 'Display Name',
                isPassword: false,
                isEnabled: true,
                prefixIcon: const Icon(Icons.person_outline),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                  return 'Please enter your display name here';
                  } else if (!RegExp(r'^[a-zA-ZÀ-ÿ\s]+$').hasMatch(value)) {
                  return 'Somente letras são permitidas!';
                  }
                  return null;
                }
              ),
            ),
            const SizedBox(height: 20,),
            InputField.instantiate(
              viewModel: InputFieldViewModel(
                controller: emailController,
                placeholder: 'Email Address',
                isPassword: false,
                isEnabled: true,
                prefixIcon: const Icon(Icons.email_outlined),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                  return 'Please enter your email';
                  } else if (!RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(value)) {
                  return 'Please enter a valid email address';
                  }
                  return null;
                }
              ),
            ),
            const SizedBox(height: 20,),
            InputField.instantiate(
              viewModel: InputFieldViewModel(
                controller: passwordController,
                placeholder: 'Password',
                isPassword: true,
                isEnabled: true,
                prefixIcon: const Icon(Icons.lock_outline),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'This field is required';
                  } else if (value.length < 6) {
                    return 'Require at least 6 characters';
                  }
                  return null;
                }
              ),
            ),
            const SizedBox(height: 20,),
            InputField.instantiate(
              viewModel: InputFieldViewModel(
                controller: confirmPasswordController,
                placeholder: 'Confirm Password',
                isPassword: true,
                isEnabled: true,
                validator: (value) {
                  if (passwordController.value != confirmPasswordController.value) {
                    return 'Password does not match';
                  }
                  return null;
                }
              ),
            )
          ],
        ),
      ),
    );
  }
}