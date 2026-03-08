import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AppSnackbar
{
  static ShowErrorSnackbar (String title, String message)
  {
    Get.snackbar(title, message,
    snackPosition: SnackPosition.BOTTOM, // Neeche dikhane ke liye
    backgroundColor: Colors.redAccent.withOpacity(0.9),
    colorText: Colors.white,
    icon: const Icon(Icons.error_outline, color: Colors.white),
    margin: const EdgeInsets.all(15),
    borderRadius: 10,
    duration: const Duration(seconds: 3),
    shouldIconPulse: true,
    leftBarIndicatorColor: Colors.red[900],
    );
  }

  static ShowSuccessSnackbar (String title, String message)
  {
    Get.snackbar(title, message,
      snackPosition: SnackPosition.BOTTOM,
      backgroundColor: Colors.green[600]!.withOpacity(0.9),
      colorText: Colors.white,
      icon: const Icon(Icons.check_circle_outline, color: Colors.white),
      margin: const EdgeInsets.all(15),
      borderRadius: 10,
      duration: const Duration(seconds: 3),
      leftBarIndicatorColor: Colors.green[900],
    );
  }

  static ShowWarningSnackbar (String title, String message)
  {
    Get.snackbar(title, message,
      snackPosition: SnackPosition.BOTTOM,
      backgroundColor: Colors.orangeAccent.withOpacity(0.9),
      colorText: Colors.white,
      icon: const Icon(Icons.warning_amber_rounded, color: Colors.white),
      margin: const EdgeInsets.all(15),
      borderRadius: 10,
      duration: const Duration(seconds: 3),
      leftBarIndicatorColor: Colors.orange[800],
    );
  }
}