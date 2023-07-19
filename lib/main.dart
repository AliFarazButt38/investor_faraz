import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:investor_flutter/Theme/theme_constant.dart';
import 'package:investor_flutter/Theme/theme_manager.dart';
import 'package:investor_flutter/View/Screen/emailAndPhone/email_address_screen.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'firebase_options.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  SharedPreferences prefs = await SharedPreferences.getInstance();
  bool isDarkMode = prefs.getBool('isDarkMode') ?? false;

  runApp(ChangeNotifierProvider<ThemeManager>(
      create:(_)=>ThemeManager(isDarkMode),
      child:  MyApp()));
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
      home:  EmailAddressScreen(),
    );
  }
}



