import 'package:carousel_slider/carousel_controller.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:chewie/chewie.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:investor_flutter/Model/property_model.dart';
import 'package:investor_flutter/View/Screen/home_screens/investmentInfo_screen.dart';
import 'package:investor_flutter/View/Screen/invest_ContributionScreen/investContribution_screen1.dart';
import 'package:provider/provider.dart';
import 'package:video_player/video_player.dart';

import '../../../Provider/propertyProvider.dart';
import '../../../Theme/Palette/palette.dart';
import '../../../Theme/theme_manager.dart';

class ContainerData {
  final String image;
  final String desc;
  final String text;

  ContainerData({required this.image, required this.desc, required this.text});
}

List<ContainerData> containerDataList = [
  ContainerData(
    image: 'assets/icons/cash.png',
    text: "Cash & financing",
    desc: "Offering . Property Activity . Financing",
  ),
  ContainerData(
    image: 'assets/icons/homedetails.png',
    text: "Property details",
    desc: "Description . Lease details",
  ),
  ContainerData(
    image: 'assets/icons/paper.png',
    text: "Documents",
    desc: "Disclosure and circular • Operating\nagreements",
  ),
];

class PropertyInfoScreen extends StatefulWidget {
  PropertyModel propertyModel;
   PropertyInfoScreen({Key? key,required this.propertyModel}) : super(key: key);

  @override
  State<PropertyInfoScreen> createState() => _PropertyInfoScreenState();
}

class _PropertyInfoScreenState extends State<PropertyInfoScreen> {

  late VideoPlayerController _videoPlayerController;
  late ChewieController _chewieController;
  List<String> videoUrls = [
    'https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/BigBuckBunny.mp4',
    'https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/BigBuckBunny.mp4',
    'https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/BigBuckBunny.mp4',
  ];
  List<ChewieController> chewieControllers = [];
  final CarouselController carouselController2 = CarouselController();
  int currentIndex2 = 0;

  @override
  void initState() {
    super.initState();
    for (var url in videoUrls) {
      chewieControllers.add(
        ChewieController(
          videoPlayerController: VideoPlayerController.network(url),
          autoPlay: false,
          looping: false,
          // Other ChewieController options as needed
        ),
      );
    }
  }

  @override
  void dispose() {
    for (var controller in chewieControllers) {
      controller.dispose();
    }
    super.dispose();
  }

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
    // final List<String>? imageUrls = widget.propertyModel.sliderImage;

