import 'package:flutter/material.dart';
import '../../components/custom_textformfield.dart';
import '../../components/custom_button.dart'; // Naya import

class SignupScreen extends StatelessWidget {
  SignupScreen({super.key});

  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Signup")),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Form(
          key: formKey,
          child: Column(
            children: [
              CustomTextFormField(
                controller: emailController,
                hintText: "Enter Email",
                prefixIcon: Icons.email,
                keyboardType: TextInputType.emailAddress,
                validator: (value) {
                  if (value == null || value.isEmpty) return "Email is required";
                  if (!value.contains('@')) return "Enter a valid email";
                  return null;
                },
              ),

              CustomTextFormField(
                controller: passwordController,
                hintText: "Enter Password",
                prefixIcon: Icons.lock,
                obscureText: true,
                validator: (value) {
                  if (value == null || value.length < 6) return "Min 6 characters";
                  return null;
                },
              ),

              const SizedBox(height: 30), // Gap dene ke liye

              // --- Custom Button Yahan Hai ---
              CustomButton(
                text: "Create Account",
                onPressed: () {
                  if (formKey.currentState!.validate()) {
                    // Logic for signup
                    print("Email: ${emailController.text}");
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}