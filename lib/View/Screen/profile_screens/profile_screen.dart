import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:investor_flutter/Theme/Palette/palette.dart';
import 'package:investor_flutter/Theme/theme_manager.dart';
import 'package:investor_flutter/View/Screen/bank_Screens/transaction_screen1.dart';
import 'package:investor_flutter/View/Screen/emailAndPhone/login_accountScreen.dart';
import 'package:investor_flutter/View/Screen/profile_screens/personal_profile_infoScreen.dart';
import 'package:provider/provider.dart';

class ProfilePage extends StatefulWidget {
  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    final themeManager = Provider.of<ThemeManager>(context);
    final isDarkMode = themeManager.themeMode == ThemeMode.dark;
    ScreenUtil.init(context, designSize: const Size(428, 926));
    return Consumer<ThemeManager>(builder: (context, themeManager, _) {
      return Scaffold(
        backgroundColor:
            isDarkMode ? Palette.darkBackground : Palette.baseBackground,
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.only(left: 15.w, right: 15.w),
            child: ListView(
              children: [
                SizedBox(
                  height: 20.h,
                ),
                Row(
                  children: [
                    isDarkMode
                        ? GestureDetector(
                            onTap: () {
                              Navigator.pop(context);
                            },
                            child: Image.asset(
                              "assets/icons/darkBack.png",
                              height: 46.h,
                              width: 46.w,
                            ),
                          )
                        : GestureDetector(
                            onTap: () {
                              Navigator.pop(context);
                            },
                            child: Image.asset(
                              "assets/icons/goBack.png",
                              height: 46.h,
                              width: 46.w,
                            ),
                          ),
                    SizedBox(
                      width: 20.w,
                    ),
                    Text(
                      "Profile",
                      style: TextStyle(
                        color: isDarkMode
                            ? Palette.darkWhite
                            : Palette.baseElementDark,
                        fontSize: 28.sp,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 10.h,
                ),
                Divider(
                  color: isDarkMode ? Palette.container : Color(0xffDEDEDE),
                  thickness: 1,
                ),
                GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  PersonalProfileInfoScreen()));
                    },
                    child: buildListTile(
                        'assets/icons/settings.svg', 'Profile Settings',
                        themeManager: themeManager)),
                Divider(
                  color: isDarkMode ? Palette.container : Color(0xffDEDEDE),
                  thickness: 1,
                ),
                buildListTile('assets/icons/accountSetup.svg', 'Account Setup',
                    themeManager: themeManager),
                Divider(
                  color: isDarkMode ? Palette.container : Color(0xffDEDEDE),
                  thickness: 1,
                ),
                GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => TransactionScreen1()));
                    },
                    child: buildListTile(
                        'assets/icons/bank_account.svg', 'Bank Account',
                        themeManager: themeManager)),
                Divider(
                  color: isDarkMode ? Palette.container : Color(0xffDEDEDE),
                  thickness: 1,
                ),
                buildListTile('assets/icons/settings.svg', 'Documents',
                    themeManager: themeManager),
                Divider(
                  color: isDarkMode ? Palette.container : Color(0xffDEDEDE),
                  thickness: 1,
                ),
                buildListTile(
                    'assets/icons/cutomer_support.svg', 'Customer Support',
                    themeManager: themeManager),
                Divider(
                  color: isDarkMode ? Palette.container : Color(0xffDEDEDE),
                  thickness: 1,
                ),
                buildListTile(
                    'assets/icons/privacypolicy.svg', 'Privacy Policy',
                    themeManager: themeManager),
                Divider(
                  color: isDarkMode ? Palette.container : Color(0xffDEDEDE),
                  thickness: 1,
                ),
                buildListTile('assets/icons/darkmode.svg', 'Dark Mode',
                    hasTrailingIcon: true, themeManager: themeManager),
                Divider(
                  color: isDarkMode ? Palette.container : Color(0xffDEDEDE),
                  thickness: 1,
                ),
                GestureDetector(
                    onTap: () {
                      Navigator.pushAndRemoveUntil(
                          context,
                          MaterialPageRoute(
                              builder: (context) => LoginToAccountScreen()),
                          (route) => false);
                    },
                    child: buildListTile('assets/icons/logout.svg', 'Log Out',
                        themeManager: themeManager)),
                SizedBox(
                  height: 10.h,
                ),
                Center(
                  child: Text(
                    "1.3.0",
                    style: TextStyle(
                      color: isDarkMode ? Palette.hintText : Palette.baseGrey,
                      fontWeight: FontWeight.w700,
                      fontSize: 20.sp,
                    ),
                  ),
                ),
                SizedBox(
                  height: 30.h,
                ),
              ],
            ),
          ),
        ),
      );
    });
  }

  Widget buildListTile(String iconPath, String title,
      {bool hasTrailingIcon = false, required ThemeManager themeManager}) {
    final isDarkMode = themeManager.themeMode == ThemeMode.dark;
    final textColor = isDarkMode ? Palette.darkWhite : Palette.baseElementDark;

    return ListTile(
      leading: SvgPicture.asset(
        iconPath,
        width: 24.w,
        height: 24.h,
      ),
      title: Text(
        title,
        style: TextStyle(
          color: textColor,
          fontWeight: FontWeight.w400,
          fontSize: 16.sp,
        ),
      ),
      trailing: hasTrailingIcon
          ? Switch(
              activeColor: Palette.darkWhite,
              activeTrackColor: Palette.blue,
              inactiveTrackColor: Color(0xffE2E2E2),
              value: isDarkMode,
              onChanged: (newValue) {
                themeManager.toggleTheme(newValue);
              },
            )
          : null,
    );
  }
}
