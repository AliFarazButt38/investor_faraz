import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:investor_flutter/Provider/myInvestmentsProvider.dart';
import 'package:investor_flutter/View/Screen/home_screens/investmentInfo_screen.dart';
import 'package:provider/provider.dart';

import '../../../Model/myInvestmenstModel.dart';
import '../../../Theme/Palette/palette.dart';
import '../../../Theme/theme_manager.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({Key? key}) : super(key: key);

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {


  final CarouselController carouselController1 = CarouselController();
  final CarouselController carouselController2 = CarouselController();
  List<int> currentIndexList = [0, 0]; // Initialize with 0 for both carousels

  List<Map<String, dynamic>> imageList = [
    {"id": 1, "image_path": "assets/images/newEurope.png"},
    {"id": 2, "image_path": "assets/images/newEurope.png"},
    {"id": 3, "image_path": "assets/images/newEurope.png"},
  ];

  List<Map<String, dynamic>> imageList2 = [
    {"id": 1, "image_path": "assets/images/newgreece.png"},
    {"id": 2, "image_path": "assets/images/newgreece.png"},
    {"id": 3, "image_path": "assets/images/newgreece.png"},
  ];
  @override
  void initState() {
    super.initState();
    Provider.of<MyInvestmentsProvider>(context, listen: false).getInvestmentData();
  }

  @override
  Widget build(BuildContext context) {
    // Calculate the Total Investment Value
    double totalInvestmentValue = 0.0;
    final myInvestmentsProvider = Provider.of<MyInvestmentsProvider>(context);

    for (final MyInvestmentModel investment in myInvestmentsProvider.myInvestmentList) {
      final String investmentAmountStr = investment.investmentAmount;
      if (investmentAmountStr.isNotEmpty) {
        final double investmentAmount = double.tryParse(investmentAmountStr) ?? 0.0;
        totalInvestmentValue += investmentAmount;
      }
    }
    final themeManager = Provider.of<ThemeManager>(context);
    final isDarkMode = themeManager.themeMode == ThemeMode.dark;
    ScreenUtil.init(context, designSize: const Size(428, 926));

    final List<Map<String, dynamic>> dashboardSections = [
      {
        "title": "Investment Value",
        "imageList": imageList,
        "carouselController": carouselController1,
        "currentIndex": 0, // Use currentIndexList[0]
        "value":"90,000USD",
        "monthlyValue":"\$2,865/month",
        "regionalBundle":"Regional Bundle",
        "units":"12 Units"
      },
      {
        "title": "Investment Value",
        "imageList": imageList2,
        "carouselController": carouselController2,
        "currentIndex": 1, // Use currentIndexList[1]
        "value":"90,000USD",
        "monthlyValue":"\$2,865/month",
        "regionalBundle":"Regional Bundle",
        "units":"12 Units"
      },

    ];
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
                            "\$$totalInvestmentValue",
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


                Consumer<MyInvestmentsProvider>(
                    builder: (context, myInvestmentsProvider, child){
                      final List<MyInvestmentModel> myInvestmentList =
                          myInvestmentsProvider.myInvestmentList;
                    return ListView.builder(
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      itemCount: myInvestmentList.length,
                      itemBuilder: (context, index) {
                        final MyInvestmentModel investment =
                        myInvestmentList[index];
                        final section = dashboardSections[index];
                        final String title = section["title"];
                        final List<Map<String, dynamic>> imageList = section["imageList"];
                        final CarouselController carouselController = section["carouselController"];
                        final int carouselIndex = section["currentIndex"];
                        final String value=section["value"];
                        final String monthlyValue=section["monthlyValue"];
                        final String regionalBundle=section["regionalBundle"];
                        final String units=section["units"];
                        final int currentIndex = currentIndexList[carouselIndex];

                        return Column(
                          children: [
                            SizedBox(height: 10.h),
                            GestureDetector(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(builder: (context) => InvestmentInfoScreen(investModel: myInvestmentsProvider.myInvestmentList[index],)),
                                );
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
                                              currentIndexList[carouselIndex] = index;
                                            });
                                          },
                                        ),
                                      ),
                                    ),
                                  ),
                                  Positioned(
                                    bottom: 30, // Adjust the bottom value to position the dots
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
                            SizedBox(height: 10.h),
                            Padding(
                              padding: EdgeInsets.only(left: 12.w, right: 12.w),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    title,
                                    style: TextStyle(
                                      color: isDarkMode
                                          ? Palette.darkWhite
                                          : Palette.baseElementDark,
                                      fontSize: 24.sp,
                                      fontWeight: FontWeight.w700,
                                    ),
                                  ),
                                  Text(
                                    value, // Placeholder for investment value
                                    style: TextStyle(
                                      color: Palette.blue,
                                      fontSize: 24.sp,
                                      fontWeight: FontWeight.w700,
                                    ),
                                  ),
                                ],
                              ),
                            ),

                            SizedBox(height: 10.h),

                            Padding(
                              padding: EdgeInsets.only(left: 10.w),
                              child: Row(
                                children: [
                                  Text(
                                    "${investment.investPerMonth}\$/month",
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
                                      "${investment.bundle} bundle",
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
                                     "${investment.unit} unit",
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
                               SizedBox(height: 10.h,),
                            // Placeholder for investment details
                            Divider(
                              color: isDarkMode ? Color(0xff404550) : Color(0xffDEDEDE),
                              thickness: 1,
                            ),
                          ],
                        );
                      },
                    );
                  }
                ),
                if (Provider.of<MyInvestmentsProvider>(context).isLoading)
                  Center(
                    child: CircularProgressIndicator(), // Loading indicator
                  ),
                 SizedBox(height: 30.h,),

              ],
            ),
          ),
        ),
      ),
    );
  }
}
