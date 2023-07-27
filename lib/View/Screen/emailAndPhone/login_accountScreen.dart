// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:flutter_svg/flutter_svg.dart';
// import 'package:investor_flutter/View/Screen/bottom_navigation/bottom_navigation.dart';
// import 'package:investor_flutter/View/Screen/complete_your_profile/complete_profileScreen.dart';
// import 'package:provider/provider.dart';
//
// import '../../../Auth/auth_Service.dart';
// import '../../../Theme/Palette/palette.dart';
// import '../../../Theme/theme_manager.dart';
// import '../home_screens/home_screen.dart';
//
// class LoginToAccountScreen extends StatefulWidget {
//   @override
//   _LoginToAccountScreenState createState() => _LoginToAccountScreenState();
// }
//
// class _LoginToAccountScreenState extends State<LoginToAccountScreen> {
//
//   TextEditingController emailController = TextEditingController();
//   TextEditingController passwordController = TextEditingController();
//   bool isChecked = false;
//   bool isFieldsEmpty = true;
//   bool isPasswordVisible=false;
//   bool isCheckingLogin = false;
//
//   void showErrorMessage(BuildContext context) {
//     showDialog(
//       context: context,
//       builder: (BuildContext context) {
//         return Dialog(
//           shape: RoundedRectangleBorder(
//             borderRadius: BorderRadius.circular(16.0),
//           ),
//           backgroundColor: Colors.white,
//           elevation: 4.0,
//           child: Padding(
//             padding: EdgeInsets.all(16.0),
//             child: Column(
//               mainAxisSize: MainAxisSize.min,
//               crossAxisAlignment: CrossAxisAlignment.center,
//               children: [
//                 Icon(
//                   Icons.error_outline,
//                   size: 48,
//                   color: Colors.red, // Customize the error icon color
//                 ),
//                 SizedBox(height: 16.0),
//                 Text(
//                   "Error",
//                   style: TextStyle(
//                     fontWeight: FontWeight.bold,
//                     fontSize: 20,
//                     color: Colors.red,
//                   ),
//                 ),
//                 SizedBox(height: 16.0),
//                 Text(
//                   "Incorrect email or password. Please try again.",
//                   style: TextStyle(
//                     fontSize: 16,
//                     color: Colors.black,
//                   ),
//                   textAlign: TextAlign.center,
//                 ),
//                 SizedBox(height: 16.0),
//                 ElevatedButton(
//                   onPressed: () {
//                     Navigator.pop(context);
//                   },
//                   style: ElevatedButton.styleFrom(
//                     primary: Colors.blue, // Customize the button color
//                   ),
//                   child: Text(
//                     'OK',
//                     style: TextStyle(
//                       color: Colors.white,
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         );
//       },
//     );
//   }
// //
//   void login() async {
//     setState(() {
//       isCheckingLogin = true;
//     });
//
//     String? errorMessage = await AuthService.login(context, emailController, passwordController); // Call the static login method from AuthService
//
//     setState(() {
//       if (errorMessage != null) {
//         showErrorMessage(context);
//       }
//       isCheckingLogin = false;
//     });
//   }
//   // void login() {
//   //   String email = emailController.text.trim();
//   //   String password = passwordController.text.trim();
//   //
//   //   if (email.isEmpty || password.isEmpty) {
//   //     // Show an error message or perform appropriate action for empty fields
//   //     return;
//   //   }
//   //
//   //   // Show loading while checking the login
//   //   setState(() {
//   //     isCheckingLogin = true;
//   //   });
//   //
//   //   FirebaseAuth.instance
//   //       .signInWithEmailAndPassword(email: email, password: password)
//   //       .then((userCredential) {
//   //     // User login successful, move to the home screen or another screen as needed
//   //     Navigator.push(
//   //       context,
//   //       MaterialPageRoute(builder: (context) => NavigationBottom()),
//   //     );
//   //   }).catchError((error) {
//   //     // Handle login errors here
//   //     print('Failed to sign in: ${error.toString()}');
//   //     // Show an error message or perform appropriate action for login failure
//   //     showErrorMessage(context); // Call the showErrorMessage function to display the dialog
//   //   }).whenComplete(() {
//   //     // Reset the loading state after login attempt (whether successful or not)
//   //     setState(() {
//   //       isCheckingLogin = false;
//   //     });
//   //   });
//   // }
//
//   @override
//   Widget build(BuildContext context) {
//     final themeManager = Provider.of<ThemeManager>(context);
//     final isDarkMode = themeManager.themeMode == ThemeMode.dark;
//     return Scaffold(
//       backgroundColor: isDarkMode ? Palette.darkBackground : Palette.baseBackground,
//       body: SafeArea(
//         child: Padding(
//           padding: EdgeInsets.symmetric(horizontal: 15.w),
//           child: SingleChildScrollView(
//             child: Column(
//
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 SizedBox(height: 20.h,),
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                   children: [
//                     GestureDetector(
//                         onTap: (){
//                           Navigator.pop(context);
//                         },
//                         child: Image.asset("assets/icons/cross.png", height: 28.h, width: 28.w)),
//                     Padding(
//                       padding:  EdgeInsets.only(right: 170.w),
//                       child: SvgPicture.asset("assets/icons/investor.svg", width: 48.w, height: 39.h),
//                     ),
//                   ],
//                 ),
//                 SizedBox(height: 40.h,),
//                 Text(
//                   "Log into your account" ,
//                   style: TextStyle(
//                     fontSize: 28.sp,
//                     fontWeight: FontWeight.w700,
//                     color: isDarkMode ? Palette.darkWhite : Palette.baseElementDark,
//                   ),
//                 ),
//                 SizedBox(height: 30.h,),
//                 Center(
//                   child: Container(
//                     height: 80.h,
//                     width: 368.w,
//                     child: TextField(
//                       controller: emailController,
//                       onChanged: (value) {
//                         setState(() {
//                           isFieldsEmpty = emailController.text.trim().isEmpty && passwordController.text.trim().isEmpty;
//
//                         });
//                       },
//                       decoration: InputDecoration(
//                         labelText: "Enter email / phone number",
//                         labelStyle: TextStyle(
//                           color:isDarkMode ? Palette.darkWhite : Palette.baseElementDark,
//                           fontSize: 17.sp,
//                           fontWeight: FontWeight.w400,
//                         ),
//                         hintText: "Enter your email or phone",
//                         hintStyle: TextStyle(
//                           color: isDarkMode ? Palette.hintText : Palette.baseGrey,
//                           fontSize: 17.sp,
//                           fontWeight: FontWeight.w400,
//
//                         ),
//                         enabledBorder: OutlineInputBorder(
//                           borderSide: BorderSide(
//                             color: isDarkMode ? Palette.hintText :  Palette.blueSides, // Change border color if passwords don't match
//                           ),
//                           borderRadius: BorderRadius.circular(8.0),
//                         ),
//                         focusedBorder: OutlineInputBorder(
//                           borderSide: BorderSide(
//                             color: Palette.blue ,
//                           ),
//                           borderRadius: BorderRadius.circular(8.0),
//                         ),
//                         filled: true,
//                         fillColor: isDarkMode? Palette.filledTextField : Palette.textFieldBlue,
//                       ),
//                     ),
//                   ),
//                 ),
//                 SizedBox(height: 15.h,),
//                 Center(
//                   child: Container(
//                     height: 80.h,
//                     width: 368.w,
//                     child: Stack(
//                       children:[
//                         TextField(
//                           // Password TextField
//                           obscureText: !isPasswordVisible, // Hides the entered text
//                           controller: passwordController,
//                           onChanged: (value) {
//                             setState(() {
//                               // Reset the error state on change
//                             });
//                           },
//                           decoration: InputDecoration(
//                             labelText: "Password",
//                             labelStyle: TextStyle(
//                               color:isDarkMode ? Palette.darkWhite : Palette.baseElementDark,
//                               fontWeight: FontWeight.w400,
//                               fontSize: 17.sp,
//                             ),
//                             hintText: "Enter your password",
//                             hintStyle: TextStyle(
//                               color: isDarkMode ? Palette.hintText : Palette.baseGrey,
//                               fontWeight: FontWeight.w400,
//                               fontSize: 17.sp,
//                             ),
//                             enabledBorder: OutlineInputBorder(
//                               borderSide: BorderSide(
//                                 color: isDarkMode ? Palette.hintText :  Palette.blueSides, // Change border color if passwords don't match
//                               ),
//                               borderRadius: BorderRadius.circular(8.0),
//                             ),
//                             focusedBorder: OutlineInputBorder(
//                               borderSide: BorderSide(
//                                 color:Palette.blue, // Change border color if passwords don't match
//                               ),
//                               borderRadius: BorderRadius.circular(8.0),
//                             ),
//                             filled: true,
//                             fillColor: isDarkMode? Palette.filledTextField : Palette.textFieldBlue,
//                           ),
//                         ),
//                         Positioned(
//                           right: 8.0,
//                           top: 20,
//                           child: GestureDetector(
//                             onTap: (){
//                               setState(() {
//                                 isPasswordVisible = !isPasswordVisible; // Toggle text visibility
//                               });
//                             },
//                             child: ImageIcon(
//                               AssetImage("assets/icons/hide.png"),
//                               size: 24.sp,
//                               color: isPasswordVisible ? Palette.blue : (isDarkMode ? Palette.baseGrey : Palette.baseGrey),
//                             ),
//                           ),
//                         ),
//                       ],
//
//                     ),
//                   ),
//                 ),
//                 //           SizedBox(height: 20.h,),
//                 //           Padding(
//                 //             padding:  EdgeInsets.only(left: 10.w,right: 10.w),
//                 //             child: Row(
//                 //         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 //               children: [
//                 //
//                 //                     Container(
//                 //                     child: InkWell(
//                 //                         onTap: () {
//                 //             setState(() {
//                 //             isChecked = !isChecked;
//                 //             });
//                 //             },
//                 //                         child: Row(
//                 //                           children: [
//                 //                               Container(
//                 //                                 width: 20.w,
//                 //                                 height: 20.h,
//                 //                                 decoration: BoxDecoration(
//                 //                                   color: isChecked ? Palette.blue : Colors.transparent,
//                 //                                   borderRadius: BorderRadius.circular(4.0),
//                 //                                   border: isChecked ? null : Border.all(color: Palette.blue, width: 1.0),
//                 //                                 ),
//                 //                                 child: isChecked
//                 //                                     ? Icon(
//                 //                                   Icons.check,
//                 //                                   color: Palette.baseWhite,
//                 //                                   size: 18.sp,
//                 //                                 )
//                 //                                     : null,
//                 //                               ),
//                 //                               SizedBox(width: 8.0),
//                 //             Text(
//                 //               'Remember Me',
//                 //               style: TextStyle(
//                 //                 fontSize: 16.0.sp,
//                 //                 fontWeight: FontWeight.w400,
//                 //                 color: Palette.blue,
//                 //               ),
//                 //             ),
//                 //
//                 //         ],
//                 //       ),
//                 //   ),
//                 // ),
//                 //                 Text("Forgot Password?",style: TextStyle(
//                 //                   fontWeight: FontWeight.w700,
//                 //                   fontSize: 16.sp,
//                 //                  color: Palette.blue,
//                 //                 ),),
//                 //               ],
//                 //             ),
//                 //           ),
//                 //           SizedBox(height: 50.h,),
//                 SizedBox(height: 15.h,),
//                 Center(
//                   child: SizedBox(
//                     width: 304.w,
//                     height: 56.h,
//                     child: ElevatedButton(
//                       onPressed: isCheckingLogin ? null : login,
//                       child:isCheckingLogin
//                           ? CircularProgressIndicator(color: Colors.white)
//                           : Text(
//                         "Sign in",
//                         style: TextStyle(color: Colors.white,fontSize: 18.sp,fontWeight: FontWeight.w700),
//                       ),
//                       style: ElevatedButton.styleFrom(
//                         primary:  Palette.blue,
//                         shape: RoundedRectangleBorder(
//                           borderRadius: BorderRadius.circular(25.0),
//                         ),
//                       ),
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }


