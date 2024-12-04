import 'package:flutter/material.dart';
import 'package:habit_note/DesignSystem/Components/Buttons/RoundedButton/rounded_button.dart';
import 'package:habit_note/DesignSystem/Components/Buttons/RoundedButton/rounded_button_view_model.dart';
import 'package:habit_note/DesignSystem/Components/InputField/input_field.dart';
import 'package:habit_note/DesignSystem/Components/InputField/input_field_view_model.dart';
import 'package:habit_note/DesignSystem/Components/LinkedLabel/linked_label.dart';
import 'package:habit_note/DesignSystem/Components/LinkedLabel/linked_label_view_model.dart';
import 'package:habit_note/DesignSystem/Shared/colors.dart';
import 'package:habit_note/Scenes/Login/login_router.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Log In",
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
            const Text(
              "Welcome back !",
              style: TextStyle(
                color: textColor,
                fontSize: 18,
                fontWeight: FontWeight.bold
              ),
            ),
            const Text(
              "Please login with your credentials",
              style: TextStyle(
                color: textColor,
                fontSize: 18
              ),
            ),
            const SizedBox(height: 100,),
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
            const SizedBox(height: 16,),
            const Row(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  "Forgot Password ?",
                  style: TextStyle(
                    color: textColor,
                    fontSize: 18,
                  ),
                )
              ],
            ),
            const SizedBox(height: 50,),
            LinkedLabel.instantiate(
              viewModel: LinkedLabelViewModel(
                fullText: "Don’t have an account yet ? Create an account here",
                linkedText: "Create an account here",
                onLinkTap: () {
                  LoginPageRouter.goToRegistrationPage(context);
                }
              )
            ),
            const SizedBox(height: 100,),
            RoundedButton.instantiate(
              viewModel: RoundedButtonViewModel(
                label: "LOG IN",
                onPressed: () {},
                style: RoundedButtonStyle.primary,
              )
            ),
          ],
        ),
      ),
    );
  }
}