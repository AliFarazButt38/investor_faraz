import 'package:cloud_firestore/cloud_firestore.dart';

class UserModel {
  final String uid;
  final String email;
  // Add other fields that you want to store for the user
  // For example: String fullName, String phoneNumber, etc.

  UserModel({
    required this.uid,
    required this.email,
    // Add constructor parameters for other fields
  });

  // Create a factory method to convert Firestore document snapshot to UserModel
  factory UserModel.fromFirestore(DocumentSnapshot doc) {
    Map<String, dynamic> data = doc.data() as Map<String, dynamic>;
    return UserModel(
      uid: doc.id,
      email: data['email'],
      // Initialize other fields here
    );
  }

  // Add a method to convert UserModel to Map for storing in Firestore
  Map<String, dynamic> toMap() {
    return {
      'email': email,
      // Add other fields here
    };
  }
}
