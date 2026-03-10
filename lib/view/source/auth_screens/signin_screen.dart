import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_with_firebase/view/components/loading_widget.dart';
import '../../../controller/auth_controller.dart';
import '../../components/custom_textformfield.dart';
import '../../components/custom_button.dart'; // Naya import

class SigninScreen extends StatelessWidget {
  SigninScreen({super.key});

  // final emailController = TextEditingController();
  // final passwordController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  final AuthController authController = Get.put(AuthController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Login")),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Form(
          key: formKey,
          child: Column(
            children: [
              CustomTextFormField(
                controller: authController.emailController,
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
                controller: authController.passwordController,
                hintText: "Enter Password",
                prefixIcon: Icons.lock,
                obscureText: true,
                validator: (value) {
                  if (value == null || value.length < 6) return "Min 6 characters";
                  return null;
                },
              ),

              const SizedBox(height: 30), // Gap dene ke liye

              // --- Custom Button with Obx ---
              Obx(() {
                return authController.isLoading.value
                    ? const LoadingWidget() // Agar loading ho rahi hai
                    : CustomButton(
                  text: "Login Account",
                  onPressed: () {
                   if (formKey.currentState!.validate()) {
                      authController.signIn();
                    }
                  },
                );
              })
            ],
          ),
        ),
      ),
    );
  }
}