import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../Theme/Palette/palette.dart';

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
    ScreenUtil.init(context, designSize: const Size(428, 926));
    return Scaffold(
      backgroundColor: Palette.baseBackground,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 15.w),
          child: Column(

            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Image.asset("assets/icons/cross.png", height: 28.h, width: 28.w),
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
                  color: Palette.baseElementDark,
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
                        color: Palette.baseElementDark,
                        fontSize: 17.sp,
                        fontWeight: FontWeight.w400,
                      ),
                      hintText: "Enter your email or phone",
                      hintStyle: TextStyle(
                        color: Palette.baseGrey,
                        fontSize: 17.sp,
                        fontWeight: FontWeight.w400,

                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color:Palette.blueSides,
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
                      fillColor:Palette.textFieldBlue,
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
                            color: Palette.baseElementDark,
                            fontWeight: FontWeight.w400,
                            fontSize: 17.sp,
                          ),
                          hintText: "Enter your password",
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
                              color:Palette.blue, // Change border color if passwords don't match
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
                              isPasswordVisible = !isPasswordVisible; // Toggle text visibility
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
                    },
                    child: Text(
                      "Continue",
                      style: TextStyle(color: Colors.white,fontSize: 18.sp,fontWeight: FontWeight.w700),
                    ),
                    style: ElevatedButton.styleFrom(
                      primary: isFieldsEmpty ? Colors.grey : Palette.blue,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20.0),
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
