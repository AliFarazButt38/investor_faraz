import 'dart:async';

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
  String email;
  EmailVerificationScreen({required this.email});
  @override
  _EmailVerificationScreenState createState() => _EmailVerificationScreenState();
}

class _EmailVerificationScreenState extends State<EmailVerificationScreen> {

  bool isEmailVerified = false;
  Timer? timer;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    FirebaseAuth.instance.currentUser?.sendEmailVerification();
    timer =
        Timer.periodic(const Duration(seconds: 3), (_) => verifyEmail());
  }



  @override
  void dispose() {
    // TODO: implement dispose
    timer?.cancel();
    super.dispose();
  }

  Future<void> verifyEmail() async {
    try {
      // Refresh the user's data to get the latest email verification status
      await FirebaseAuth.instance.currentUser!.reload();

      if (FirebaseAuth.instance.currentUser!.emailVerified) {
        // Email is verified, move to the CompleteYourProfileScreen
        timer?.cancel();
        Navigator.push(context, MaterialPageRoute(builder: (context) => EmailVerifiedScreen()));

        Future.delayed(Duration(seconds: 3), () {
          Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) => CompleteYourProfile()), (route) => false);
      //    Navigator.push(context, MaterialPageRoute(builder: (context) => CompleteYourProfile()));
          //Navigator.push(context, MaterialPageRoute(builder: (context) => LoginToAccountScreen()));
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
              Text("Check your Email",style: TextStyle(
                color: isDarkMode ? Palette.hintText : Palette.baseElementDark,
                fontSize: 17.sp,
                fontWeight: FontWeight.w700,
              ),),
              SizedBox(height: 10.h,),
              SizedBox(
                width: 428.w,
                child: Center(
                  child: Text("We have sent you a Email on ${widget.email}",style: TextStyle(
                    color: isDarkMode ? Palette.hintText : Palette.baseElementDark,
                    fontSize: 17.sp,
                    fontWeight: FontWeight.w400,
                  ),textAlign: TextAlign.center,),
                ),
              ),
              // SizedBox(height: 30.h,),
              // const Center(child: CircularProgressIndicator()),
              // const SizedBox(height: 8),
              //
              // const Padding(
              //   padding: EdgeInsets
              //       .symmetric(horizontal: 32.0),
              //   child: Center(
              //     child: Text(
              //       'Verifying email....',
              //       textAlign: TextAlign.center,
              //     ),
              //   ),
              // ),
              SizedBox(height: 60.h,),
              SizedBox(
                width: 304.w,
                height: 56.h,
                child: ElevatedButton(
                  onPressed: () async {
                    await FirebaseAuth.instance.currentUser?.sendEmailVerification();
                  },
                  child: Text(
                    "Resend",
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
