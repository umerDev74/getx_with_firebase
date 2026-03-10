// serivecs with models

import 'package:firebase_auth/firebase_auth.dart';
import '../../../../model/auth_model/user_model.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  // Sign Up logic returning UserModel
  Future<UserModel> signUp(String email, String password) async {
    try {
      UserCredential credential = await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      return UserModel.fromFirebaseUser(credential.user);
    } catch (e) {
      rethrow;
    }
  }

  // Sign In logic returning UserModel
  Future<UserModel> signIn(String email, String password) async {
    try {
      UserCredential credential = await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      return UserModel.fromFirebaseUser(credential.user);
    } catch (e) {
      rethrow;
    }
  }

  Future<void> signOut() async => await _auth.signOut();
}



// import 'package:firebase_auth/firebase_auth.dart';
//
// class AuthService {
//   final FirebaseAuth _auth = FirebaseAuth.instance;
//
//   // Sign Up Logic
//   Future<UserCredential> signUp(String email, String password) async {
//     try {
//       return await _auth.createUserWithEmailAndPassword(
//         email: email,
//         password: password,
//       );
//     } catch (e) {
//       rethrow; // Error ko controller tak bhej raha hai handle hone ke liye
//     }
//   }
//
//   // Sign In Logic
//   Future<UserCredential> signIn(String email, String password) async {
//     try {
//       return await _auth.signInWithEmailAndPassword(
//         email: email,
//         password: password,
//       );
//     } catch (e) {
//       rethrow;
//     }
//   }
//
//   // Sign Out Logic
//   Future<void> signOut() async {
//     await _auth.signOut();
//   }
// }