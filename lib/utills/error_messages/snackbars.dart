import 'package:get/get.dart';

class AppSnackbar
{
  static ShowErrorSnackbar (String title, String message)
  {
    Get.snackbar(title, message);
  }

  static ShowSuccessSnackbar (String title, String message)
  {
    Get.snackbar(title, message);
  }

  static ShowWarningSnackbar (String title, String message)
  {
    Get.snackbar(title, message);
  }
}