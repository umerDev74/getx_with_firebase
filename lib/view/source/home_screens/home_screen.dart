import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../controller/auth_controller.dart';
import '../../components/custom_button.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Controller ko find karna
    final AuthController authController = Get.find<AuthController>();

    return Scaffold(
      appBar: AppBar(
        title: const Text("Home"),
        backgroundColor: Colors.purple,
      ),
      // --- DRAWER START ---
      drawer: Drawer(
        child: Column(
          children: [
            // Drawer Header (Optional: User ki info dikhane ke liye)
            UserAccountsDrawerHeader(
              decoration: const BoxDecoration(color: Colors.purple),
              accountName: const Text("Welcome"),
              accountEmail: Text("${authController.userModel.value?.email}"),
              currentAccountPicture: const CircleAvatar(
                backgroundColor: Colors.white,
                child: Icon(Icons.person, color: Colors.purple),
              ),
            ),

            const Spacer(), // Button ko neechay push karne ke liye

            // Sign Out Button using your CustomButton
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Obx(() => CustomButton(
                text: "Sign Out",
                color: Colors.redAccent,
                isLoading: authController.isLoading.value,
                onPressed: () {
                  authController.signOut();
                },
              )),
            ),

            const SizedBox(height: 20),
          ],
        ),
      ),
      // --- DRAWER END ---
      body: const Center(
        child: Text(
          'Home Screen',
          style: TextStyle(
            fontSize: 30,
            fontWeight: FontWeight.bold,
            color: Colors.purple,
          ),
        ),
      ),
    );
  }
}


// import 'package:flutter/material.dart';
//
// class HomeScreen extends StatelessWidget {
//   const HomeScreen({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       drawer: Drawer(
//
//       ),
//       body: Center(child:
//         Text('Home Screen',style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold,
//         color: Colors.purple),),),
//     );
//   }
// }
