import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:investor_flutter/Provider/userProvider.dart';
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
          child: Consumer<UserPersonalInfoProvider>(

            builder: (context, userProvider, child) {
              return Column(
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
                                builder: (context) => UpdateProfileScreen(userModel: userProvider.user,)));
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
                                    builder: (context) => UpdateProfileScreen(userModel: userProvider.user,)));
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
                //   userProvider.user != null ? userProvider.user!.picture != '' ?
                //   Container(
                //     height: 100.h,
                //     width: 100.w,
                //     decoration: BoxDecoration(
                //       shape: BoxShape.circle,
                //       image: DecorationImage(
                //           image: NetworkImage(userProvider.user!.picture),
                //         fit: BoxFit.fill
                //       )
                //     ),
                //   )
                // : Container(
                //     height: 100.h,
                //     width: 100.w,
                //     decoration: BoxDecoration(
                //       shape: BoxShape.circle,
                //       color: Colors.grey.shade400,
                //     ),
                //   ):Container(
                //     height: 100.h,
                //     width: 100.w,
                //     decoration: BoxDecoration(
                //       shape: BoxShape.circle,
                //       color: Colors.grey.shade400,
                //     ),
                //
                //   ),
                  Container(
                    height: 100.h,
                    width: 100.w,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      image: userProvider.user != null &&
                          userProvider.user!.picture != null &&
                          userProvider.user!.picture.trim().isNotEmpty
                          ? DecorationImage(
                        image: NetworkImage(userProvider.user!.picture),
                        fit: BoxFit.fill,
                      )
                          : null,
                    ),
                    child: userProvider.user != null &&
                        userProvider.user!.picture != null &&
                        userProvider.user!.picture.trim().isEmpty
                        ? Image.asset(
                      "assets/icons/profileJohn.png",
                      height: 100.h,
                      width: 100.w,
                    )
                        : null,
                  ),

                  SizedBox(
                    height: 10.h,
                  ),
                  Text(
                  userProvider.user != null
                  ? userProvider.user!.accountType == 'Individual'
              ? userProvider.user!.employerName != ''
              ? userProvider.user!.employerName
                  : 'Employer Name'
                  : userProvider.user!.enterpriseName != ''
              ? userProvider.user!.enterpriseName
                  : 'Enterprise Name'
                  : '',
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
                    userProvider.user != null ? userProvider.user!.email != '' ? userProvider.user!.email : '':'Email',

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
                  if (userProvider.user != null &&
                      userProvider.user!.accountType == 'Individual')
                    _buildIndividualInfo(userProvider, isDarkMode)
                  else if (userProvider.user != null &&
                      userProvider.user!.accountType == 'Enterprise (Corporation or Trust)')
                    _buildEnterpriseInfo(userProvider, isDarkMode),
                ],
              );
            }
          ),
        ),
      ),
    );
  }
  Widget _buildIndividualInfo(
      UserPersonalInfoProvider userProvider, bool isDarkMode) {
    return Column(
      children: [
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
                      userProvider.user != null ? userProvider.user!.email != '' ? userProvider.user!.email : '':'',

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
                      userProvider.user != null ? userProvider.user!.accountType != '' ? userProvider.user!.accountType : '':'',

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
                      userProvider.user != null ? userProvider.user!.employStatus != '' ? userProvider.user!.employStatus : '':'',

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
                      userProvider.user != null ? userProvider.user!.employerName != '' ? userProvider.user!.employerName : '':'',

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
                      userProvider.user != null ? userProvider.user!.jobTitle != '' ? userProvider.user!.jobTitle : '':'',

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
                      userProvider.user != null ? userProvider.user!.occupationIndustry != '' ? userProvider.user!.occupationIndustry : '':'',

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
    );
  }

  Widget _buildEnterpriseInfo(
      UserPersonalInfoProvider userProvider, bool isDarkMode) {
    return Column(
      children: [
        Container(
          height: 390.h,
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
                      userProvider.user != null ? userProvider.user!.email != '' ? userProvider.user!.email : '':'',

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
                      userProvider.user != null ? userProvider.user!.accountType != '' ? userProvider.user!.accountType : '':'',

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
                      "Enterprise name",
                      style: TextStyle(
                        color:isDarkMode ? Palette.darkWhite : Palette.baseElementDark,
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    Text(
                      // "nAME",
                      userProvider.user != null ? userProvider.user!.enterpriseName!= '' ? userProvider.user!.enterpriseName : '':'',

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
                      "Signatory title",
                      style: TextStyle(
                        color:isDarkMode ? Palette.darkWhite : Palette.baseElementDark,
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    Text(
                      // "TITLE",
                      userProvider.user != null ? userProvider.user!.signatoryTitle != '' ? userProvider.user!.signatoryTitle : '':'',

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
                      "Enterprise formation date",
                      style: TextStyle(
                        color:isDarkMode ? Palette.darkWhite : Palette.baseElementDark,
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    Text(
                      userProvider.user != null ? userProvider.user!.enterpriseFormationDate != '' ? userProvider.user!.enterpriseFormationDate : '':'',
                      //     "DATE",
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
    );
  }



}
