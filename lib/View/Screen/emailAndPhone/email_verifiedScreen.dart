import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:investor_flutter/Theme/Palette/palette.dart';
import 'package:provider/provider.dart';

import '../../../Theme/theme_manager.dart';

class EmailVerifiedScreen extends StatefulWidget {
  const EmailVerifiedScreen({Key? key}) : super(key: key);

  @override
  State<EmailVerifiedScreen> createState() => _EmailVerifiedScreenState();
}

class _EmailVerifiedScreenState extends State<EmailVerifiedScreen> {
  @override
  Widget build(BuildContext context) {
    final themeManager = Provider.of<ThemeManager>(context);
    final isDarkMode = themeManager.themeMode == ThemeMode.dark;
    ScreenUtil.init(context, designSize: const Size(428, 926));
    return Scaffold(
      backgroundColor: isDarkMode ? Palette.darkBackground : Palette.baseBackground,
      body: SafeArea(
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              isDarkMode ?SvgPicture.asset("assets/icons/darkVerfied.svg",height: 182.h,width: 182.w,) :SvgPicture.asset("assets/icons/done.svg",height: 60.h,width: 60.w,),
              SizedBox(height: 10.h,),
              Text("Verified!",style: TextStyle(
                  color: isDarkMode ? Palette.darkWhite : Palette.baseElementDark,
                  fontWeight: FontWeight.w700,fontSize: 28.sp),),
              SizedBox(height: 10.h,),
              Text("We’ve verified your email successfully.",style: TextStyle(
                  color: isDarkMode ? Palette.hintText : Palette.baseGrey,
                  fontWeight: FontWeight.w400,fontSize: 18.sp),)
            ],
          ),
        ),
      ),
    );
  }
}
