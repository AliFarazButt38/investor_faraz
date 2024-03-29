import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

import '../../../Theme/Palette/palette.dart';
import 'package:percent_indicator/percent_indicator.dart';

import '../../../Theme/theme_manager.dart';
import '../../Widget/line_chart.dart';

class WealthCalculatorScreen extends StatefulWidget {
  const WealthCalculatorScreen({Key? key}) : super(key: key);

  @override
  State<WealthCalculatorScreen> createState() => _WealthCalculatorScreenState();
}

class _WealthCalculatorScreenState extends State<WealthCalculatorScreen> {
  bool isProcessExpanded = false;

  void toggleExpanded() {
    setState(() {
      isProcessExpanded = !isProcessExpanded;
    });
  }

  bool isInvestmentExpanded = false;

  void toggleInvestmentExpanded() {
    setState(() {
      isInvestmentExpanded = !isInvestmentExpanded;
    });
  }

  bool isFeesExpanded = false;

  void toggleFeesExpanded() {
    setState(() {
      isFeesExpanded = !isFeesExpanded;
    });
  }

  @override
  Widget build(BuildContext context) {
    final themeManager = Provider.of<ThemeManager>(context);
    final isDarkMode = themeManager.themeMode == ThemeMode.dark;
    ScreenUtil.init(context, designSize: const Size(428, 926));
    return Scaffold(
      backgroundColor: isDarkMode ? Palette.darkBackground : Palette.baseBackground,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.only(left: 10.w, right: 10.w),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 20.h,),
                Text(
                  "Wealth Calculator",
                  style: TextStyle(
                      color:isDarkMode? Palette.darkWhite: Palette.baseElementDark,
                      fontSize: 28.sp,
                      fontWeight: FontWeight.w700),
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
                Center(
                  child: Container(
                    width: 380.w,
                    height: 103.h,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      gradient: LinearGradient(
                        colors: [
                          Color(0xFF000C79),
                          Color(0xFF358CB8),
                        ],
                      ),
                    ),
                    child: Padding(
                      padding:
                          EdgeInsets.only(left: 15.w, right: 10.w, top: 15.h),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Projected wealth in 2027",
                            style: TextStyle(
                              color: Palette.baseWhite,
                              fontSize: 16.sp,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                          SizedBox(
                            height: 10.h,
                          ),
                          Text(
                            "\$562,789",
                            style: TextStyle(
                              color: Color(0xff25E3EF),
                              fontSize: 32.sp,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 15.h,
                ),
                Center(
                  child: Container(
                    height: 170.h,
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
                                "Total invested",
                                style: TextStyle(
                                  color:isDarkMode ? Palette.darkWhite : Palette.baseElementDark,
                                  fontSize: 16.sp,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                              Text(
                                "\$490,000",
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
                                "Total earns",
                                style: TextStyle(
                                  color:isDarkMode ? Palette.darkWhite : Palette.baseElementDark,
                                  fontSize: 16.sp,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                              Text(
                                "\$893,001",
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
                                "Return on investment",
                                style: TextStyle(
                                  color:isDarkMode ? Palette.darkWhite : Palette.baseElementDark,
                                  fontSize: 16.sp,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                              Text(
                                "4x",
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
                ),
                SizedBox(
                  height: 10.h,
                ),
                Center(
                  child: Container(
                    height: 172.h,
                    width: 380.w,
                    decoration: BoxDecoration(
                      color:isDarkMode ? Palette.container : Palette.lightBlue,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Padding(
                      padding:
                          EdgeInsets.only(left: 15.w, right: 15.w, top: 15.h),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            width: 180.w,
                            height: 24.h,
                            decoration: BoxDecoration(
                              color:isDarkMode ? Palette.darkBackground : Palette.baseWhite,
                              borderRadius: BorderRadius.circular(12),
                            ),
                         alignment: Alignment.center,
                            child: Text(
                              "Possibilities to grow",
                              style: TextStyle(
                                color:isDarkMode ? Palette.blue : Color(0xff286CA8),
                                fontWeight: FontWeight.w400,
                                fontSize: 16.sp,
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 10.h,
                          ),
                          SizedBox(
                              height: 120.h,
                              width: 332.w,
                              child: LineChartWidget()),
                        ],
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 10.h,
                ),
                Center(
                  child: Container(
                    height: 240.h,
                    width: 380.w,
                    decoration: BoxDecoration(
                      color:isDarkMode ? Palette.container : Palette.lightBlue,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Padding(
                      padding:
                          EdgeInsets.only(left: 15.w, right: 15.w, top: 15.h),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "Starting Capital",
                                style: TextStyle(
                                  color:isDarkMode ? Palette.darkWhite: Palette.baseElementDark,
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
                            height: 15.h,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "Monthly Investment",
                                style: TextStyle(
                                  color:isDarkMode ? Palette.darkWhite: Palette.baseElementDark,
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
                          SizedBox(
                            height: 15.h,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "Time Range",
                                style: TextStyle(
                                  color:isDarkMode ? Palette.darkWhite: Palette.baseElementDark,
                                  fontSize: 16.sp,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                              Container(
                                width: 81.w,
                                height: 28.h,
                                decoration: BoxDecoration(
                                  color:isDarkMode ? Palette.darkBackground: Palette.baseWhite,
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                alignment: Alignment.center,
                                child: Text(
                                  "10 Years",
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
                            percent: 0.2,
                            progressColor: Palette.blue,
                            backgroundColor: Color(0xff91C5FA),
                          ),
                          SizedBox(
                            height: 15.h,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "Annual Return",
                                style: TextStyle(
                                  color:isDarkMode ? Palette.darkWhite: Palette.baseElementDark,
                                  fontSize: 16.sp,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                              Container(
                                width: 49.w,
                                height: 28.h,
                                decoration: BoxDecoration(
                                  color:isDarkMode ? Palette.darkBackground: Palette.baseWhite,
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                alignment: Alignment.center,
                                child: Text(
                                  "17%",
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
                            percent: 0.1,
                            progressColor: Palette.blue,
                            backgroundColor: Color(0xff91C5FA),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 10.h,
                ),
                Center(
                  child: Container(
                    height: 500.h,
                    width: 380.w,
                    decoration: BoxDecoration(
                      color:isDarkMode ? Palette.container : Palette.lightBlue,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Padding(
                      padding:
                          EdgeInsets.only(left: 15.w, right: 15.w, top: 15.h),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "Frequently ask questions",
                                style: TextStyle(
                                  color:isDarkMode ? Palette.darkWhite : Palette.baseElementDark,
                                  fontSize: 20.sp,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                              Text(
                                "See all",
                                style: TextStyle(
                                  color: Palette.blue,
                                  fontWeight: FontWeight.w700,
                                  fontSize: 15.sp,
                                ),
                              ),
                            ],
                          ),

                          Center(
                              child: SvgPicture.asset(
                                  "assets/images/question.svg")),

                          GestureDetector(
                            onTap: toggleExpanded,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                    "What Is Meant By a Step-by-Step\nProcess?"),
                                Icon(
                                  isProcessExpanded
                                      ? Icons.arrow_drop_up
                                      : Icons.arrow_drop_down,
                                ),
                              ],
                            ),
                          ),
                          if (isProcessExpanded)
                            Flexible(
                              child: SingleChildScrollView(
                                child: Text(
                                  "Additional details or steps can be shown here...\nd\nrfer\ndfd",
                                  // Additional styling properties can be added as needed
                                ),
                              ),
                            ),
                          Divider(
                            color:isDarkMode? Color(0xff404550): Color(0xffAFE0FF),
                            thickness: 1,
                          ),
                          GestureDetector(
                            onTap: toggleInvestmentExpanded,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text("How Will Be My Investment\nProtect?"),
                                Icon(
                                  isInvestmentExpanded
                                      ? Icons.arrow_drop_up
                                      : Icons.arrow_drop_down,
                                ),
                              ],
                            ),
                          ),
                          if (isInvestmentExpanded)
                            Flexible(
                              child: SingleChildScrollView(
                                child: Text(
                                  "Additional details or steps can be shown here...\nd\nrfer\ndfd",
                                  // Additional styling properties can be added as needed
                                ),
                              ),
                            ),
                          Divider(
                            color:isDarkMode? Color(0xff404550): Color(0xffAFE0FF),
                            thickness: 1,
                          ),
                          GestureDetector(
                            onTap: toggleFeesExpanded,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                    "What Are The Total Fees For Profit\nFund?"),
                                Icon(
                                  isFeesExpanded
                                      ? Icons.arrow_drop_up
                                      : Icons.arrow_drop_down,
                                ),
                              ],
                            ),
                          ),
                          if (isFeesExpanded)
                            Flexible(
                              child: SingleChildScrollView(
                                child: Text(
                                  "Additional details or steps can be shown here...\nd\nrfer\ndfd",
                                  // Additional styling properties can be added as needed
                                ),
                              ),
                            ),
                        ],
                      ),
                    ),
                  ),
                ),
              SizedBox(height: 50.h,),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
