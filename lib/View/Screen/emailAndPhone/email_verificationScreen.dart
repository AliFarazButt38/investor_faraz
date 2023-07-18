import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:investor_flutter/View/Screen/bottom_navigation/bottom_navigation.dart';
import 'package:investor_flutter/View/Screen/complete_your_profile/complete_profileScreen.dart';
import 'package:investor_flutter/View/Screen/emailAndPhone/email_verifiedScreen.dart';
import 'package:investor_flutter/View/Screen/emailAndPhone/login_accountScreen.dart';
import 'package:provider/provider.dart';

import '../../../Theme/Palette/palette.dart';
import '../../../Theme/theme_manager.dart';

class EmailVerificationScreen extends StatefulWidget {
  @override
  _EmailVerificationScreenState createState() => _EmailVerificationScreenState();
}

class _EmailVerificationScreenState extends State<EmailVerificationScreen> {

  Future<void> verifyEmail() async {
    try {
      // Refresh the user's data to get the latest email verification status
      await FirebaseAuth.instance.currentUser!.reload();

      if (FirebaseAuth.instance.currentUser!.emailVerified) {
        // Email is verified, move to the CompleteYourProfileScreen
        Navigator.push(context, MaterialPageRoute(builder: (context) => EmailVerifiedScreen()));

        Future.delayed(Duration(seconds: 3), () {
          Navigator.push(context, MaterialPageRoute(builder: (context) => LoginToAccountScreen()));
        });
      } else {
        // Show an error message or perform appropriate action if email is not verified
        print('Email not verified yet');
      }
    } catch (e) {
      // Handle email verification errors here
      print('Failed to verify email: ${e.toString()}');
    }
  }

  int otp1=0;
  int otp2=0;
  int otp3=0;
  int otp4=0;
  @override
  Widget build(BuildContext context) {
    final themeManager = Provider.of<ThemeManager>(context);
    final isDarkMode = themeManager.themeMode == ThemeMode.dark;
    ScreenUtil.init(context, designSize: const Size(428, 926));
    return Scaffold(
      backgroundColor: isDarkMode ? Palette.darkBackground : Palette.baseBackground,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 15.w),
          child: Column(
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
          SizedBox(height: 20.h,),
          Text(
            "Email verification" ,
            style: TextStyle(
              fontSize: 28.sp,
              fontWeight: FontWeight.w700,
              color: isDarkMode ? Palette.darkWhite : Palette.baseElementDark,
            ),
          ),
              SizedBox(height: 50.h,),
              Text("Enter code",style: TextStyle(
                color: isDarkMode ? Palette.hintText : Palette.baseElementDark,
                fontSize: 17.sp,
                fontWeight: FontWeight.w400,
              ),),
              SizedBox(height: 30.h,),
              Padding(
                padding: EdgeInsets.only(left: 40.w,right: 40.w),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Container(
                      height: 56.h,
                      width: 56.w,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        border: Border.all(
                          color: isDarkMode? Palette.hintText : Palette.blueSides,
                        ),
                        color: isDarkMode ? Palette.filledTextField :  Palette.textFieldBlue, // light orange color
                      ),
                      child: TextFormField(

                        onChanged: (value) {
                          if (value.length == 1) {
                            setState(() {
                              otp1 = int.parse(value);
                            });
                            FocusScope.of(context).nextFocus();
                          }
                        },
                        keyboardType: TextInputType.number,
                        textAlign: TextAlign.center,
                        inputFormatters: [
                          LengthLimitingTextInputFormatter(1),
                          FilteringTextInputFormatter.digitsOnly,
                        ],
                        style:  TextStyle(fontSize: 20.55.sp,),
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color:  isDarkMode ? Colors.transparent :Palette.blue, width: 1),                          ),
                        ),// optional styling for the text inside
                      ),
                    ),
                    Container(
                      height: 56.h,
                      width: 56.w,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        border: Border.all(
                          color: isDarkMode? Palette.hintText : Palette.blueSides,
                        ),
                        color: isDarkMode ? Palette.filledTextField :  Palette.textFieldBlue, // light orange color
                      ),
                      child: TextFormField(

                        onChanged: (value) {
                          if (value.length == 1) {
                            setState(() {
                              otp2 = int.parse(value);
                            });
                            FocusScope.of(context).nextFocus();
                          }
                        },
                        keyboardType: TextInputType.number,
                        textAlign: TextAlign.center,
                        inputFormatters: [
                          LengthLimitingTextInputFormatter(1),
                          FilteringTextInputFormatter.digitsOnly,
                        ],
                        style:  TextStyle(fontSize: 20.55.sp,),
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color:  isDarkMode ? Colors.transparent :Palette.blue,

                                width: 1),                          ),
                        ),// optional styling for the text inside
                      ),
                    ),
                    Container(
                      height: 56.h,
                      width: 56.w,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        border: Border.all(
                          color: isDarkMode? Palette.hintText : Palette.blueSides,
                        ),
                        color: isDarkMode ? Palette.filledTextField :  Palette.textFieldBlue, // light orange color
                      ),
                      child: TextFormField(

                        onChanged: (value) {
                          if (value.length == 1) {
                            setState(() {
                              otp3 = int.parse(value);
                            });
                            FocusScope.of(context).nextFocus();
                          }
                        },
                        keyboardType: TextInputType.number,
                        textAlign: TextAlign.center,
                        inputFormatters: [
                          LengthLimitingTextInputFormatter(1),
                          FilteringTextInputFormatter.digitsOnly,
                        ],
                        style:  TextStyle(fontSize: 20.55.sp,),
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color:  isDarkMode ? Colors.transparent :Palette.blue,
                                width: 1),                          ),
                        ),// optional styling for the text inside
                      ),
                    ),
                    Container(
                      height: 56.h,
                      width: 56.w,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        border: Border.all(
                          color: isDarkMode? Palette.hintText : Palette.blueSides,
                        ),
                        color: isDarkMode ? Palette.filledTextField :  Palette.textFieldBlue, // light orange color
                      ),
                      child: TextFormField(

                        onChanged: (value) {
                          if (value.length == 1) {
                            setState(() {
                              otp4 = int.parse(value) ;
                            });
                            FocusScope.of(context).nextFocus();
                          }
                        },
                        keyboardType: TextInputType.number,
                        textAlign: TextAlign.center,
                        inputFormatters: [
                          LengthLimitingTextInputFormatter(1),
                          FilteringTextInputFormatter.digitsOnly,
                        ],
                        style:  TextStyle(fontSize: 20.55.sp,),
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color:  isDarkMode ? Colors.transparent :Palette.blue,

                                width: 1),
                          ),
                        ),// optional styling for the text inside
                      ),
                    ),

                  ],
                ),
              ),
              SizedBox(height: 60.h,),
              SizedBox(
                width: 304.w,
                height: 56.h,
                child: ElevatedButton(
                  onPressed: verifyEmail,
                  child: Text(
                    "Submit",
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

            ],
          ),
        ),
      ),
    );
  }
}
