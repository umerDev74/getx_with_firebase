import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_with_firebase/utills/error_messages/snackbars.dart';
// Apne path ke mutabiq change karein
import '../../../utills/exceptions/auth_exceptions.dart';
import '../../../view/source/home_screens/home_screen.dart';
import '../firebase/firebase_auth/auth_services.dart';
//import 'auth_service.dart'; // AuthService ko import karein

class AuthController extends GetxController {
  // Dependency Injection
  final AuthService _authService = AuthService();

  // Text Controllers
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  // Observable state
  var isLoading = false.obs;

  // --- SIGN UP ---
  Future<void> signUp(String trim) async {
    try {
      isLoading.value = true;

      await _authService.signUp(
          emailController.text.trim(),
          passwordController.text.trim()
      );

      AppSnackbar.ShowSuccessSnackbar("Success", "Account created successfully");
      Get.offAll(() => const HomeScreen());

    } catch (e) {
      String errorMsg = FirebaseExceptionHandler.getErrorMessage(e);
      _showErrorSnackbar(errorMsg);
    } finally {
      isLoading.value = false;
    }
  }

  // --- SIGN IN ---
  Future<void> signIn(String trim,) async {
    try {
      isLoading.value = true;

      await _authService.signIn(
          emailController.text.trim(),
          passwordController.text.trim()
      );

      AppSnackbar.ShowSuccessSnackbar('Welcome Back', 'Login Successfully');
      Get.offAll(() => const HomeScreen());

    } catch (e) {
      String errorMsg = FirebaseExceptionHandler.getErrorMessage(e);
      _showErrorSnackbar(errorMsg);
    } finally {
      isLoading.value = false;
    }
  }

  void _showErrorSnackbar(String message) {
    Get.snackbar(
      "Authentication Error",
      message,
      snackPosition: SnackPosition.BOTTOM,
      backgroundColor: Colors.redAccent.withOpacity(0.1),
      colorText: Colors.red[900],
      margin: const EdgeInsets.all(15),
      icon: const Icon(Icons.warning_amber_rounded, color: Colors.red),
    );
  }

  @override
  void onClose() {
    emailController.dispose();
    passwordController.dispose();
    super.onClose();
  }
}



// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:get/get.dart';
// import 'package:flutter/material.dart';
// import 'package:getx_with_firebase/utills/error_messages/snackbars.dart';
//
// import '../../../utills/exceptions/auth_exceptions.dart';
// import '../../../view/source/home_screens/home_screen.dart';
// // Apni exception handler class ko yahan import karein
// // import 'package:your_app_name/firebase_exception_handler.dart';
//
// class AuthController extends GetxController {
//   TextEditingController emailcontroller=TextEditingController();
//   TextEditingController passwordcontroller=TextEditingController();
//   final FirebaseAuth _auth = FirebaseAuth.instance;
//
//   // Loading state check karne ke liye (UI par spinner dikhane ke liye)
//   var isLoading = false.obs;
//
//   // --- SIGN UP FUNCTION ---
//   Future<void> signUp(String email, String password) async {
//     try {
//       isLoading.value = true;
//       await _auth.createUserWithEmailAndPassword(email: email, password: password);
//
//      AppSnackbar.ShowSuccessSnackbar("Success", "Account created successfully");
//
//       // Yahan navigate karein home screen par
//       Get.offAll(()=>HomeScreen());
//
//     } catch (e) {
//       String errorMsg = FirebaseExceptionHandler.getErrorMessage(e);
//       _showErrorSnackbar(errorMsg);
//     } finally {
//       isLoading.value = false;
//     }
//   }
//
//   // --- SIGN IN FUNCTION ---
//   Future<void> signIn(String email, String password) async {
//     try {
//       isLoading.value = true;
//       await _auth.signInWithEmailAndPassword(email: email, password: password);
//
//       AppSnackbar.ShowSuccessSnackbar('Welcome Back', 'Login Successfully');
//
//        Get.offAll(() => HomeScreen());
//
//     } catch (e) {
//       String errorMsg = FirebaseExceptionHandler.getErrorMessage(e);
//       _showErrorSnackbar(errorMsg);
//     } finally {
//       isLoading.value = false;
//     }
//   }
//
//   // Helper function to show error snackbar
//   void _showErrorSnackbar(String message) {
//     Get.snackbar(
//       "Authentication Error",
//       message,
//       snackPosition: SnackPosition.BOTTOM,
//       backgroundColor: Colors.redAccent.withOpacity(0.1),
//       colorText: Colors.red[900],
//       margin: const EdgeInsets.all(15),
//       icon: const Icon(Icons.warning_amber_rounded, color: Colors.red),
//     );
//   }
//
//   @override
//   void onClose() {
//     // TODO: implement onClose
//     emailcontroller.dispose();
//     passwordcontroller.dispose();
//     super.onClose();
//   }
// }