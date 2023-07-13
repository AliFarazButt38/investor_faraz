import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:investor_flutter/View/Screen/profile_screens/update_profileScreen.dart';
import 'package:provider/provider.dart';

import '../../../Theme/Palette/palette.dart';
import '../../../Theme/theme_manager.dart';

class PersonalProfileInfoScreen extends StatefulWidget {
  const PersonalProfileInfoScreen({Key? key}) : super(key: key);

  @override
  State<PersonalProfileInfoScreen> createState() =>
      _PersonalProfileInfoScreenState();
}

class _PersonalProfileInfoScreenState extends State<PersonalProfileInfoScreen> {
  @override
  Widget build(BuildContext context) {
    final themeManager = Provider.of<ThemeManager>(context);
    final isDarkMode = themeManager.themeMode == ThemeMode.dark;
    ScreenUtil.init(context, designSize: const Size(428, 926));
    return Scaffold(
      backgroundColor: isDarkMode ? Palette.darkBackground : Palette.baseBackground,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.only(left: 15.w, right: 15.w),
          child: Column(
            children: [
              SizedBox(height: 20.h,),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  isDarkMode? GestureDetector(
                    onTap: (){
                      Navigator.pop(context);
                    },
                    child:Image.asset("assets/icons/darkBack.png",height: 46.h,width: 46.w,),
                  ):
                  GestureDetector(
                    onTap: (){
                      Navigator.pop(context);
                    },
                    child:Image.asset("assets/icons/goBack.png",height: 46.h,width: 46.w,),
                  ),
                  SizedBox(width: 20.w,),
                  Text(
                    "Personal Profile",
                    style: TextStyle(
                      color:isDarkMode ? Palette.darkWhite : Palette.baseElementDark,
                      fontSize: 28.sp,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
              Spacer(),
              isDarkMode ?    GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => UpdateProfileScreen()));
                  },
                  child: SvgPicture.asset(
                    "assets/icons/darkEdit.svg",
                    height: 46.h,
                    width: 46.w,
                  )):
              GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => UpdateProfileScreen()));
                      },
                      child: SvgPicture.asset(
                        "assets/icons/edit.svg",
                        height: 46.h,
                        width: 46.w,
                      )),
                ],
              ),
              SizedBox(
                height: 10.h,
              ),
              Divider(
                color:isDarkMode? Color(0xff404550): Color(0xffDEDEDE),
                thickness: 1,
              ),
              SizedBox(
                height: 10.h,
              ),
             Image.asset(
                "assets/images/blueLineProfile.png",
                height: 100.h,
                width: 100.w,
              ),
              SizedBox(
                height: 10.h,
              ),
              Text(
                "John Smith",
                style: TextStyle(
                  color:isDarkMode ? Palette.darkWhite : Palette.baseElementDark,
                  fontSize: 30.sp,
                  fontWeight: FontWeight.w700,
                ),
              ),
              SizedBox(
                height: 5.h,
              ),
              Text(
                "example@gmail.com",
                style: TextStyle(
                  color:isDarkMode ? Palette.hintText : Palette.baseGrey,
                  fontSize: 18.sp,
                  fontWeight: FontWeight.w400,
                ),
              ),
              SizedBox(
                height: 10.h,
              ),
              Divider(
                color:isDarkMode? Color(0xff404550): Color(0xffDEDEDE),
                thickness: 1,
              ),
              SizedBox(
                height: 10.h,
              ),
              Container(
                height: 420.h,
                width: 380.w,
                decoration: BoxDecoration(
                  color:isDarkMode ? Palette.container : Palette.lightBlue,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Padding(
                  padding: EdgeInsets.all(10.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Email",
                            style: TextStyle(
                              color:isDarkMode ? Palette.darkWhite : Palette.baseElementDark,
                              fontSize: 16.sp,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          Text(
                            "example@gmail.com",
                            style: TextStyle(
                              color: Palette.blue,
                              fontSize: 16.sp,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ],
                      ),
                      Divider(
                        color:isDarkMode? Color(0xff404550): Color(0xffAFE0FF),
                        thickness: 1,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Password",
                            style: TextStyle(
                              color:isDarkMode ? Palette.darkWhite : Palette.baseElementDark,
                              fontSize: 16.sp,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          Text(
                            "*********",
                            style: TextStyle(
                              color: Palette.blue,
                              fontSize: 16.sp,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ],
                      ),
                      Divider(
                        color:isDarkMode? Color(0xff404550): Color(0xffAFE0FF),
                        thickness: 1,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Account type",
                            style: TextStyle(
                              color:isDarkMode ? Palette.darkWhite : Palette.baseElementDark,
                              fontSize: 16.sp,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          Text(
                            "Individual",
                            style: TextStyle(
                              color: Palette.blue,
                              fontSize: 16.sp,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ],
                      ),
                      Divider(
                        color:isDarkMode? Color(0xff404550): Color(0xffAFE0FF),
                        thickness: 1,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Employment status",
                            style: TextStyle(
                              color:isDarkMode ? Palette.darkWhite : Palette.baseElementDark,
                              fontSize: 16.sp,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          Text(
                            "Self Employed",
                            style: TextStyle(
                              color: Palette.blue,
                              fontSize: 16.sp,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ],
                      ),
                      Divider(
                        color:isDarkMode? Color(0xff404550): Color(0xffAFE0FF),
                        thickness: 1,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Employer name",
                            style: TextStyle(
                              color:isDarkMode ? Palette.darkWhite : Palette.baseElementDark,
                              fontSize: 16.sp,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          Text(
                            "John wick",
                            style: TextStyle(
                              color: Palette.blue,
                              fontSize: 16.sp,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ],
                      ),
                      Divider(
                        color:isDarkMode? Color(0xff404550): Color(0xffAFE0FF),
                        thickness: 1,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Job title",
                            style: TextStyle(
                              color:isDarkMode ? Palette.darkWhite : Palette.baseElementDark,
                              fontSize: 16.sp,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          Text(
                            "Manager",
                            style: TextStyle(
                              color: Palette.blue,
                              fontSize: 16.sp,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ],
                      ),
                      Divider(
                        color:isDarkMode? Color(0xff404550): Color(0xffAFE0FF),
                        thickness: 1,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Occupation industry",
                            style: TextStyle(
                              color:isDarkMode ? Palette.darkWhite : Palette.baseElementDark,
                              fontSize: 16.sp,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          Text(
                            "Industry Name",
                            style: TextStyle(
                              color: Palette.blue,
                              fontSize: 16.sp,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ],
                      ),
                    ],
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
