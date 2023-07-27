import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:investor_flutter/View/Screen/bottom_navigation/bottom_navigation.dart';
import 'package:investor_flutter/View/Screen/complete_your_profile/complete_profileScreen.dart';
import 'package:investor_flutter/View/Screen/emailAndPhone/email_address_screen.dart';
import 'package:investor_flutter/View/Screen/emailAndPhone/login_accountScreen.dart';
import 'package:investor_flutter/View/Screen/home_screens/dashboard_screen.dart';
import 'package:provider/provider.dart';

import '../../../Theme/Palette/palette.dart';
import '../../../Theme/theme_manager.dart';

class PhoneOtpScreen extends StatefulWidget {
bool check;
PhoneOtpScreen({required this.check});
  @override
  _PhoneOtpScreenState createState() => _PhoneOtpScreenState();
}

class _PhoneOtpScreenState extends State<PhoneOtpScreen> {
  final FirebaseAuth auth= FirebaseAuth.instance;
  int otp1=0;
  int otp2=0;
  int otp3=0;
  int otp4=0;
  int otp5=0;
  int otp6=0;
  void showErrorDialogue(String errorMessage) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Verification Error'),
          content: Text(errorMessage),
          actions: <Widget>[
            TextButton(
              child: Text('OK'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  void verifyOTPAndNavigate() async {
    String enteredOTP =
        "$otp1$otp2$otp3$otp4$otp5$otp6"; // Concatenate all the OTP fields to a single string
    PhoneAuthCredential credential = PhoneAuthProvider.credential(
      verificationId: EmailAddressScreen.verify, // The verification ID received during phone number verification
      smsCode: enteredOTP,
    );

    try {
      // Try to sign in with the provided credentials
      await auth.signInWithCredential(credential);

      // If the sign-in is successful, navigate to the desired screen
      if(widget.check == true){
        Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) => NavigationBottom()), (route) => false);

      }else{
        Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) => CompleteYourProfile()), (route) => false);
      }

    } catch (e) {
      // Handle verification failure (e.g., wrong OTP entered)
      // Show an error dialogue with the error message
      showErrorDialogue('Incorrect OTP. Please try again.');
      print('Error: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context, designSize: const Size(428, 926));
    final themeManager = Provider.of<ThemeManager>(context);
    final isDarkMode = themeManager.themeMode == ThemeMode.dark;
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
                  InkWell(
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
                "Phone verification" ,
                style: TextStyle(
                  fontSize: 28.sp,
                  fontWeight: FontWeight.w700,
                  color: isDarkMode ? Palette.darkWhite : Palette.baseElementDark,
                ),
              ),
              SizedBox(height: 50.h,),
              Text("OTP",style: TextStyle(
                color: isDarkMode ? Palette.hintText : Palette.baseElementDark,
                fontSize: 17.sp,
                fontWeight: FontWeight.w400,
              ),),
              SizedBox(height: 40.h,),
              Padding(
                padding:  EdgeInsets.only(left: 40.w,right: 40.w),
                child: Row(

                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Container(
                      height: 50.h,
                      width: 50.w,
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
                          }else{
                            FocusScope.of(context).previousFocus();
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
                      height: 50.h,
                      width: 50.w,
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
                          }else{
                            FocusScope.of(context).previousFocus();
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
                      height: 50.h,
                      width: 50.w,
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
                          }else{
                            FocusScope.of(context).previousFocus();
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
                      height: 50.h,
                      width: 50.w,
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
                          }else{
                            FocusScope.of(context).previousFocus();
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
                      height: 50.h,
                      width: 50.w,
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
                              otp5 = int.parse(value) ;
                            });
                            FocusScope.of(context).nextFocus();
                          }else{
                            FocusScope.of(context).previousFocus();
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
                      height: 50.h,
                      width: 50.w,
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
                              otp6 = int.parse(value) ;
                            });
                            FocusScope.of(context).nextFocus();
                          }else{
                            FocusScope.of(context).previousFocus();
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


                  ],
                ),
              ),
              SizedBox(height: 50.h,),
              SizedBox(
                width: 304.w,
                height: 56.h,
                child: ElevatedButton(
                  onPressed: () {
                    verifyOTPAndNavigate();
                  },
                  child: Text(
                    "Submit OTP",
                    style: TextStyle(color: Colors.white,fontSize: 18.sp,fontWeight: FontWeight.w700),
                  ),
                  style: ElevatedButton.styleFrom(
                    primary:Palette.blue,
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
