import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:investor_flutter/View/Screen/emailAndPhone/email_verificationScreen.dart';

import '../../../Theme/Palette/palette.dart';

class ChoosePasswordScreen extends StatefulWidget {
  @override
  _ChoosePasswordScreenState createState() => _ChoosePasswordScreenState();
}

class _ChoosePasswordScreenState extends State<ChoosePasswordScreen> {

  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
  bool isPasswordMatch = true;
  bool isPasswordVisible=false;
  bool isConfirmPasswordVisible=false;

  void setPassword() {
    String password = passwordController.text;
    String confirmPassword = confirmPasswordController.text;

    if (password.isEmpty || confirmPassword.isEmpty) {
      // Display an error message or perform appropriate action for empty fields
      return;
    }

    if (password != confirmPassword) {
      setState(() {
        isPasswordMatch = false;
      });
    } else {
      // Passwords match, navigate to the next screen
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => EmailVerificationScreen()),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context, designSize: const Size(428, 926));
    return Scaffold(
      backgroundColor: Palette.baseBackground,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 15.w),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Image.asset("assets/icons/cross.png", height: 28.h, width: 28.w),
                  Padding(
                    padding: EdgeInsets.only(right: 170.w),
                    child: SvgPicture.asset("assets/icons/investor.svg", width: 48.w, height: 39.h),
                  ),
                  // Add your logos here
                ],
              ),
              SizedBox(height: 20.h),
              Padding(
                padding:  EdgeInsets.only(left: 10.w),
                child: Text(
                  "Choose a password",
                  style: TextStyle(
                    fontSize: 28.sp,
                    fontWeight: FontWeight.w700,
                    color: Palette.baseElementDark,
                  ),
                ),
              ),
              SizedBox(height: 40.h), // Add spacing
              Center(
                child: Container(
                  height: 80.h,
                  width: 368.w,
                  child: Stack(
                    children:[
                      TextField(
                      // Password TextField
                      obscureText: !isPasswordVisible, // Hides the entered text
                      controller: passwordController,
                      onChanged: (value) {
                        setState(() {
                          isPasswordMatch = true; // Reset the error state on change
                        });
                      },
                      decoration: InputDecoration(
                        labelText: "Password",
                        labelStyle: TextStyle(
                          color: Palette.baseElementDark,
                          fontWeight: FontWeight.w400,
                          fontSize: 17.sp,
                        ),
                        hintText: "At least 6 characters",
                        hintStyle: TextStyle(
                          color: Palette.baseGrey,
                          fontWeight: FontWeight.w400,
                          fontSize: 17.sp,
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color:  Palette.blueSides, // Change border color if passwords don't match
                          ),
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color:  Palette.blue , // Change border color if passwords don't match
                          ),
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                        filled: true,
                        fillColor: Palette.textFieldBlue,
                      ),
                    ),
                      Positioned(
                        right: 8.0,
                        top: 20,
                        child: GestureDetector(
                          onTap: (){
                            setState(() {
                              isPasswordVisible= !isPasswordVisible; // Toggle text visibility
                            });
                          },
                          child: ImageIcon(
                            AssetImage("assets/icons/hide.png"),
                            size: 24.sp,
                            color: isPasswordVisible? Palette.blue : Palette.baseGrey,
                          ),
                        ),
                      ),
                    ],

                  ),
                ),
              ),
              SizedBox(height: 16.h), // Add spacing
              Center(
                child: Container(
                  height: 80.h,
                  width: 368.w,
                  child: Stack(
                    children: [
                      TextField(
                        // Confirm Password TextField
                        obscureText: !isConfirmPasswordVisible, // Hides the entered text
                        controller: confirmPasswordController,
                        onChanged: (value) {
                          setState(() {
                            isPasswordMatch = true; // Reset the error state on change
                          });
                        },
                        decoration: InputDecoration(
                          labelText: "Confirm Password",
                          labelStyle: TextStyle(
                            color: Palette.baseElementDark,
                            fontWeight: FontWeight.w400,
                            fontSize: 17.sp,
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: isPasswordMatch ? Palette.blueSides : Palette.red, // Change border color if passwords don't match
                            ),
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: isPasswordMatch ? Palette.blue : Palette.red, // Change border color if passwords don't match
                            ),
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                          filled: true,
                          fillColor: Palette.textFieldBlue,
                        ),
                      ),
                      Positioned(
                        right: 8.0,
                        top: 20,
                        child: GestureDetector(
                          onTap: (){
                            setState(() {
                              isConfirmPasswordVisible= !isConfirmPasswordVisible; // Toggle text visibility
                            });
                          },
                          child: ImageIcon(
                            AssetImage("assets/icons/hide.png"),
                            size: 24.sp,
                            color: isConfirmPasswordVisible? Palette.blue : Palette.baseGrey,
                          ),
                        ),
                      ),
                      ],

                  ),
                ),
              ),
              if (!isPasswordMatch)
                Padding(
                  padding: EdgeInsets.only(top: 8.0.h,left: 10.w),
                  child: Text(
                    "The password does not match! Try again ",
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
                    onPressed: setPassword,
                    child: Text(
                      "Set Password",
                      style: TextStyle(color: Colors.white),
                    ),
                    style: ElevatedButton.styleFrom(
                      primary:Palette.blue,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 20.h,),
              Center(
                child: SizedBox(
                  width: 304.w,
                  height: 56.h,
                  child: ElevatedButton(
                    onPressed: () {
                      // Handle sign in button press here
                    },
                    child: Text(
                      "Sign In",
                      style: TextStyle(color: Palette.blue),
                    ),
                    style: ElevatedButton.styleFrom(
                      primary: Color(0xffF8F8F8),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20.0),
                        side: BorderSide(color: Palette.blue),
                      ),
                    ),
                  ),
                ),
              ),

            ],
          ),
        ),
      ),
    );
  }
}
