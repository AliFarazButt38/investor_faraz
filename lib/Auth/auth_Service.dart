import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:investor_flutter/View/Screen/complete_your_profile/complete_profileScreen.dart';
import 'package:investor_flutter/View/Screen/home_screens/dashboard_screen.dart';
import '../View/Screen/bottom_navigation/bottom_navigation.dart';
import '../View/Screen/emailAndPhone/choose_password_screen.dart';
import '../View/Screen/emailAndPhone/email_verifiedScreen.dart';
import '../View/Screen/emailAndPhone/login_accountScreen.dart';

class AuthService {

  static Future<void> fetchEmail(String email, BuildContext context) async {
    // try {
       print('email $email');
    //   var signInMethods =
    //       await FirebaseAuth.instance.fetchSignInMethodsForEmail(email);
    //   print('signinMethods ${signInMethods}');
    //   if (signInMethods.isNotEmpty) {
    //     showDialog(
    //       context: context,
    //       builder: (context) => AlertDialog(
    //         title: Text(
    //           'Email Already Exists',
    //           style: TextStyle(
    //             fontWeight: FontWeight.bold,
    //             fontSize: 20,
    //             color: Colors.red, // Customize the text color
    //           ),
    //         ),
    //         content: Text(
    //           'The email address is already registered.',
    //           style: TextStyle(
    //             fontSize: 16,
    //             color: Colors.black, // Customize the text color
    //           ),
    //         ),
    //         actions: <Widget>[
    //           ElevatedButton(
    //             onPressed: () {
    //               Navigator.pop(context);
    //             },
    //             style: ElevatedButton.styleFrom(
    //               primary: Colors.blue, // Customize the button color
    //             ),
    //             child: Text(
    //               'OK',
    //               style: TextStyle(
    //                 color: Colors.white, // Customize the text color
    //               ),
    //             ),
    //           ),
    //         ],
    //         shape: RoundedRectangleBorder(
    //           borderRadius:
    //               BorderRadius.circular(16.0), // Customize the border radius
    //         ),
    //         backgroundColor: Colors.white, // Customize the background color
    //         elevation: 4.0, // Customize the elevation
    //       ),
    //     );
    //   } else {
    //     Navigator.push(
    //       context,
    //       MaterialPageRoute(
    //         builder: (context) => ChoosePasswordScreen(userEmail: email),
    //       ),
    //     );
    //   }
    // } catch (e) {
    //   print('Error checking email existence: $e');
    // }
    try {
      final signInMethods =
      await FirebaseAuth.instance.fetchSignInMethodsForEmail(email);
      print('singing method $signInMethods');
      final userExists = signInMethods.isNotEmpty;
      print('user exist $userExists');

      final canSignInWithLink = signInMethods
          .contains(EmailAuthProvider.EMAIL_LINK_SIGN_IN_METHOD);
      final canSignInWithPassword = signInMethods
          .contains(EmailAuthProvider.EMAIL_PASSWORD_SIGN_IN_METHOD);
      // if(userExists == true){
      //   showDialog(
      //     context: context,
      //     builder: (context) => AlertDialog(
      //       title: Text(
      //         'Email Already Exists',
      //         style: TextStyle(
      //           fontWeight: FontWeight.bold,
      //           fontSize: 20,
      //           color: Colors.red, // Customize the text color
      //         ),
      //       ),
      //       content: Text(
      //         'The email address is already registered.',
      //         style: TextStyle(
      //           fontSize: 16,
      //           color: Colors.black, // Customize the text color
      //         ),
      //       ),
      //       actions: <Widget>[
      //         ElevatedButton(
      //           onPressed: () {
      //             Navigator.pop(context);
      //           },
      //           style: ElevatedButton.styleFrom(
      //             primary: Colors.blue, // Customize the button color
      //           ),
      //           child: Text(
      //             'OK',
      //             style: TextStyle(
      //               color: Colors.white, // Customize the text color
      //             ),
      //           ),
      //         ),
      //       ],
      //       shape: RoundedRectangleBorder(
      //         borderRadius:
      //         BorderRadius.circular(16.0), // Customize the border radius
      //       ),
      //       backgroundColor: Colors.white, // Customize the background color
      //       elevation: 4.0, // Customize the elevation
      //     ),
      //   );
      // }else{
      //   Navigator.push(
      //     context,
      //     MaterialPageRoute(
      //       builder: (context) => ChoosePasswordScreen(userEmail: email),
      //     ),
      //   );
      // }
    } on FirebaseAuthException catch (exception) {
      switch (exception.code) {
        case "invalid-email":
          print("Not a valid email address.");
          break;
        default:
          print("Unknown error. $exception");
      }
    }
  }

  static Future<void> signUp(
      String userEmail, String password, String confirmPassword) async {
    if (password.isEmpty || confirmPassword.isEmpty) {
      throw Exception("Password fields cannot be empty.");
    } else if (password.length < 6) {
      throw Exception("Password should be at least 6 characters.");
    } else if (password != confirmPassword) {
      throw Exception("Passwords do not match. Please try again.");
    } else {
      try {
        UserCredential userCredential =
            await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: userEmail,
          password: password,
        );

        await userCredential.user!.sendEmailVerification();
      } catch (e) {
        print('Failed to create account: ${e.toString()}');

        throw Exception("${e.toString()}");
      }
    }
  }

  static Future<void> verifyEmail(BuildContext context) async {
    try {
      await FirebaseAuth.instance.currentUser!.reload();

      if (FirebaseAuth.instance.currentUser!.emailVerified) {
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => EmailVerifiedScreen()));

        Future.delayed(Duration(seconds: 3), () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => LoginToAccountScreen()));
        });
      } else {
        print('Email not verified yet');
      }
    } catch (e) {
      print('Failed to verify email: ${e.toString()}');
    }
  }

  static Future<String?> login(
      BuildContext context,
      TextEditingController emailController,
      TextEditingController passwordController) async {
    String email = emailController.text.trim();
    String password = passwordController.text.trim();

    if (email.isEmpty || password.isEmpty) {
      return "Please enter both email and password.";
    }

    try {
      UserCredential userCredential = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);
      Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) => NavigationBottom()), (route) => false);


      return null;
    } catch (error) {
      // Handle login errors here
      print('Failed to sign in: ${error.toString()}');

      return "Incorrect email or password. Please try again.";
    }
  }
  // static Future<void> signOut(BuildContext context) async {
  //   try {
  //     await FirebaseAuth.instance.signOut();
  //
  //     Navigator.pushAndRemoveUntil(
  //       context,
  //       MaterialPageRoute(builder: (context) => LoginToAccountScreen()),
  //       (Route<dynamic> route) => false,
  //     );
  //   } catch (e) {
  //     print("Error signing out: ${e.toString()}");
  //   }
  // }
}
