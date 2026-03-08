import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:getx_with_firebase/utills/routes/route_class.dart';
//import 'package:getx_with_firebase/view/source/auth_screens/signup_screen.dart';

import 'data/services/controller/auth_controller.dart';
import 'firebase_options.dart';

void main()
async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  Get.lazyPut(() => AuthController(), fenix: true); // fenix: true isse dobara create hone deta hai
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
     initialRoute: AppRoutes.signupscreen,
      getPages: AppRoutes.Route,
      unknownRoute: GetPage(name: '/unknown-route',
          page: ()=>Scaffold(
        body: Center(child:
         Text('Routes Not Found'),),
          )),
    );
  }
}
//
// initialRoute: AppRoutes.homescreen,
// getPages: AppRoutes.Route,
// unknownRoute: GetPage(name: '/unkown-route', page: ()=>Scaffold(
// body: Center(child:
// Text('Routes Not Found'),),
// )),
// // home: HomeScreen(),
// );
// }
// }