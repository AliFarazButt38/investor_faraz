import 'package:flutter/material.dart';
import 'package:investor_flutter/View/Screen/bank_Screens/transaction_screen1.dart';
import 'package:investor_flutter/View/Screen/bank_Screens/transactions2_screen.dart';
import 'package:investor_flutter/View/Screen/bottom_navigation/bottom_navigation.dart';
import 'package:investor_flutter/View/Screen/complete_your_profile/account_typeScreen.dart';
import 'package:investor_flutter/View/Screen/complete_your_profile/complete_profileScreen.dart';
import 'package:investor_flutter/View/Screen/complete_your_profile/employement_InfoScreen.dart';
import 'package:investor_flutter/View/Screen/complete_your_profile/enterprise_infoScreen.dart';
import 'package:investor_flutter/View/Screen/complete_your_profile/fund_accountScreen.dart';
import 'package:investor_flutter/View/Screen/complete_your_profile/personal_informationScreen.dart';
import 'package:investor_flutter/View/Screen/complete_your_profile/statements_checkScreen.dart';
import 'package:investor_flutter/View/Screen/complete_your_profile/upload_documentsScreen.dart';
import 'package:investor_flutter/View/Screen/emailAndPhone/choose_password_screen.dart';
import 'package:investor_flutter/View/Screen/emailAndPhone/email_address_screen.dart';
import 'package:investor_flutter/View/Screen/emailAndPhone/email_verificationScreen.dart';
import 'package:investor_flutter/View/Screen/emailAndPhone/email_verifiedScreen.dart';
import 'package:investor_flutter/View/Screen/emailAndPhone/login_accountScreen.dart';
import 'package:investor_flutter/View/Screen/emailAndPhone/phone_otpScreen.dart';
import 'package:investor_flutter/View/Screen/home_screens/dashboard_screen.dart';
import 'package:investor_flutter/View/Screen/home_screens/explore_investmentScreen.dart';
import 'package:investor_flutter/View/Screen/home_screens/home_screen.dart';
import 'package:investor_flutter/View/Screen/home_screens/investmentInfo_screen.dart';
import 'package:investor_flutter/View/Screen/home_screens/property_infoScreen.dart';
import 'package:investor_flutter/View/Screen/home_screens/wealth_calculatorScreen.dart';
import 'package:investor_flutter/View/Screen/onBoarding/onboarding_screen.dart';
import 'package:investor_flutter/View/Screen/profile_screens/personal_profile_infoScreen.dart';
import 'package:investor_flutter/View/Screen/profile_screens/profile_screen.dart';
import 'package:investor_flutter/View/Screen/profile_screens/update_profileScreen.dart';
import 'View/Screen/complete_your_profile/document_Screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home:NavigationBottom(),
    );
  }
}

