import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';
import 'package:investor_flutter/View/Screen/emailAndPhone/choose_password_screen.dart';
import 'package:investor_flutter/View/Screen/emailAndPhone/phone_otpScreen.dart';
import 'package:provider/provider.dart';

import '../../../Theme/Palette/palette.dart';
import '../../../Theme/theme_manager.dart';

class EmailAddressScreen extends StatefulWidget {
  @override
  _EmailAddressScreenState createState() => _EmailAddressScreenState();
}

class _EmailAddressScreenState extends State<EmailAddressScreen> {

  bool isEmailSelected = true;
  bool isPhoneSelected = false;
  bool isEmailValid = false;
  String mob_number = '';
  bool isPhoneNumberEntered = false;
  bool isCheckingEmail = false;

  final _formKey = GlobalKey<FormState>();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneController = TextEditingController();

  void continueButtonPressed() async {
    if (isEmailValid) {
      setState(() {
        isCheckingEmail = true;
      });

      try {
        var signInMethods = await FirebaseAuth.instance.fetchSignInMethodsForEmail(emailController.text);
        if (signInMethods.isNotEmpty) {
          // Email already exists, show dialog
          showDialog(
            context: context,
            builder: (context) => AlertDialog(
              title: Text(
                'Email Already Exists',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                  color: Colors.red, // Customize the text color
                ),
              ),
              content: Text(
                'The email address is already registered.',
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.black, // Customize the text color
                ),
              ),
              actions: <Widget>[
                ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  style: ElevatedButton.styleFrom(
                    primary: Colors.blue, // Customize the button color
                  ),
                  child: Text(
                    'OK',
                    style: TextStyle(
                      color: Colors.white, // Customize the text color
                    ),
                  ),
                ),
              ],
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16.0), // Customize the border radius
              ),
              backgroundColor: Colors.white, // Customize the background color
              elevation: 4.0, // Customize the elevation
            ),
          );
        } else {
          // Email does not exist, move to the next screen (ChoosePasswordScreen)
          String userEmail = emailController.text;
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => ChoosePasswordScreen(userEmail: userEmail),
            ),
          );
        }
      } catch (e) {
        // Handle any error that may occur during email existence check
        print('Error checking email existence: $e');
      } finally {
        setState(() {
          isCheckingEmail = false;
        });
      }
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
                  // Add your logos here
                ],
              ),
              SizedBox(height: 40.h),
              Text(
                isEmailSelected ? "What's your email address?" : "What's your phone number?",
                style: TextStyle(
                  fontSize: 28.sp,
                  fontWeight: FontWeight.w700,
                  color: isDarkMode ? Palette.darkWhite : Palette.baseElementDark,
                ),
              ),
              SizedBox(height: 30.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        isEmailSelected = true;
                        isPhoneSelected = false;
                      });
                    },
                    child: Column(
                      children: [


                        Row(
                          children: [
                            SvgPicture.asset("assets/icons/email.svg", color: isDarkMode ? (isEmailSelected ? Palette.blue : Colors.white) : (isEmailSelected ? Palette.blue : Palette.baseElementDark),
                            ),
                            Text(
                              "Email",
                              style: TextStyle(
                                color: isDarkMode ? (isEmailSelected ? Palette.blue : Colors.white) : (isEmailSelected ? Palette.blue : Palette.baseElementDark),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 10.h,),
                        Container(
                          width: 179.w,
                          height: 5.0.h,
                          decoration: BoxDecoration(
                            color: isEmailSelected ?Palette.blue : Colors.transparent,
                            borderRadius: BorderRadius.circular(2.5),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(width: 10.w),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        isEmailSelected = false;
                        isPhoneSelected = true;
                      });
                    },
                    child: Column(
                      children: [

                        Row(

                          children: [
                            SvgPicture.asset("assets/icons/phone.svg",  color: isDarkMode ? (isPhoneSelected ? Palette.blue : Colors.white) : (isPhoneSelected ? Palette.blue : Palette.baseElementDark),
                            ),

                            Text(
                              "Phone",
                              style: TextStyle(
                                color: isDarkMode ? (isPhoneSelected  ? Palette.blue : Colors.white) : (isPhoneSelected ? Palette.blue : Palette.baseElementDark),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 10.h),
                        Container(
                          width: 179.w,
                          height: 5.0.h,
                          decoration: BoxDecoration(
                            color: isPhoneSelected ? Palette.blue : Colors.transparent,
                            borderRadius: BorderRadius.circular(2.5),
                          ),
                        ),

                      ],
                    ),
                  ),
                ],
              ),

              SizedBox(height: 40.h),
              Form(
                    key: _formKey,
                  child: Column(
                children: [
                  if (isEmailSelected)
                    Column(
                      children: [
                        Container(
                          height: 80.h,
                          width: 368.w,
                          child: Stack(
                            children: [
                              TextFormField(
                                controller: emailController,
                                onChanged: (value) {
                                  setState(() {
                                    isEmailValid = value.isNotEmpty && value.contains('@');
                                  });
                                },
                                decoration: InputDecoration(
                                  labelText: "Email Address",
                                  labelStyle: TextStyle(
                                    color:isDarkMode ? Palette.darkWhite : Palette.baseElementDark,
                                    fontSize: 17.sp,
                                    fontWeight: FontWeight.w400,
                                  ),
                                  hintText: "example@gmail.com",
                                  hintStyle: TextStyle(
                                    color: isDarkMode ? Palette.hintText : Palette.baseGrey,
                                    fontSize: 17.sp,
                                    fontWeight: FontWeight.w400,

                                  ),
                                  enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: isEmailValid ? Palette.blue : (isDarkMode ? Palette.hintText : Palette.blueSides),
                                    ),
                                    borderRadius: BorderRadius.circular(8.0),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: isEmailValid ? Palette.blue : (isDarkMode ? Palette.hintText : Palette.blueSides),
                                    ),
                                    borderRadius: BorderRadius.circular(8.0),
                                  ),
                                  filled: true,
                                  fillColor: isDarkMode ? Palette.filledTextField : Palette.textFieldBlue,
                                ),
                              ),
                              if (isEmailValid)
                                Positioned(
                                  right: 8.0,
                                  top: 20,
                                  child: SvgPicture.asset("assets/icons/check.svg",
                                    height:20.73.h ,
                                    width: 20.73.w,

                                  ),
                                ),
                            ],
                          ),
                        ),

                        SizedBox(height: 50.h),
                        SizedBox(
                          width: 304.w,
                          height: 56.h,
                          child: ElevatedButton(
                            onPressed: isCheckingEmail ? null : (isEmailValid ? continueButtonPressed : null),
                            child: isCheckingEmail
                                ? CircularProgressIndicator(color: Colors.white)
                                : Text(
                              "Continue",
                              style: TextStyle(color: Palette.baseWhite, fontSize: 18.sp, fontWeight: FontWeight.w700),
                            ),
                            style: ElevatedButton.styleFrom(
                              primary: isEmailValid ? Palette.blue : Colors.grey,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(25.0),
                              ),
                            ),
                          ),
                        ),

                        SizedBox(height: 20.h),
                        SizedBox(
                          width: 304.w,
                          height: 56.h,
                          child: ElevatedButton(
                            onPressed: continueButtonPressed,
                            child: Text(
                              "Sign In",
                              style: TextStyle(color: Palette.blue),
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
                      ],
                    ),
                ],
              )),
              if (isPhoneSelected)
                Column(
                  children: [
                    Container(
                      height: 80.h,
                      width: 368.w,
                      decoration: BoxDecoration(
                          color: isDarkMode ? Palette.filledTextField: Palette.textFieldBlue,
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(
                            color: isDarkMode ? Palette.hintText : Palette.blueSides,
                          )
                      ),

                      child: Padding(
                        padding:  EdgeInsets.only(left: 10.w),
                        child: InternationalPhoneNumberInput(
                          selectorConfig: SelectorConfig(
                            selectorType: PhoneInputSelectorType.BOTTOM_SHEET,
                            showFlags: false,
                          ),
                          formatInput: true,
                          // initialValue: PhoneNumber(isoCode: 'US'),
                          onInputChanged: (PhoneNumber number) {
                            print(number.phoneNumber);
                            mob_number = number.phoneNumber.toString();
                            isPhoneNumberEntered = number.phoneNumber!.isNotEmpty;
                          },
                          errorMessage: 'Invalid phone number',
                          hintText: 'Phone number',

                          inputDecoration: InputDecoration(
                            filled: true,
                            fillColor:isDarkMode ?  Palette.filledTextField: Palette.textFieldBlue,
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide:BorderSide.none,

                            ),
                          ),
                          onInputValidated: (bool value) {},
                          onSaved: (PhoneNumber value) {
                            print('Number saved: ${value.phoneNumber}');
                          },
                          validator: (String? value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter your phone number';
                            }
                            return null;
                          },
                        ),
                      ),
                    ),
                    SizedBox(height: 50.h),
                    SizedBox(
                      width: 304.w,
                      height: 56.h,
                      child: ElevatedButton(
                        onPressed: isPhoneNumberEntered ? () {
                          Navigator.push(context, MaterialPageRoute(builder: (context)=>PhoneOtpScreen()));
                          // Handle send OTP button press here
                        }:null,
                        child: Text(
                          "Send OTP",
                          style: TextStyle(color: Colors.white),
                        ),
                        style: ElevatedButton.styleFrom(
                          primary:Palette.blue,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(25.0),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 20.h),
                    SizedBox(
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
                          primary: isDarkMode ? Palette.darkBackground : Color(0xffF8F8F8),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(25.0),
                            side: BorderSide(color: Palette.blue),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
            ],
          ),
        ),
      ),
    );
  }
}
