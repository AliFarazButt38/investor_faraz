import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:investor_flutter/View/Screen/home_screens/investmentInfo_screen.dart';
import 'package:provider/provider.dart';

import '../../../Theme/Palette/palette.dart';
import '../../../Theme/theme_manager.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({Key? key}) : super(key: key);

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  List<Map<String, dynamic>> imageList = [
    {
      "id": 1,
      "image_path": "assets/images/newEurope.png",
    },
    {
      "id": 2,
      "image_path": "assets/images/newEurope.png",
    },
    {
      "id": 3,
      "image_path": "assets/images/newEurope.png",
    },
  ];
  final CarouselController carouselController = CarouselController();
  int currentIndex = 0;
  int currentIndex2 = 0;
  List<Map<String, dynamic>> imageList2 = [
    {
      "id": 1,
      "image_path": "assets/images/newgreece.png",
    },
    {
      "id": 2,
      "image_path": "assets/images/newgreece.png",
    },
    {
      "id": 3,
      "image_path": "assets/images/newgreece.png",
    },
  ];
  @override
  Widget build(BuildContext context) {
    final themeManager = Provider.of<ThemeManager>(context);
    final isDarkMode = themeManager.themeMode == ThemeMode.dark;
    ScreenUtil.init(context, designSize: const Size(428, 926));
    return Scaffold(
      backgroundColor:
          isDarkMode ? Palette.darkBackground : Palette.baseBackground,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.only(left: 10.w, right: 10.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 20.h,
                ),
                Text(
                  "My investments",
                  style: TextStyle(
                      color: isDarkMode
                          ? Palette.darkWhite
                          : Palette.baseElementDark,
                      fontSize: 28.sp,
                      fontWeight: FontWeight.w700),
                ),
                SizedBox(
                  height: 10.h,
                ),
                Divider(
                  color: isDarkMode ? Color(0xff404550) : Color(0xffDEDEDE),
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
                            "Your total investments",
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
                            "\$105,000",
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
                  height: 10.h,
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => InvestmentInfoScreen()));
                  },
                  child: Stack(
                    children: [
                      Center(
                        child: Container(
                          height: 260.h,
                          width: 380.w,
                          child: CarouselSlider(
                            items: imageList.map((item) {
                              return Builder(
                                builder: (BuildContext context) {
                                  int index = imageList.indexOf(item);
                                  return ClipRRect(
                                    borderRadius: BorderRadius.circular(10),
                                    child: Image.asset(
                                      item["image_path"],
                                      fit: BoxFit.cover,
                                      width: double.infinity,
                                    ),
                                  );
                                },
                              );
                            }).toList(),
                            carouselController: carouselController,
                            options: CarouselOptions(
                              scrollPhysics: BouncingScrollPhysics(),
                              autoPlay: false,
                              aspectRatio: 2,
                              viewportFraction: 1,
                              onPageChanged: (index, reason) {
                                setState(() {
                                  currentIndex = index;
                                });
                              },
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        bottom:
                            20, // Adjust the bottom value to position the dots
                        left: 0,
                        right: 0,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: imageList.asMap().entries.map((entry) {
                            int index = entry.key;
                            return GestureDetector(
                              onTap: () =>
                                  carouselController.animateToPage(index),
                              child: Container(
                                width: 7,
                                height: 7,
                                margin: EdgeInsets.symmetric(horizontal: 3.0),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: currentIndex == index
                                      ? Palette.blue
                                      : Palette.baseWhite,
                                ),
                              ),
                            );
                          }).toList(),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 10.h,
                ),
                Padding(
                  padding: EdgeInsets.only(left: 12.w, right: 12.w),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Investment Value",
                        style: TextStyle(
                          color: isDarkMode
                              ? Palette.darkWhite
                              : Palette.baseElementDark,
                          fontSize: 24.sp,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      Text(
                        "90,000 USD",
                        style: TextStyle(
                          color: Palette.blue,
                          fontSize: 24.sp,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 10.h,
                ),
                Padding(
                  padding: EdgeInsets.only(left: 10.w),
                  child: Row(
                    children: [
                      Text(
                        "\$2,865/month",
                        style: TextStyle(
                          color: isDarkMode
                              ? Palette.darkWhite
                              : Palette.baseElementDark,
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      SizedBox(
                        width: 10.w,
                      ),
                      Container(
                        height: 6.h,
                        width: 6.w,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Color(0xff87D5FF),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 5.w),
                        child: Text(
                          "Regional Bundle",
                          style: TextStyle(
                            color: isDarkMode
                                ? Palette.hintText
                                : Palette.baseGrey,
                            fontSize: 16.sp,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 10.w,
                      ),
                      Container(
                        height: 6.h,
                        width: 6.w,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Color(0xff87D5FF),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 5.w),
                        child: Text(
                          "12 units",
                          style: TextStyle(
                            color: isDarkMode
                                ? Palette.hintText
                                : Palette.baseGrey,
                            fontSize: 16.sp,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 10.h,
                ),
                Divider(
                  color: isDarkMode ? Color(0xff404550) : Color(0xffDEDEDE),
                  thickness: 1,
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => InvestmentInfoScreen()));
                  },
                  child: Stack(
                    children: [
                      Center(
                        child: Container(
                          height: 260,
                          width: 380.w,
                          child: CarouselSlider(
                            items: imageList2.map((item) {
                              return Builder(
                                builder: (BuildContext context) {
                                  int index = imageList2.indexOf(item);
                                  return ClipRRect(
                                    borderRadius: BorderRadius.circular(10),
                                    child: Image.asset(
                                      item["image_path"],
                                      fit: BoxFit.cover,
                                      width: double.infinity,
                                    ),
                                  );
                                },
                              );
                            }).toList(),
                            carouselController: carouselController,
                            options: CarouselOptions(
                              scrollPhysics: BouncingScrollPhysics(),
                              autoPlay: false,
                              aspectRatio: 2,
                              viewportFraction: 1,
                              onPageChanged: (index, reason) {
                                setState(() {
                                  currentIndex2 = index;
                                });
                              },
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        bottom:
                            40, // Adjust the bottom value to position the dots
                        left: 0,
                        right: 0,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: imageList2.asMap().entries.map((entry) {
                            int index = entry.key;
                            return GestureDetector(
                              onTap: () =>
                                  carouselController.animateToPage(index),
                              child: Container(
                                width: 7,
                                height: 7,
                                margin: EdgeInsets.symmetric(horizontal: 3.0),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: currentIndex2 == index
                                      ? Palette.blue
                                      : Palette.baseWhite,
                                ),
                              ),
                            );
                          }).toList(),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 10.h,
                ),
                Padding(
                  padding: EdgeInsets.only(left: 12.w, right: 12.w),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Investment Value",
                        style: TextStyle(
                          color: isDarkMode
                              ? Palette.darkWhite
                              : Palette.baseElementDark,
                          fontSize: 24.sp,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      Text(
                        "90,000 USD",
                        style: TextStyle(
                          color: Palette.blue,
                          fontSize: 24.sp,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 10.h,
                ),
                Padding(
                  padding: EdgeInsets.only(left: 10.w),
                  child: Row(
                    children: [
                      Text(
                        "\$2,865/month",
                        style: TextStyle(
                          color: isDarkMode
                              ? Palette.darkWhite
                              : Palette.baseElementDark,
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      SizedBox(
                        width: 10.w,
                      ),
                      Container(
                        height: 6.h,
                        width: 6.w,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Color(0xff87D5FF),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 5.w),
                        child: Text(
                          "Regional Bundle",
                          style: TextStyle(
                            color: isDarkMode
                                ? Palette.hintText
                                : Palette.baseGrey,
                            fontSize: 16.sp,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 10.w,
                      ),
                      Container(
                        height: 6.h,
                        width: 6.w,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Color(0xff87D5FF),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 5.w),
                        child: Text(
                          "12 units",
                          style: TextStyle(
                            color: isDarkMode
                                ? Palette.hintText
                                : Palette.baseGrey,
                            fontSize: 16.sp,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 10.h,
                ),
                Divider(
                  color: isDarkMode ? Color(0xff404550) : Color(0xffDEDEDE),
                  thickness: 1,
                ),
                SizedBox(
                  height: 30.h,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
