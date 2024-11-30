import 'package:flutter/material.dart';
import 'package:habit_note/DesignSystem/Components/Buttons/RoundedButton/rounded_button.dart';
import 'package:habit_note/DesignSystem/Components/Buttons/RoundedButton/rounded_button_view_model.dart';
import 'package:habit_note/DesignSystem/Components/InputField/input_field.dart';
import 'package:habit_note/DesignSystem/Components/InputField/input_field_view_model.dart';
import 'package:habit_note/DesignSystem/Components/LinkedLabel/linked_label.dart';
import 'package:habit_note/DesignSystem/Components/LinkedLabel/linked_label_view_model.dart';
import 'package:habit_note/DesignSystem/Shared/colors.dart';
import 'package:habit_note/Scenes/Registration/registration_router.dart';

class RegistrationPage extends StatefulWidget {
  const RegistrationPage({super.key});

  @override
  State<RegistrationPage> createState() => _RegistrationPageState();
}

class _RegistrationPageState extends State<RegistrationPage> {
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Create Account",
          style: TextStyle(
            color: textColor,
            fontSize: 18
          ),
        ),
        iconTheme: const IconThemeData(color: primaryBrandColor),
      ),
      body: Padding(
        padding: const EdgeInsets.all(40),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Let's get to know you !",
                  style: TextStyle(
                    color: textColor,
                    fontSize: 18,
                    fontWeight: FontWeight.bold
                  ),
                ),
                Text(
                  "Enter your details to continue",
                  style: TextStyle(
                    color: textColor,
                    fontSize: 18
                  ),
                ),
              ],
            ),
            const SizedBox(height: 25,),
            InputField.instantiate(
              viewModel: InputFieldViewModel(
                controller: usernameController,
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
            const SizedBox(height: 25,),
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
            const SizedBox(height: 25,),
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
            const SizedBox(height: 25,),
            InputField.instantiate(
              viewModel: InputFieldViewModel(
                controller: confirmPasswordController,
                placeholder: 'Confirm Password',
                isPassword: true,
                isEnabled: true,
                validator: (value) {
                  if (passwordController.value.text != confirmPasswordController.value.text) {
                    return 'Password does not match';
                  }
                  return null;
                }
              ),
            ),
            const SizedBox(height: 25,),
            LinkedLabel.instantiate(
              viewModel: LinkedLabelViewModel(
                fullText: "Already have an account? Login here",
                linkedText: "Login here",
                onLinkTap: () {
                  RegistrationPageRouter.goToLoginPage(context);
                }
              )
            ),
            const SizedBox(height: 60,),
            RichText(
              text: const TextSpan(
                style: TextStyle(
                  color: textColor,
                  fontSize: 18
                ),
                children: <TextSpan>[
                  TextSpan(text: 'By clicking the “CREATE ACCOUNT” button, you agree to '),
                  TextSpan(
                    text: 'Terms of use', 
                    style: TextStyle(fontWeight: FontWeight.bold)
                  ),
                  TextSpan(text: ' and '),
                  TextSpan(
                    text: 'Privacy Policy', 
                    style: TextStyle(fontWeight: FontWeight.bold)
                  ),
                ],
              ),
            ),
            const SizedBox(height: 10,),
            RoundedButton.instantiate(
              viewModel: RoundedButtonViewModel(
                label: "CREATE ACCOUNT",
                style: RoundedButtonStyle.primary,
                onPressed: () {
                  RegistrationPageRouter.goToHomePage(context, usernameController.text, emailController.text, passwordController.text);
                },
              )
            ),
          ],
        ),
      ),
    );
  }
}