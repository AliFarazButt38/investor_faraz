import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';
import 'package:investor_flutter/View/Screen/emailAndPhone/choose_password_screen.dart';
import 'package:investor_flutter/View/Screen/emailAndPhone/phone_otpScreen.dart';
import 'package:provider/provider.dart';
import '../../../Auth/auth_Service.dart';
import '../../../Theme/Palette/palette.dart';
import '../../../Theme/theme_manager.dart';

class EmailAddressScreen extends StatefulWidget {


  static String verify="";
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
  String? selectedCountry = 'US';
  String? errorMessage;
  final _formKey = GlobalKey<FormState>();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneController = TextEditingController();



  void checkEmail() async {
    if (isEmailValid) {
      setState(() {
        isCheckingEmail = true;
      });

      try {
        await AuthService.fetchEmail(emailController.text, context); // Call the AuthService method
      } finally {
        setState(() {
          isCheckingEmail = false;
        });
      }
    }
  }

  @override
  void initState(){
    phoneController.text;
    super.initState();

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

                            SizedBox(height: 30.h),
                            SizedBox(
                              width: 304.w,
                              height: 56.h,
                              child: ElevatedButton(
                                onPressed: isCheckingEmail ? null : (isEmailValid ? checkEmail : null),
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
                            selectorType: PhoneInputSelectorType.DIALOG,
                            showFlags: false,
                            trailingSpace: false,
                          ),
                          formatInput: true,
                          // Hide the country selector text
                          initialValue: PhoneNumber(isoCode: selectedCountry),
                          countries: ['US'],
                          // initialValue: PhoneNumber(isoCode: 'US'),
                          onInputChanged: (PhoneNumber number) {
                            print(number.phoneNumber);
                            mob_number = number.phoneNumber!.replaceAll(RegExp(r'[^0-9]'), '');
                            isPhoneNumberEntered = number.phoneNumber!.isNotEmpty;
                            // if (mob_number.length > 10) {
                            //   // Show error message
                            //   // You can use a SnackBar or any other method to display the error message to the user
                            //   ScaffoldMessenger.of(context).showSnackBar(
                            //       SnackBar(content: Text('Phone number should contain exactly 10 digits')));
                            // }
                            if (mob_number.length != 10) {
                              setState(() {
                                // Update the error message
                                errorMessage = 'Phone number should contain exactly 10 digits';
                              });
                            } else {
                              setState(() {
                                // Clear the error message
                                errorMessage = null;
                              });
                            }
                          },
                          errorMessage: errorMessage,
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
                    SizedBox(height: 10.h),
                    if (errorMessage != null)
                      Padding(
                        padding: EdgeInsets.only(top: 8),
                        child: Text(
                          errorMessage!,
                          style: TextStyle(color: Colors.red),
                        ),
                      ),
                    SizedBox(height: 30.h),
                    SizedBox(
                      width: 304.w,
                      height: 56.h,
                      child: ElevatedButton(
                        // onPressed: isPhoneNumberEntered ? () {
                        //   Navigator.push(context, MaterialPageRoute(builder: (context)=>PhoneOtpScreen()));
                        //   // Handle send OTP button press here
                        // }:null,
                        onPressed: ()async{
                          String countryCode = phoneController.text.startsWith('+') ? phoneController.text : '+${phoneController.text}';
                          String phoneNumber = mob_number;
                          String fullPhoneNumber = '$countryCode$phoneNumber';
                          await FirebaseAuth.instance.verifyPhoneNumber(
                            phoneNumber: fullPhoneNumber,
                            verificationCompleted: (PhoneAuthCredential credential) {},
                            verificationFailed: (FirebaseAuthException e) {},
                            codeSent: (String verificationId , int? resendToken) {
                              EmailAddressScreen.verify=verificationId;
                              Navigator.push(context, MaterialPageRoute(builder: (context)=>PhoneOtpScreen()));
                            },
                            codeAutoRetrievalTimeout: (String verificationId ) {},
                          );
                        },
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

                  ],
                ),
            ],
          ),
        ),
      ),
    );
  }
}
