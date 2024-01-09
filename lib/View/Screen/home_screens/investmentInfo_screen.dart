import 'package:carousel_slider/carousel_controller.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:investor_flutter/Model/myInvestmenstModel.dart';
import 'package:investor_flutter/Model/property_model.dart';
import 'package:investor_flutter/View/Widget/line_chart.dart';
import 'package:provider/provider.dart';

import '../../../Theme/Palette/palette.dart';
import '../../../Theme/theme_manager.dart';

class InvestmentInfoScreen extends StatefulWidget {
  MyInvestmentModel investModel;
  InvestmentInfoScreen({Key? key, required this.investModel}) : super(key: key);

  @override
  State<InvestmentInfoScreen> createState() => _InvestmentInfoScreenState();
}

class _InvestmentInfoScreenState extends State<InvestmentInfoScreen> {
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
            crossAxisAlignment: CrossAxisAlignment.start,
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
                  Text("Investment Info",style: TextStyle(

                      color:isDarkMode? Palette.darkWhite: Palette.baseElementDark,
                      fontSize: 28.sp,fontWeight: FontWeight.w700),),
                  Spacer(),
                isDarkMode ?  Image.asset("assets/icons/darkupload.png",height: 46.h,width: 46.w,):
                  Image.asset("assets/icons/upload.png",height: 46.h,width: 46.w,),
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
              Stack(
                children: [
                  CarouselSlider(
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
                  Positioned(
                    bottom: 10, // Adjust the bottom value to position the dots
                    left: 0,
                    right: 0,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: imageList.asMap().entries.map((entry) {
                        int index = entry.key;
                        return GestureDetector(
                          onTap: () => carouselController.animateToPage(index),
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
              SizedBox(
                height: 10.h,
              ),
              Text(
                "${widget.investModel.street ?? ''} Street",
                style: TextStyle(
                    color:isDarkMode ? Palette.darkWhite : Palette.baseElementDark,
                    fontSize: 24.sp,
                    fontWeight: FontWeight.w700),
              ),
              SizedBox(
                height: 10.h,
              ),
              Text(
               " ${widget.investModel.country ?? ''} , ${widget.investModel.zipCode}",
                style: TextStyle(
                  color:isDarkMode ? Palette.hintText : Palette.baseGrey,
                  fontSize: 18.sp,
                  fontWeight: FontWeight.w400,
                ),
              ),
              SizedBox(
                height: 10.h,
              ),
              Row(
                children: [
                  Text("\$${widget.investModel.investPerMonth}/month",style: TextStyle(
                    color:isDarkMode ? Palette.darkWhite : Palette.baseElementDark,
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w400,
                  ),),
                  SizedBox(width: 10.w,),
                  Container(
                    height: 6.h,
                    width: 6.w,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Color(0xff87D5FF),
                    ),
                  ),
                  Padding(
                    padding:  EdgeInsets.only(left: 5.w),
                    child: Text("${widget.investModel.bundle} Bundle",style: TextStyle(
                      color:isDarkMode ? Palette.hintText : Palette.baseGrey,
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w400,
                    ),),
                  ),
                  SizedBox(width: 10.w,),
                  Container(
                    height: 6.h,
                    width: 6.w,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Color(0xff87D5FF),
                    ),
                  ),
                  Padding(
                    padding:  EdgeInsets.only(left: 5.w),
                    child: Text("${widget.investModel.unit} units",style: TextStyle(
                      color:isDarkMode ? Palette.hintText : Palette.baseGrey,
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w400,
                    ),),
                  ),
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
              Text(
                "Ground up development project",
                style: TextStyle(
                  color:isDarkMode ? Palette.darkWhite : Palette.baseElementDark,
                  fontWeight: FontWeight.w700,
                  fontSize: 16.sp,
                ),
              ),
              SizedBox(
                height: 10.h,
              ),
              Text(
                "Single-family, 12 units. Rental development.\nUp and coming neighborhood",
                style: TextStyle(
                  color:isDarkMode ? Palette.hintText : Palette.baseElementDark,
                  fontWeight: FontWeight.w400,
                  fontSize: 16.sp,
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
              Padding(
                padding: EdgeInsets.only(left: 12.w,right: 10.w),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Total Investment value",
                      style: TextStyle(
                        color:isDarkMode ? Palette.darkWhite : Palette.baseElementDark,
                        fontWeight: FontWeight.w400,
                        fontSize: 18.sp,
                      ),
                    ),
                    Text(
                      "90,000 USD",
                      style: TextStyle(
                        color: Palette.blue,
                        fontWeight: FontWeight.w700,
                        fontSize: 24.sp,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 5.h,
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
                              "\$65,000",
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
                              "\$25,000",
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
                              "Return on investment annualy",
                              style: TextStyle(
                                color:isDarkMode ? Palette.darkWhite : Palette.baseElementDark,
                                fontSize: 16.sp,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                            Text(
                              "12.3%",
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
                            "Investment growth",
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
              Padding(
                padding: EdgeInsets.only(left: 12.w),
                child: Text(
                  "Project Metrics",
                  style: TextStyle(
                      color:isDarkMode ? Palette.darkWhite : Palette.baseElementDark,
                      fontSize: 20.sp,
                      fontWeight: FontWeight.w700),
                ),
              ),
              SizedBox(
                height: 10.h,
              ),
              Center(
                child: Container(
                  height: 230.h,
                  width: 380.w,
                  decoration: BoxDecoration(
                    color:isDarkMode ? Palette.container: Palette.lightBlue,
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
                            Row(
                              children: [
                                Text(
                                  "After development ARC",
                                  style: TextStyle(
                                    color:isDarkMode ? Palette.darkWhite : Palette.baseElementDark,
                                    fontSize: 16.sp,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                                SizedBox(width: 8.w), // Adjust the spacing between the text and the SVG picture
                                SvgPicture.asset("assets/icons/arc.svg"),
                              ],
                            ),
                            Text(
                              "\$${widget.investModel.afterDevelopmentArc}",
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
                              "After development cap rate",
                              style: TextStyle(
                                color:isDarkMode ? Palette.darkWhite : Palette.baseElementDark,
                                fontSize: 16.sp,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                            Text(
                              "${widget.investModel.afterDevelopmentCapRate}%",
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
                              "After development value",
                              style: TextStyle(
                                color:isDarkMode ? Palette.darkWhite : Palette.baseElementDark,
                                fontSize: 16.sp,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                            Text(
                              "${widget.investModel.afterDevelopmentValue}",
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
                              "Estimated disposition date",
                              style: TextStyle(
                                color:isDarkMode ? Palette.darkWhite : Palette.baseElementDark,
                                fontSize: 16.sp,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                            Text(
                              "${widget.investModel.dispositionDate} ",
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
              Padding(
                padding: EdgeInsets.only(left: 12.w),
                child: Text(
                  "March Dividends",
                  style: TextStyle(
                      color:isDarkMode ? Palette.darkWhite : Palette.baseElementDark,
                      fontSize: 20.sp,
                      fontWeight: FontWeight.w700),
                ),
              ),
              SizedBox(
                height: 10.h,
              ),
              Center(
                child: Container(
                  height: 230.h,
                  width: 380.w,
                  decoration: BoxDecoration(
                    color:isDarkMode ? Palette.container : Palette.lightBlue,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child:  Padding(
                    padding:  EdgeInsets.all(10.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("Annual rental collection",style: TextStyle(
                              color:isDarkMode ? Palette.darkWhite : Palette.baseElementDark,
                              fontSize: 16.sp,
                              fontWeight: FontWeight.w400,
                            ),),
                            Text("\$${widget.investModel.annualRentalCollection}",style: TextStyle(
                              color: Palette.blue,
                              fontSize: 16.sp,
                              fontWeight: FontWeight.w700,
                            ),),
                          ],
                        ),

                        Divider(
                          color:isDarkMode? Color(0xff404550): Color(0xffAFE0FF),
                          thickness: 1,
                        ),

                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("Development cap rate",style: TextStyle(
                              color:isDarkMode ? Palette.darkWhite : Palette.baseElementDark,
                              fontSize: 16.sp,
                              fontWeight: FontWeight.w400,
                            ),),
                            Text("${widget.investModel.developmentCapRate}%",style: TextStyle(
                              color: Palette.blue,
                              fontSize: 16.sp,
                              fontWeight: FontWeight.w700,
                            ),),
                          ],
                        ),

                        Divider(
                          color:isDarkMode? Color(0xff404550): Color(0xffAFE0FF),
                          thickness: 1,
                        ),

                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("After development value",style: TextStyle(
                              color:isDarkMode ? Palette.darkWhite : Palette.baseElementDark,
                              fontSize: 16.sp,
                              fontWeight: FontWeight.w400,
                            ),),
                            Text("\$${widget.investModel.afterDevelopmentValue}",style: TextStyle(
                              color: Palette.blue,
                              fontSize: 16.sp,
                              fontWeight: FontWeight.w700,
                            ),),
                          ],
                        ),

                        Divider(
                          color:isDarkMode? Color(0xff404550): Color(0xffAFE0FF),
                          thickness: 1,
                        ),

                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("Disposition date",style: TextStyle(
                              color:isDarkMode ? Palette.darkWhite : Palette.baseElementDark,
                              fontSize: 16.sp,
                              fontWeight: FontWeight.w400,
                            ),),
                            Text(widget.investModel.dispositionDate,style: TextStyle(
                              color: Palette.blue,
                              fontSize: 16.sp,
                              fontWeight: FontWeight.w700,
                            ),),
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
              Padding(
                padding: EdgeInsets.only(left: 12.w),
                child: Text(
                  "About Shares",
                  style: TextStyle(
                      color:isDarkMode ? Palette.darkWhite : Palette.baseElementDark,
                      fontSize: 20.sp,
                      fontWeight: FontWeight.w700),
                ),
              ),
              SizedBox(
                height: 10.h,
              ),
              Center(
                child: Container(
                  height: 170.h,
                  width: 380.w,
                  decoration: BoxDecoration(
                    color:isDarkMode ? Palette.container : Palette.lightBlue,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child:  Padding(
                    padding:  EdgeInsets.all(10.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("Per share",style: TextStyle(
                              color:isDarkMode ? Palette.darkWhite : Palette.baseElementDark,
                              fontSize: 16.sp,
                              fontWeight: FontWeight.w400,
                            ),),
                            Text("\$0.05",style: TextStyle(
                              color: Palette.blue,
                              fontSize: 16.sp,
                              fontWeight: FontWeight.w700,
                            ),),
                          ],
                        ),

                        Divider(
                          color:isDarkMode? Color(0xff404550): Color(0xffAFE0FF),
                          thickness: 1,
                        ),

                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("Share left",style: TextStyle(
                              color:isDarkMode ? Palette.darkWhite : Palette.baseElementDark,
                              fontSize: 16.sp,
                              fontWeight: FontWeight.w400,
                            ),),
                            Text("41,849",style: TextStyle(
                              color: Palette.blue,
                              fontSize: 16.sp,
                              fontWeight: FontWeight.w700,
                            ),),
                          ],
                        ),

                        Divider(
                          color:isDarkMode? Color(0xff404550): Color(0xffAFE0FF),
                          thickness: 1,
                        ),

                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("Average purchase",style: TextStyle(
                              color:isDarkMode ? Palette.darkWhite : Palette.baseElementDark,
                              fontSize: 16.sp,
                              fontWeight: FontWeight.w400,
                            ),),
                            Text("7 Share",style: TextStyle(
                              color: Palette.blue,
                              fontSize: 16.sp,
                              fontWeight: FontWeight.w700,
                            ),),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 40.h,
              ),
            ],
          ),
        ),
      )),
    );
  }
}
