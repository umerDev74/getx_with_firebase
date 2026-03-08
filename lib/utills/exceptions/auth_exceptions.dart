import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

class FirebaseExceptionHandler {
  static String getErrorMessage(dynamic e) {
    if (e is FirebaseAuthException) {
      switch (e.code) {
        case 'user-not-found':
          return "No user found with this email.";
        case 'wrong-password':
          return "Wrong password provided for that user.";
        case 'network-request-failed':
          return "Please check your internet connection.";
        case 'user-disabled':
          return "This user account has been disabled.";
        case 'too-many-requests':
          return "Too many requests. Try again later.";
        case 'operation-not-allowed':
          return "Server error. Please try again later.";
        default:
          return e.message ?? "An unknown error occurred.";

      }
    }
    return e.toString();
  }
}