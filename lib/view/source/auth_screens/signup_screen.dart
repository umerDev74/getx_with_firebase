import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_with_firebase/utills/routes/route_class.dart';
import 'package:getx_with_firebase/view/components/loading_widget.dart';
import 'package:getx_with_firebase/view/source/auth_screens/signin_screen.dart';
import '../../../data/services/controller/auth_controller.dart';
import '../../components/custom_textformfield.dart';
import '../../components/custom_button.dart';

class SignupScreen extends StatelessWidget {
  SignupScreen({super.key});

  // final emailController = TextEditingController();
  // final passwordController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  final AuthController authController = Get.find<AuthController>();

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
                controller: authController.emailController,
                hintText: "Enter Email",
                prefixIcon: Icons.email,
                keyboardType: TextInputType.emailAddress,
                validator: (value) {
                  if (value == null || value.isEmpty) return "Email is required";
                  if (!value.contains('@')) return "Enter a valid email";
                  return null;
                  //"Email is required"
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

              // --- Obx yahan se copy karein ---
              Obx(() {
                if (authController.isLoading.value) {
                  return const Center(child:
                  LoadingWidget());
                } else {
                  return CustomButton(
                    text: "Create Account",
                    onPressed: () {
                      if (formKey.currentState!.validate()) {
                      authController.signUp();
                       }
                    },
                  );
                }
              }),
              const SizedBox(height: 30),

              Row(children: [
                Text('Already have an account?  ',style:
                TextStyle(color: Colors.black,fontSize: 18),),
                TextButton(onPressed: (){
                  Get.offNamed(AppRoutes.signinscreen);
                },
                    child: Text('signin',style:
                      TextStyle(color: Colors.red,fontSize: 15),))
              ],)
            ],
          ),
        ),
      ),
    );
  }
}