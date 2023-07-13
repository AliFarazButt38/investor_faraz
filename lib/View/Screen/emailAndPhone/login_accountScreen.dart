import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:investor_flutter/View/Screen/bottom_navigation/bottom_navigation.dart';
import 'package:investor_flutter/View/Screen/complete_your_profile/complete_profileScreen.dart';
import 'package:provider/provider.dart';

import '../../../Theme/Palette/palette.dart';
import '../../../Theme/theme_manager.dart';

class LoginToAccountScreen extends StatefulWidget {
  @override
  _LoginToAccountScreenState createState() => _LoginToAccountScreenState();
}

class _LoginToAccountScreenState extends State<LoginToAccountScreen> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  bool isChecked = false;
  bool isFieldsEmpty = true;
  bool isPasswordVisible=false;

  @override
  Widget build(BuildContext context) {
    final themeManager = Provider.of<ThemeManager>(context);
    final isDarkMode = themeManager.themeMode == ThemeMode.dark;
    return Scaffold(
      backgroundColor: isDarkMode ? Palette.darkBackground : Palette.baseBackground,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 15.w),
          child: SingleChildScrollView(
            child: Column(

              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 20.h,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GestureDetector(
                        onTap: (){
                          Navigator.pop(context);
                        },
                        child: Image.asset("assets/icons/cross.png", height: 28.h, width: 28.w)),
                    Padding(
                      padding:  EdgeInsets.only(right: 170.w),
                      child: SvgPicture.asset("assets/icons/investor.svg", width: 48.w, height: 39.h),
                    ),
                  ],
                ),
                SizedBox(height: 40.h,),
                Text(
                  "Log into your account" ,
                  style: TextStyle(
                    fontSize: 28.sp,
                    fontWeight: FontWeight.w700,
                    color: isDarkMode ? Palette.darkWhite : Palette.baseElementDark,
                  ),
                ),
                SizedBox(height: 30.h,),
                Center(
                  child: Container(
                    height: 80.h,
                    width: 368.w,
                    child: TextField(
                      controller: emailController,
                      onChanged: (value) {
                        setState(() {
                          isFieldsEmpty = emailController.text.trim().isEmpty && passwordController.text.trim().isEmpty;

                        });
                      },
                      decoration: InputDecoration(
                        labelText: "Enter email / phone number",
                        labelStyle: TextStyle(
                          color:isDarkMode ? Palette.darkWhite : Palette.baseElementDark,
                          fontSize: 17.sp,
                          fontWeight: FontWeight.w400,
                        ),
                        hintText: "Enter your email or phone",
                        hintStyle: TextStyle(
                          color: isDarkMode ? Palette.hintText : Palette.baseGrey,
                          fontSize: 17.sp,
                          fontWeight: FontWeight.w400,

                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: isDarkMode ? Palette.hintText :  Palette.blueSides, // Change border color if passwords don't match
                          ),
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Palette.blue ,
                          ),
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                        filled: true,
                        fillColor: isDarkMode? Palette.filledTextField : Palette.textFieldBlue,
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 15.h,),
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
                             // Reset the error state on change
                            });
                          },
                          decoration: InputDecoration(
                            labelText: "Password",
                            labelStyle: TextStyle(
                              color:isDarkMode ? Palette.darkWhite : Palette.baseElementDark,
                              fontWeight: FontWeight.w400,
                              fontSize: 17.sp,
                            ),
                            hintText: "Enter your password",
                            hintStyle: TextStyle(
                              color: isDarkMode ? Palette.hintText : Palette.baseGrey,
                              fontWeight: FontWeight.w400,
                              fontSize: 17.sp,
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: isDarkMode ? Palette.hintText :  Palette.blueSides, // Change border color if passwords don't match
                              ),
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color:Palette.blue, // Change border color if passwords don't match
                              ),
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                            filled: true,
                            fillColor: isDarkMode? Palette.filledTextField : Palette.textFieldBlue,
                          ),
                        ),
                        Positioned(
                          right: 8.0,
                          top: 20,
                          child: GestureDetector(
                            onTap: (){
                              setState(() {
                                isPasswordVisible = !isPasswordVisible; // Toggle text visibility
                              });
                            },
                            child: ImageIcon(
                              AssetImage("assets/icons/hide.png"),
                              size: 24.sp,
                              color: isPasswordVisible ? Palette.blue : (isDarkMode ? Palette.baseGrey : Palette.baseGrey),
                            ),
                          ),
                        ),
                      ],

                    ),
                  ),
                ),
                SizedBox(height: 20.h,),
                Padding(
                  padding:  EdgeInsets.only(left: 10.w,right: 10.w),
                  child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [

                          Container(
                          child: InkWell(
                              onTap: () {
                  setState(() {
                  isChecked = !isChecked;
                  });
                  },
                              child: Row(
                                children: [
                                    Container(
                                      width: 20.w,
                                      height: 20.h,
                                      decoration: BoxDecoration(
                                        color: isChecked ? Palette.blue : Colors.transparent,
                                        borderRadius: BorderRadius.circular(4.0),
                                        border: isChecked ? null : Border.all(color: Palette.blue, width: 1.0),
                                      ),
                                      child: isChecked
                                          ? Icon(
                                        Icons.check,
                                        color: Palette.baseWhite,
                                        size: 18.sp,
                                      )
                                          : null,
                                    ),
                                    SizedBox(width: 8.0),
                  Text(
                    'Remember Me',
                    style: TextStyle(
                      fontSize: 16.0.sp,
                      fontWeight: FontWeight.w400,
                      color: Palette.blue,
                    ),
                  ),

              ],
            ),
        ),
      ),
                      Text("Forgot Password?",style: TextStyle(
                        fontWeight: FontWeight.w700,
                        fontSize: 16.sp,
                       color: Palette.blue,
                      ),),
                    ],
                  ),
                ),
                SizedBox(height: 50.h,),
                Center(
                  child: SizedBox(
                    width: 304.w,
                    height: 56.h,
                    child: ElevatedButton(
                      onPressed: isFieldsEmpty ? null : () {
                        // Handle continue button press here
                        Navigator.push(context, MaterialPageRoute(builder: (context)=>CompleteYourProfile()));

                      },
                      child: Text(
                        "Continue",
                        style: TextStyle(color: Colors.white,fontSize: 18.sp,fontWeight: FontWeight.w700),
                      ),
                      style: ElevatedButton.styleFrom(
                        primary: isFieldsEmpty ? Colors.grey : Palette.blue,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(25.0),
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 15.h,),
                Center(
                  child: SizedBox(
                    width: 304.w,
                    height: 56.h,
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context)=>CompleteYourProfile()));

                        // Handle sign in button press here
                      },
                      child: Text(
                        "Sign Up",
                        style: TextStyle(color: Palette.blue,
                        fontWeight: FontWeight.w700,
                          fontSize: 18.sp,
                        ),
                      ),
                      style: ElevatedButton.styleFrom(
                        primary: isDarkMode ? Palette.darkBackground : Color(0xffF8F8F8),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(25.0),
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
      ),
    );
  }
}
