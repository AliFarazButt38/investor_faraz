import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'package:provider/provider.dart';

import '../../../Theme/Palette/palette.dart';
import '../../../Theme/theme_manager.dart';

class InvestContributionScreen1 extends StatefulWidget {
  const InvestContributionScreen1({Key? key}) : super(key: key);

  @override
  State<InvestContributionScreen1> createState() => _InvestContributionScreen1State();
}

class _InvestContributionScreen1State extends State<InvestContributionScreen1> {
  @override
  Widget build(BuildContext context) {
    final themeManager = Provider.of<ThemeManager>(context);
    final isDarkMode = themeManager.themeMode == ThemeMode.dark;
    ScreenUtil.init(context, designSize: const Size(428, 926));
    return Scaffold(
      backgroundColor: isDarkMode ? Palette.darkBackground : Palette.baseBackground,
      body: SafeArea(child:
      Padding(
        padding: EdgeInsets.only(left: 15.w, right: 15.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                SizedBox(width:20.w),
                Text(
                  "Invest Contribution",
                  style: TextStyle(
                    color:isDarkMode ? Palette.darkWhite : Palette.baseElementDark,
                    fontSize: 28.sp,
                    fontWeight: FontWeight.w700,
                  ),
                ),

              ],
            ),
            Divider(
              color:isDarkMode? Color(0xff404550): Color(0xffDEDEDE),
              thickness: 1,
            ),
            Text(
              "Indicate initial investment and\nadditional monthly contribution",
              style: TextStyle(
                color:isDarkMode ? Palette.darkWhite : Palette.baseElementDark,
                fontSize: 22.sp,
                fontWeight: FontWeight.w700,
              ),
            ),

            Center(
              child: Container(
                height: 163.h,
                width: 380.w,
                decoration: BoxDecoration(
                  color:isDarkMode ? Palette.container : Palette.lightBlue,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Padding(
                  padding:
                  EdgeInsets.only(left: 15.w, right: 15.w, top: 20.h),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Starting Capital",
                            style: TextStyle(
                              color:isDarkMode ? Palette.darkWhite : Palette.baseElementDark,
                              fontSize: 16.sp,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                          Container(
                            width: 94.w,
                            height: 28.h,
                            decoration: BoxDecoration(
                              color:isDarkMode ? Palette.darkBackground: Palette.baseWhite,
                              borderRadius: BorderRadius.circular(12),
                            ),
                            alignment: Alignment.center,
                            child: Text(
                              "\$200,000",
                              style: TextStyle(
                                color: Palette.blue,
                                fontWeight: FontWeight.w700,
                                fontSize: 16.sp,
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 10.h,
                      ),
                      LinearPercentIndicator(
                        barRadius: Radius.circular(15.0),
                        animation: true,
                        lineHeight: 3,
                        percent: 0.6,
                        progressColor: Palette.blue,
                        backgroundColor: Color(0xff91C5FA),
                      ),
                      SizedBox(
                        height: 20.h,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Monthly Contribution",
                            style: TextStyle(
                              color:isDarkMode ? Palette.darkWhite : Palette.baseElementDark,
                              fontSize: 16.sp,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                          Container(
                            width: 70.w,
                            height: 28.h,
                            decoration: BoxDecoration(
                              color:isDarkMode ? Palette.darkBackground: Palette.baseWhite,
                              borderRadius: BorderRadius.circular(12),
                            ),
                            alignment: Alignment.center,
                            child: Text(
                              "\$2000",
                              style: TextStyle(
                                color: Palette.blue,
                                fontWeight: FontWeight.w700,
                                fontSize: 16.sp,
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 10.h,
                      ),
                      LinearPercentIndicator(
                        barRadius: Radius.circular(15.0),
                        animation: true,
                        lineHeight: 3,
                        percent: 0.4,
                        progressColor: Palette.blue,
                        backgroundColor: Color(0xff91C5FA),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Divider(
              color:isDarkMode? Color(0xff404550): Color(0xffDEDEDE),
              thickness: 1,
            ),
            Text(
              "Payment",
              style: TextStyle(
                color:isDarkMode ? Palette.darkWhite : Palette.baseElementDark,
                fontWeight: FontWeight.w700,
                fontSize: 18.sp,
              ),
            ),
        Center(
          child: Container(
            height: 80.h,
            width: 380.w,
            decoration: BoxDecoration(
              color:isDarkMode ? Palette.container : Palette.lightBlue,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                 Image.asset("assets/icons/investChase.png",height: 38.h,width: 38.w,),
                  Padding(
                    padding: EdgeInsets.only(left: 10.w,top: 10.w),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Chase",
                          style: TextStyle(
                            color:isDarkMode ? Palette.darkWhite : Palette.baseElementDark,
                            fontWeight: FontWeight.w700,
                            fontSize: 16.sp,
                          ),
                        ),
                        Text("Checking.... 1408",style: TextStyle(
                          color:isDarkMode ? Palette.hintText : Palette.baseGrey,
                          fontWeight: FontWeight.w400,
                          fontSize: 16.sp,
                        ),),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
            Center(
              child: Container(
                height: 120.h,
                width: 380.w,
                decoration: BoxDecoration(
                  color:isDarkMode ? Palette.container: Palette.lightBlue,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: RichText(
                    text: TextSpan(
                      style: TextStyle(
                        color:isDarkMode ? Palette.hintText : Palette.baseGrey, // Setting grey color for the non-highlighted text
                      ),
                      children: [
                        TextSpan(
                          text: 'By clicking place Order, you confirm that you have read and agreed to this Series "',
                        ),
                        TextSpan(
                          text: 'Operating Agreement',
                          style: TextStyle(
                            color: Palette.blue, // Setting blue color for the highlighted text
                          ),
                        ),
                        TextSpan(
                          text: '" the "',
                        ),
                        TextSpan(
                          text: 'Secondary Listing Agreement',
                          style: TextStyle(
                            color: Palette.blue, // Setting blue color for the highlighted text
                          ),
                        ),
                        TextSpan(
                          text: '" and the "',
                        ),
                        TextSpan(
                          text: 'Securities Transfer Agreement',
                          style: TextStyle(
                            color: Palette.blue, // Setting blue color for the highlighted text
                          ),
                        ),
                        TextSpan(
                          text: '".',
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(height: 10.h,),
            Center(
              child: SizedBox(
                width: 348.w,
                height: 56.h,
                child: ElevatedButton(
                  onPressed: () {
                  },
                  child: Text(
                    "Confirm Investment Amount",
                    style: TextStyle(color:Palette.baseWhite,
                      fontWeight: FontWeight.w700,
                      fontSize: 18.sp,
                    ),
                  ),
                  style: ElevatedButton.styleFrom(
                    primary:Palette.blue,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(height: 50.h,),
          ],
        ),
      )),
    );
  }
}
