import 'dart:async';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:investor_flutter/Theme/Palette/palette.dart';
import 'package:investor_flutter/View/Screen/bottom_navigation/bottom_navigation.dart';
import 'package:investor_flutter/View/Screen/home_screens/home_screen.dart';
import 'package:investor_flutter/View/Screen/onBoarding/onboarding_screen.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';


import '../../Theme/theme_manager.dart';
import 'emailAndPhone/email_verificationScreen.dart';
import 'emailAndPhone/login_accountScreen.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<Color?> _backgroundColorAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: 5), // Reduced the duration to 5 seconds
    );
    final themeManager = Provider.of<ThemeManager>(context, listen: false);
    final isDarkMode = themeManager.themeMode == ThemeMode.dark;

    _backgroundColorAnimation = ColorTween(
      begin: isDarkMode ? Palette.darkBackground : Palette.lightBlue,
      end: Palette.blue,
    ).animate(_controller);

    _controller.addListener(() {
      if (_controller.isCompleted) {
        User? currentUser = FirebaseAuth.instance.currentUser;
        print("user : $currentUser");
        if (currentUser != null && currentUser.emailVerified) {
          Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(builder: (context) => NavigationBottom()),
                (Route<dynamic> route) => false,
          );
        } else {
          Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(builder: (context) => OnBoardingScreen()),
                (Route<dynamic> route) => false,
          );
        }
      }
    });

    _controller.forward();
  }

  @override
  Widget build(BuildContext context) {
    final themeManager = Provider.of<ThemeManager>(context);
    final isDarkMode = themeManager.themeMode == ThemeMode.dark;

    Color backgroundColor = _backgroundColorAnimation.value ?? Palette.blue;
    Color logoColor = _backgroundColorAnimation.value == Palette.blue
        ? Colors.white
        : isDarkMode
        ? Colors.white
        : Palette.blue;

    return Scaffold(
      backgroundColor: backgroundColor,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              child: SvgPicture.asset(
                'assets/images/appLogo.svg',
                color: logoColor,
                width: 192,
                height: 123,
              ),
            ),
            Text(
              "1.3.0",
              style: TextStyle(
                color: isDarkMode ? Palette.hintText : Palette.baseGrey,
                fontWeight: FontWeight.w700,
                fontSize: 20,
              ),
            ),
            SizedBox(height: 50),
          ],
        ),
      ),
    );
  }
}


