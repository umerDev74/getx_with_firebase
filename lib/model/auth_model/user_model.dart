class UserModel {
  final String? uid;
  final String? email;

  UserModel({this.uid, this.email});

  // Factory constructor to create a UserModel from Firebase User
  factory UserModel.fromFirebaseUser(dynamic user) {
    return UserModel(
      uid: user?.uid,
      email: user?.email,
    );
  }

  // To convert our model to a Map (useful for saving to Firestore later)
  Map<String, dynamic> toJson() {
    return {
      "uid": uid,
      "email": email,
    };
  }
}