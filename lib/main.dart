import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:investor_flutter/Provider/myInvestmentsProvider.dart';
import 'package:investor_flutter/Provider/propertyProvider.dart';
import 'package:investor_flutter/Theme/theme_constant.dart';
import 'package:investor_flutter/Theme/theme_manager.dart';
import 'package:investor_flutter/View/Screen/bank_Screens/transaction_screen1.dart';
import 'package:investor_flutter/View/Screen/complete_your_profile/enterprise_infoScreen.dart';
import 'package:investor_flutter/View/Screen/complete_your_profile/personal_informationScreen.dart';
import 'package:investor_flutter/View/Screen/emailAndPhone/email_address_screen.dart';
import 'package:investor_flutter/View/Screen/emailAndPhone/login_accountScreen.dart';
import 'package:investor_flutter/View/Screen/emailAndPhone/phone_otpScreen.dart';

import 'package:investor_flutter/View/Screen/home_screens/dashboard_screen.dart';
import 'package:investor_flutter/View/Screen/splash_screen.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'Provider/userProvider.dart';
import 'View/Screen/emailAndPhone/email_verificationScreen.dart';
import 'firebase_options.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  SharedPreferences prefs = await SharedPreferences.getInstance();
  bool isDarkMode = prefs.getBool('isDarkMode') ?? false;

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider<ThemeManager>(
          create: (_) => ThemeManager(isDarkMode),
        ),
        ChangeNotifierProvider<UserPersonalInfoProvider>(
          create: (_) => UserPersonalInfoProvider(),
        ),

        ChangeNotifierProvider<PropertyInfoProvider>(
          create: (_) => PropertyInfoProvider(),
        ),
        ChangeNotifierProvider<MyInvestmentsProvider>(
          create: (_) => MyInvestmentsProvider(),
        ),
      ],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    final themeManager = Provider.of<ThemeManager>(context);
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
         theme: lightTheme,
      darkTheme: darkTheme,
      themeMode: themeManager.themeMode,
      home:SplashScreen(),
    );
  }
}
