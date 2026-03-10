// auth controller with models
// ... other imports

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

import '../data/services/firebase/firebase_auth/auth_services.dart';
import '../model/auth_model/user_model.dart';
import '../utills/error_messages/snackbars.dart';
import '../utills/exceptions/auth_exceptions.dart';
import '../utills/routes/route_class.dart';

class AuthController extends GetxController {
  final AuthService _authService = AuthService();

  // Observable User Model
  var userModel = Rxn<UserModel>();
  var isLoading = false.obs;

  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  Future<void> signUp() async {
    try {
      isLoading.value = true;
      // Capture the returned model
      userModel.value = await _authService.signUp(
          emailController.text.trim(),
          passwordController.text.trim()
      );

      AppSnackbar.ShowSuccessSnackbar("Success", "Account created for ${userModel.value?.email}");
      Get.offAllNamed(AppRoutes.homescreen);
    } catch (e) {
      _showErrorSnackbar(FirebaseExceptionHandler.getErrorMessage(e));
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> signIn() async {
    try {
      isLoading.value = true;
      // Capture the returned model
      userModel.value = await _authService.signIn(
          emailController.text.trim(),
          passwordController.text.trim()
      );

      AppSnackbar.ShowSuccessSnackbar('Welcome Back', 'Logged in as ${userModel.value?.email}');
      Get.offAllNamed(AppRoutes.homescreen);
    } catch (e) {
      _showErrorSnackbar(FirebaseExceptionHandler.getErrorMessage(e));
    } finally {
      isLoading.value = false;
    }
  }

  // --- SIGN OUT (Naya Function) ---
  Future<void> signOut() async {
    try {
      isLoading.value = true;
      await _authService.signOut(); // Firebase se logout
      userModel.value = null;      // Local state clear

      // Text fields bhi clear kar dein taake naya banda login kar sake
      emailController.clear();
      passwordController.clear();

      Get.offAllNamed(AppRoutes.signupscreen); // Wapis Login par bhejein
      AppSnackbar.ShowSuccessSnackbar('Signed Out', 'Logout Successfully');
    } catch (e) {
      _showErrorSnackbar("Logout Failed: ${e.toString()}");
    } finally {
      isLoading.value = false;
    }
  }

  // --- ISKO YAHAN RAKHEN (Inside the class) ---
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
    // Controllers ko dispose karna zaroori hai memory leaks se bachne ke liye
    emailController.clear();
    passwordController.clear();
    // emailController.dispose();
    // passwordController.dispose();
    super.onClose();
  }
// ... rest of your controller code
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