import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
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

class LoginToAccountScreen extends StatefulWidget {
  static String verify="";
  @override
  _LoginToAccountScreenState createState() => _LoginToAccountScreenState();
}

class _LoginToAccountScreenState extends State<LoginToAccountScreen> {

  bool isEmailSelected = true;
  bool isCheckingLogin = false;
  bool isPhoneSelected = false;
  bool isEmailValid = false;
  String mob_number = '';
  bool isPhoneNumberEntered = false;
  bool isCheckingEmail = false;
  String? selectedCountry = 'PK';
  String? errorMessage;
  bool isPasswordVisible=false;


  final _formKey = GlobalKey<FormState>();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController phoneController = TextEditingController();

  void showErrorMessage(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
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
                  "Incorrect email or password. Please try again.",
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
                    primary: Colors.blue, // Customize the button color
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
//
  void login() async {
    setState(() {
      isCheckingLogin = true;
    });

    String? errorMessage = await AuthService.login(context, emailController, passwordController); // Call the static login method from AuthService

    setState(() {
      if (errorMessage != null) {
        showErrorMessage(context);
      }
      isCheckingLogin = false;
    });
  }

  @override
  void initState(){
    phoneController.text;
    super.initState();
  }


  Future<bool> checkIfPhoneExists(String phoneNumber) async {
    try {
      final signInMethods = await FirebaseAuth.instance.fetchSignInMethodsForEmail(phoneNumber);

      // If the signInMethods list is not empty, it means the phone number is registered with Firebase
      return signInMethods.isNotEmpty;
    } catch (e) {
      print('Error checking phone number: $e');
      return false; // Return false in case of an error to handle it appropriately
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
              // Text(
              //   isEmailSelected ? "What's your email address?" : "What's your phone number?",
              //   style: TextStyle(
              //     fontSize: 28.sp,
              //     fontWeight: FontWeight.w700,
              //     color: isDarkMode ? Palette.darkWhite : Palette.baseElementDark,
              //   ),
              // ),
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
                                       // isEmailValid = value.isNotEmpty && value.contains('@') && value.contains('.');
                                        isEmailValid = RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                                            .hasMatch(emailController.text);
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

                            SizedBox(height: 30.h),
                            SizedBox(
                              width: 304.w,
                              height: 56.h,
                              child: ElevatedButton(
                                onPressed: isCheckingLogin ? null : login,
                                child: isCheckingLogin
                                    ? CircularProgressIndicator(color: Colors.white)
                                    : Text(
                                  "SignIn",
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
                          countries: ['PK'],
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
                            if (mob_number.length != 12) {
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
                        onPressed: () async {
                          String countryCode = phoneController.text.startsWith('+') ? phoneController.text : '+${phoneController.text}';
                          String phoneNumber = mob_number;
                          String fullPhoneNumber = '$countryCode$phoneNumber';

                          print('phone number $fullPhoneNumber');
                          bool phoneExists = await checkIfPhoneExists(fullPhoneNumber);

                          print('phoneexist $phoneExists');
                          if (phoneExists) {
                            // Show dialog if phone number already exists
                            showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return CupertinoAlertDialog(
                                  title: Text('Phone Number Exists'),
                                  content: Text('The entered phone number already exists.'),
                                  actions: [
                                    CupertinoDialogAction(
                                      child: Text('OK'),
                                      onPressed: () {
                                        Navigator.of(context).pop();
                                      },
                                    ),
                                  ],
                                );
                              },
                            );
                          } else {
                            // Proceed to send the OTP for verification
                            await FirebaseAuth.instance.verifyPhoneNumber(
                              phoneNumber: fullPhoneNumber,
                              verificationCompleted: (PhoneAuthCredential credential) {},
                              verificationFailed: (FirebaseAuthException e) {},
                              codeSent: (String verificationId , int? resendToken) {
                                LoginToAccountScreen.verify = verificationId;
                                Navigator.push(context, MaterialPageRoute(builder: (context) => PhoneOtpScreen(check: true,)));
                              },
                              codeAutoRetrievalTimeout: (String verificationId ) {},
                            );
                          }
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