    ScreenUtil.init(context, designSize: const Size(428, 926));
    return Scaffold(
      backgroundColor:
          isDarkMode ? Palette.darkBackground : Palette.baseBackground,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.only(left: 15.w, right: 15.w),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 20.h,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
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
                      "Property Info",
                      style: TextStyle(
                          color: isDarkMode
                              ? Palette.darkWhite
                              : Palette.baseElementDark,
                          fontSize: 28.sp,
                          fontWeight: FontWeight.w700),
                    ),
                    Spacer(),
                    isDarkMode
                        ? Image.asset(
                            "assets/icons/darkupload.png",
                            height: 46.h,
                            width: 46.w,
                          )
                        : Image.asset(
                            "assets/icons/upload.png",
                            height: 46.h,
                            width: 46.w,
                          ),
                  ],
                ),
                SizedBox(
                  height: 10.h,
                ),
                Divider(
                  color: isDarkMode ? Color(0xff404550) : Color(0xffDEDEDE),
                  thickness: 1,
                ),
                SizedBox(
                  height: 15.h,
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
                      bottom:
                          10, // Adjust the bottom value to position the dots
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
                // Stack(
                //   children: [
                //     CarouselSlider(
                //       items: (widget.propertyModel.sliderImage ?? []).map((imageUrl) {
                //         return Builder(
                //           builder: (BuildContext context) {
                //             return ClipRRect(
                //               borderRadius: BorderRadius.circular(10),
                //               child: Image.network(
                //                 imageUrl,
                //                 fit: BoxFit.cover,
                //                 width: double.infinity,
                //               ),
                //             );
                //           },
                //         );
                //       }).toList(),
                //       carouselController: carouselController,
                //       options: CarouselOptions(
                //         scrollPhysics: BouncingScrollPhysics(),
                //         autoPlay: false,
                //         aspectRatio: 2,
                //         viewportFraction: 1,
                //         onPageChanged: (index, reason) {
                //           setState(() {
                //             currentIndex = index;
                //           });
                //         },
                //       ),
                //     ),
                //     Positioned(
                //       bottom: 10, // Adjust the bottom value to position the dots
                //       left: 0,
                //       right: 0,
                //       child: Row(
                //         mainAxisAlignment: MainAxisAlignment.center,
                //         children: (widget.propertyModel.sliderImage ?? []).asMap().entries.map((entry) {
                //           int index = entry.key;
                //           return GestureDetector(
                //             onTap: () => carouselController.animateToPage(index),
                //             child: Container(
                //               width: 7,
                //               height: 7,
                //               margin: EdgeInsets.symmetric(horizontal: 3.0),
                //               decoration: BoxDecoration(
                //                 borderRadius: BorderRadius.circular(10),
                //                 color: currentIndex == index
                //                     ? Palette.blue
                //                     : Palette.baseWhite,
                //               ),
                //             ),
                //           );
                //         }).toList(),
                //       ),
                //     ),
                //   ],
                // ),

                SizedBox(
                  height: 10.h,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Image.asset(
                      "assets/icons/rise.png",
                      height: 16.h,
                      width: 16.w,
                    ),
                    Text(
                      "48% Sold",
                      style: TextStyle(
                        color: Color(0xff00B071),
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    Spacer(),
                    Container(
                      height: 34.h,
                      width: 100.w,
                      decoration: BoxDecoration(
                        color:
                            isDarkMode ? Palette.container : Palette.lightBlue,
                        borderRadius: BorderRadius.circular(15),
                      ),
                      alignment: Alignment.center,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SvgPicture.asset(
                            "assets/icons/public_lock.svg",
                            height: 16.h,
                            width: 16.w,
                          ),
                          Text(
                            "Private",
                            style: TextStyle(
                              color: Palette.blue,
                              fontWeight: FontWeight.w400,
                              fontSize: 16.sp,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 10.h,
                ),
                Text(
                 "${widget.propertyModel.street} Street",
                  style: TextStyle(
                      color: isDarkMode
                          ? Palette.darkWhite
                          : Palette.baseElementDark,
                      fontSize: 24.sp,
                      fontWeight: FontWeight.w700),
                ),
                SizedBox(
                  height: 10.h,
                ),
                Text(
                  "${widget.propertyModel.city} , ${widget.propertyModel.zipCode}",
                  style: TextStyle(
                    color: isDarkMode ? Palette.hintText : Palette.baseGrey,
                    fontSize: 18.sp,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                SizedBox(
                  height: 15.h,
                ),
                Row(
                  children: [
                    Text(
                      "\$${widget.propertyModel.investPerMonth}/month",
                      style: TextStyle(
                        color: isDarkMode
                            ? Palette.darkWhite
                            : Palette.baseElementDark,
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w400,
                      ),
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
                       "${widget.propertyModel.bundle} bundle",
                        style: TextStyle(
                          color:
                              isDarkMode ? Palette.hintText : Palette.baseGrey,
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
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
                     "${widget.propertyModel.unite} Units",
                        style: TextStyle(
                          color:
                              isDarkMode ? Palette.hintText : Palette.baseGrey,
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                  ],
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
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Investment Price",
                      style: TextStyle(
                        color: isDarkMode
                            ? Palette.darkWhite
                            : Palette.baseElementDark,
                        fontWeight: FontWeight.w400,
                        fontSize: 18.sp,
                      ),
                    ),
                    Column(
                      children: [
                        Text(
                          "Know More",
                          style: TextStyle(
                            color: Palette.blue,
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        Container(
                          height: 1.h,
                          width: 70.w,
                          color: Palette.blue,
                        ),
                      ],
                    ),
                  ],
                ),
                SizedBox(
                  height: 10.h,
                ),
                Text(
                  "${widget.propertyModel.investPrice} USD",
                  style: TextStyle(
                    color: Palette.blue,
                    fontWeight: FontWeight.w700,
                    fontSize: 24.sp,
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
                  height: 10.h,
                ),
                Padding(
                  padding: EdgeInsets.only(left: 12.w),
                  child: Text(
                    "March Dividends",
                    style: TextStyle(
                        color: isDarkMode
                            ? Palette.darkWhite
                            : Palette.baseElementDark,
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
                      color: isDarkMode ? Palette.container : Palette.lightBlue,
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
                                "Annual rental collection",
                                style: TextStyle(
                                  color: isDarkMode
                                      ? Palette.darkWhite
                                      : Palette.baseElementDark,
                                  fontSize: 16.sp,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                              Text(
                                "\$${widget.propertyModel.annualRentalCollection}",
                                style: TextStyle(
                                  color: Palette.blue,
                                  fontSize: 16.sp,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                            ],
                          ),
                          Divider(
                            color: isDarkMode
                                ? Color(0xff404550)
                                : Color(0xffAFE0FF),
                            thickness: 1,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "Development cap rate",
                                style: TextStyle(
                                  color: isDarkMode
                                      ? Palette.darkWhite
                                      : Palette.baseElementDark,
                                  fontSize: 16.sp,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                              Text(
                                "${widget.propertyModel.developmentCapRate}%",

                                style: TextStyle(
                                  color: Palette.blue,
                                  fontSize: 16.sp,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                            ],
                          ),
                          Divider(
                            color: isDarkMode
                                ? Color(0xff404550)
                                : Color(0xffAFE0FF),
                            thickness: 1,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "After development value",
                                style: TextStyle(
                                  color: isDarkMode
                                      ? Palette.darkWhite
                                      : Palette.baseElementDark,
                                  fontSize: 16.sp,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                              Text(
                                "\$${widget.propertyModel.developmentValue}",
                                style: TextStyle(
                                  color: Palette.blue,
                                  fontSize: 16.sp,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                            ],
                          ),
                          Divider(
                            color: isDarkMode
                                ? Color(0xff404550)
                                : Color(0xffAFE0FF),
                            thickness: 1,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "Disposition date",
                                style: TextStyle(
                                  color: isDarkMode
                                      ? Palette.darkWhite
                                      : Palette.baseElementDark,
                                  fontSize: 16.sp,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                              Text(
                              widget.propertyModel.depositionDate,
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
                Divider(
                  color: isDarkMode ? Color(0xff404550) : Color(0xffDEDEDE),
                  thickness: 1,
                ),
                SizedBox(
                  height: 10.h,
                ),
                Padding(
                  padding: EdgeInsets.only(left: 12.w),
                  child: Text(
                    "About Shares",
                    style: TextStyle(
                        color: isDarkMode
                            ? Palette.darkWhite
                            : Palette.baseElementDark,
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
                      color: isDarkMode ? Palette.container : Palette.lightBlue,
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
                                "Per share",
                                style: TextStyle(
                                  color: isDarkMode
                                      ? Palette.darkWhite
                                      : Palette.baseElementDark,
                                  fontSize: 16.sp,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                              Text(
                                "\$0.05",
                                style: TextStyle(
                                  color: Palette.blue,
                                  fontSize: 16.sp,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                            ],
                          ),
                          Divider(
                            color: isDarkMode
                                ? Color(0xff404550)
                                : Color(0xffAFE0FF),
                            thickness: 1,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "Share left",
                                style: TextStyle(
                                  color: isDarkMode
                                      ? Palette.darkWhite
                                      : Palette.baseElementDark,
                                  fontSize: 16.sp,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                              Text(
                                "41,849",
                                style: TextStyle(
                                  color: Palette.blue,
                                  fontSize: 16.sp,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                            ],
                          ),
                          Divider(
                            color: isDarkMode
                                ? Color(0xff404550)
                                : Color(0xffAFE0FF),
                            thickness: 1,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "Average purchase",
                                style: TextStyle(
                                  color: isDarkMode
                                      ? Palette.darkWhite
                                      : Palette.baseElementDark,
                                  fontSize: 16.sp,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                              Text(
                                "7 Share",
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
                Divider(
                  color: isDarkMode ? Color(0xff404550) : Color(0xffDEDEDE),
                  thickness: 1,
                ),
                SizedBox(
                  height: 10.h,
                ),
                Padding(
                  padding: EdgeInsets.only(left: 10.w),
                  child: Text(
                    "Project Presentation",
                    style: TextStyle(
                        color: isDarkMode
                            ? Palette.darkWhite
                            : Palette.baseElementDark,
                        fontSize: 20.sp,
                        fontWeight: FontWeight.w700),
                  ),
                ),
                SizedBox(
                  height: 10.h,
                ),
                Center(
                  child: Container(
                    height: 239.h,
                    width: 380.w,
                    decoration: BoxDecoration(
                      color: isDarkMode ? Palette.container : Palette.lightBlue,
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    child: Column(
                      children: [
                        SizedBox(
                          height: 180.h,
                          width: 344.w,
                          child: CarouselSlider(
                            items: chewieControllers.map((chewieController) {
                              return Builder(
                                builder: (BuildContext context) {
                                  return Chewie(controller: chewieController);
                                },
                              );
                            }).toList(),
                            carouselController: carouselController2,
                            options: CarouselOptions(
                              scrollPhysics: BouncingScrollPhysics(),
                              autoPlay: false,
                              aspectRatio: 16 / 9,
                              viewportFraction: 1,
                              onPageChanged: (index, reason) {
                                setState(() {
                                  currentIndex2 = index;
                                });
                              },
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children:
                              chewieControllers.asMap().entries.map((entry) {
                            int index = entry.key;
                            return GestureDetector(
                              onTap: () {
                                carouselController2.animateToPage(index);
                                setState(() {
                                  currentIndex2 = index;
                                });
                              },
                              child: Container(
                                width: 7,
                                height: 7,
                                margin: EdgeInsets.symmetric(horizontal: 3.0),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: currentIndex2 == index
                                      ? Palette.blue
                                      : Palette.blue100,
                                ),
                              ),
                            );
                          }).toList(),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 11.h,
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
                    height: 281.h,
                    width: 380.w,
                    decoration: BoxDecoration(
                      color: isDarkMode ? Palette.container : Palette.lightBlue,
                      borderRadius: BorderRadius.circular(15.0),
                    ),
                    child: ListView.builder(
                      shrinkWrap: true,
                      physics: BouncingScrollPhysics(),
                      scrollDirection: Axis.vertical,
                      itemCount: containerDataList.length,
                      itemBuilder: (BuildContext context, int index) {
                        return Padding(
                          padding: EdgeInsets.only(
                              left: 10.w, right: 10.w, top: 5.h),
                          child: Column(
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Image.asset(
                                    containerDataList[index].image,
                                    height: 50.h,
                                    width: 50.w,
                                  ),
                                  Padding(
                                    padding:
                                        EdgeInsets.only(left: 10.w, top: 10.w),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          containerDataList[index].text,
                                          style: TextStyle(
                                              fontSize: 18.sp,
                                              fontWeight: FontWeight.w700,
                                              color: isDarkMode
                                                  ? Palette.darkWhite
                                                  : Palette.baseElementDark),
                                        ),
                                        SizedBox(
                                          height: 10.h,
                                        ),
                                        Text(
                                          containerDataList[index].desc,
                                          style: TextStyle(
                                              color: isDarkMode
                                                  ? Palette.hintText
                                                  : Palette.baseGrey,
                                              fontSize: 14.sp,
                                              fontWeight: FontWeight.w400),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Spacer(),
                                  Image.asset(
                                    "assets/icons/next.png",
                                    height: 20.h,
                                    width: 20.w,
                                  ),
                                ],
                              ),
                              Divider(
                                color: isDarkMode
                                    ? Color(0xff404550)
                                    : Color(0xffAFE0FF),
                                thickness: 1,
                              ),
                            ],
                          ),
                        );
                      },
                    ),
                  ),
                ),
                SizedBox(
                  height: 20.h,
                ),
                Center(
                  child: SizedBox(
                    width: 348.w,
                    height: 56.h,
                    child: ElevatedButton(
                      onPressed: () {
                        final String investPriceString = widget.propertyModel.investPrice;
                        double investmentAmount = 0.0; // Default value if parsing fails
                        final FirebaseAuth auth = FirebaseAuth.instance;
                        final User? user = auth.currentUser;
                        final String? uid = user?.uid;
                        if (investPriceString != null) {
                          try {
                            investmentAmount = double.parse(investPriceString);
                          } catch (e) {
                            print('Error parsing investPriceString: $e');
                          }
                        }
                        final DateTime investmentDate = DateTime.now(); // Get the investment date

                        // Call the function to store investment data
                        if (uid != null) {
                          PropertyInfoProvider().storeInvestmentData(
                              userUid: uid,
                              propertyModel: widget.propertyModel,
                              // Pass the property details
                              investmentAmount: investmentAmount,
                              investmentDate: investmentDate,
                              investPerMonth: widget.propertyModel
                                  .investPerMonth,
                              bundle: widget.propertyModel.bundle,
                              unit: widget.propertyModel.unite,
                              street: widget.propertyModel.street,
                              zipCode: widget.propertyModel.zipCode,
                              developmentArc: widget.propertyModel
                                  .developmentArc,
                              afterDevelopmentCapRate: widget.propertyModel
                                  .developmentCapRateArc,
                              afterDevelopmentValue: widget.propertyModel
                                  .developmentValue,
                              dispositionDate: widget.propertyModel
                                  .depositionDate,
                              annualRentalCollection: widget.propertyModel
                                  .annualRentalCollection,
                              developmentCapRate: widget.propertyModel
                                  .developmentCapRate,
                              afterDevelopmentValueArc: widget.propertyModel
                                  .developmentValueArc,
                              country: widget.propertyModel.country,
                              investPrice: widget.propertyModel.investPrice
                          );
                        }
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => InvestContributionScreen1()));
                      },
                      child: Text(
                        "Invest Now",
                        style: TextStyle(
                          color: Palette.baseWhite,
                          fontWeight: FontWeight.w700,
                          fontSize: 18.sp,
                        ),
                      ),
                      style: ElevatedButton.styleFrom(
                        primary: Palette.blue,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20.0),
                        ),
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
        ),
      ),
    );
  }
}
