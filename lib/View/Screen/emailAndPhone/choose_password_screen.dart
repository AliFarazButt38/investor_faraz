import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:investor_flutter/View/Screen/emailAndPhone/email_verificationScreen.dart';
import 'package:provider/provider.dart';
import '../../../Auth/auth_Service.dart';
import '../../../Theme/Palette/palette.dart';
import '../../../Theme/theme_manager.dart';

class ChoosePasswordScreen extends StatefulWidget {
  final String userEmail;

  ChoosePasswordScreen({required this.userEmail});
  @override
  _ChoosePasswordScreenState createState() => _ChoosePasswordScreenState();
}

class _ChoosePasswordScreenState extends State<ChoosePasswordScreen> {
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
  bool isPasswordMatch = true;
  bool isPasswordVisible = false;
  bool isConfirmPasswordVisible = false;
  bool isCheckingPassword = false;

  void showErrorDialog(BuildContext context, String message) {
    showDialog(
      context: context,
      builder: (context) {
        return Dialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16.0),
          ),
          backgroundColor: Colors.white,
          elevation: 4.0,
          child: Padding(
            padding: EdgeInsets.all(16.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Icon(
                  Icons.error_outline,
                  size: 48,
                  color: Colors.red, // Customize the error icon color
                ),
                SizedBox(height: 16.0),
                Text(
                  "Error",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                    color: Colors.red,
                  ),
                ),
                SizedBox(height: 16.0),
                Text(
                  message,
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.black,
                  ),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 16.0),
                ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  style: ElevatedButton.styleFrom(
                    primary: Colors.blue,
                  ),
                  child: Text(
                    'OK',
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  // void setPassword() async {
  //   String password = passwordController.text;
  //   String confirmPassword = confirmPasswordController.text;
  //
  //   // Show loading while checking the password
  //   setState(() {
  //     isCheckingPassword = true;
  //   });
  //
  //   if (password.isEmpty || confirmPassword.isEmpty) {
  //     showErrorDialog(context,"Password fields cannot be empty.");
  //   } else if (password.length < 6) {
  //     showErrorDialog(context,"Password should be at least 6 characters.");
  //   } else if (password != confirmPassword) {
  //     showErrorDialog(context,"Passwords do not match. Please try again.");
  //   } else {
  //     // Password validation succeeded, continue with account creation
  //     try {
  //       UserCredential userCredential =
  //       await FirebaseAuth.instance.createUserWithEmailAndPassword(
  //         email: widget.userEmail,
  //         password: password,
  //       );
  //
  //       // Send verification email to the user
  //       await userCredential.user!.sendEmailVerification();
  //
  //       // Navigate to the EmailVerificationScreen to enter the verification code
  //       Navigator.push(
  //         context,
  //         MaterialPageRoute(builder: (context) => EmailVerificationScreen()),
  //       );
  //     } catch (e) {
  //       // Handle account creation errors here
  //       print('Failed to create account: ${e.toString()}');
  //     }
  //   }
  //
  //   // Reset the loading state after checking the password
  //   setState(() {
  //     isCheckingPassword = false;
  //   });
  // }

  void createUser() async {
    try {
      setState(() {
        isCheckingPassword = true;
      });

      await AuthService.signUp(widget.userEmail, passwordController.text,
          confirmPasswordController.text);
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => EmailVerificationScreen(email: widget.userEmail,)),
      );
    } catch (e) {
      showErrorDialog(context, e.toString());
    } finally {
      setState(() {
        isCheckingPassword = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final themeManager = Provider.of<ThemeManager>(context);
    final isDarkMode = themeManager.themeMode == ThemeMode.dark;
    ScreenUtil.init(context, designSize: const Size(428, 926));
    return Scaffold(
      backgroundColor:
          isDarkMode ? Palette.darkBackground : Palette.baseBackground,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 15.w),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 20.h,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: Image.asset("assets/icons/cross.png",
                          height: 28.h, width: 28.w)),
                  Padding(
                    padding: EdgeInsets.only(right: 170.w),
                    child: SvgPicture.asset("assets/icons/investor.svg",
                        width: 48.w, height: 39.h),
                  ),
                  // Add your logos here
                ],
              ),
              SizedBox(height: 20.h),
              Padding(
                padding: EdgeInsets.only(left: 10.w),
                child: Text(
                  "Choose a password",
                  style: TextStyle(
                    fontSize: 28.sp,
                    fontWeight: FontWeight.w700,
                    color: isDarkMode
                        ? Palette.darkWhite
                        : Palette.baseElementDark,
                  ),
                ),
              ),
              SizedBox(height: 40.h), // Add spacing
              Center(
                child: Container(
                  height: 80.h,
                  width: 368.w,
                  child: Stack(
                    children: [
                      TextField(
                        // Password TextField
                        obscureText:
                            !isPasswordVisible,
                        controller: passwordController,
                        onChanged: (value) {
                          setState(() {
                            isPasswordMatch =
                                true;
                          });
                        },
                        decoration: InputDecoration(
                          labelText: "Password",
                          labelStyle: TextStyle(
                            color: isDarkMode
                                ? Palette.darkWhite
                                : Palette.baseElementDark,
                            fontWeight: FontWeight.w400,
                            fontSize: 17.sp,
                          ),
                          hintText: "At least 6 characters",
                          hintStyle: TextStyle(
                            color: isDarkMode
                                ? Palette.hintText
                                : Palette.baseGrey,
                            fontWeight: FontWeight.w400,
                            fontSize: 17.sp,
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: isDarkMode
                                  ? Palette.hintText
                                  : Palette
                                      .blueSides,
                            ),
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Palette
                                  .blue,
                            ),
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                          filled: true,
                          fillColor: isDarkMode
                              ? Palette.filledTextField
                              : Palette.textFieldBlue,
                        ),
                      ),
                      Positioned(
                        right: 8.0,
                        top: 20,
                        child: GestureDetector(
                          onTap: () {
                            setState(() {
                              isPasswordVisible =
                                  !isPasswordVisible;
                            });
                          },
                          child: ImageIcon(
                            AssetImage("assets/icons/hide.png"),
                            size: 24.sp,
                            color: isPasswordVisible
                                ? Palette.blue
                                : (isDarkMode
                                    ? Palette.hintText
                                    : Palette.baseGrey),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 16.h),
              Center(
                child: Container(
                  height: 80.h,
                  width: 368.w,
                  child: Stack(
                    children: [
                      TextField(

                        obscureText:
                            !isConfirmPasswordVisible,
                        controller: confirmPasswordController,
                        onChanged: (value) {
                          setState(() {
                            isPasswordMatch =
                                true;
                          });
                        },
                        decoration: InputDecoration(
                          labelText: "Confirm Password",
                          labelStyle: TextStyle(
                            color: isDarkMode
                                ? Palette.darkWhite
                                : Palette.baseElementDark,
                            fontWeight: FontWeight.w400,
                            fontSize: 17.sp,
                          ),
                          hintText: "At least 6 characters",
                          hintStyle: TextStyle(
                            color: isDarkMode
                                ? Palette.hintText
                                : Palette.baseGrey,
                            fontWeight: FontWeight.w400,
                            fontSize: 17.sp,
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: isPasswordMatch
                                  ? Palette.blueSides
                                  : Palette
                                      .red,
                            ),
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: isPasswordMatch
                                  ? Palette.blue
                                  : Palette
                                      .red,
                            ),
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                          filled: true,
                          fillColor: isDarkMode
                              ? Palette.filledTextField
                              : Palette.textFieldBlue,
                        ),
                      ),
                      Positioned(
                        right: 8.0,
                        top: 20,
                        child: GestureDetector(
                          onTap: () {
                            setState(() {
                              isConfirmPasswordVisible =
                                  !isConfirmPasswordVisible;
                            });
                          },
                          child: ImageIcon(
                            AssetImage("assets/icons/hide.png"),
                            size: 24.sp,
                            color: isConfirmPasswordVisible
                                ? Palette.blue
                                : (isDarkMode
                                    ? Palette.hintText
                                    : Palette.baseGrey),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              if (!isPasswordMatch)
                Padding(
                  padding: EdgeInsets.only(top: 8.0.h, left: 10.w),
                  child: Text(
                    "This password seems don't match! Try again.",
                    style: TextStyle(
                      color: Palette.red,
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
              SizedBox(height: 50.h), // Add spacing
              Center(
                child: SizedBox(
                  width: 304.w,
                  height: 56.h,
                  child: ElevatedButton(
                    onPressed: isCheckingPassword ? null : createUser,
                    child: isCheckingPassword
                        ? CircularProgressIndicator(color: Colors.white)
                        : Text(
                            "Set Password",
                            style: TextStyle(color: Colors.white),
                          ),
                    style: ElevatedButton.styleFrom(
                      primary: Palette.blue,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 20.h,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
