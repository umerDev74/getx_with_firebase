import 'package:get/get.dart';
import 'package:getx_with_firebase/view/source/auth_screens/signin_screen.dart';

import '../../view/source/auth_screens/signup_screen.dart';
import '../../view/source/home_screens/home_screen.dart';

class AppRoutes
{
  static String signupscreen='/';
  static String signinscreen='/SigninScreen';
  static String homescreen='/HomeScreren';

  static final Route=[

    GetPage(
        name: signupscreen,
        page: ()=>SignupScreen()),

    GetPage(
        name: signinscreen,
        page: ()=>SigninScreen()),

    GetPage(
        name: homescreen,
        page: ()=>HomeScreen()),
  ];
}