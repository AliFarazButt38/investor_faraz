import 'package:carousel_slider/carousel_slider.dart';
import 'package:chewie/chewie.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:investor_flutter/View/Screen/home_screens/explore_investmentScreen.dart';
import 'package:provider/provider.dart';
import 'package:video_player/video_player.dart';
import 'package:visibility_detector/visibility_detector.dart';

import '../../../Theme/Palette/palette.dart';
import '../../../Theme/theme_manager.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
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
    currentOfferColor = Palette.blue;
    futureOfferColor = Colors.white;
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
      print('dispose');
      controller.dispose();
    }
    super.dispose();
  }

  int currentIndex = 0;
  int totalContainerItems = 3;
  Color currentOfferColor = Palette.baseWhite;
  Color futureOfferColor = Palette.baseWhite;


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
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(height: 20.h,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Explore Funds",
                      style: TextStyle(
                          color:isDarkMode? Palette.darkWhite: Palette.baseElementDark,
                          fontSize: 28.sp,
                          fontWeight: FontWeight.w700),
                    ),
                    isDarkMode ? SvgPicture.asset(
                      "assets/icons/darkSearch.svg",
                      height: 46.h,
                      width: 46.w,
                    ):
                    SvgPicture.asset(
                      "assets/icons/search.svg",
                      height: 46.h,
                      width: 46.w,
                    ),
                  ],
                ),
                Divider(
                  color:isDarkMode? Color(0xff404550): Color(0xffDEDEDE),
                  thickness: 1,
                ),

                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          currentOfferColor = Palette.blue;
                          futureOfferColor = Colors.white;
                        });
                      },
                      child: Container(
                        width: 180.w,
                        height: 44.h,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20.0),
                          color: isDarkMode ? Palette.blue : currentOfferColor,
                          border: Border.all(
                            color: Palette.blue,
                          ),
                        ),
                        alignment: Alignment.center,
                        child: Text(
                          'Current Offer',
                          style: TextStyle(
                            color: isDarkMode
                                ? Palette.baseWhite
                                : currentOfferColor == Palette.baseWhite
                                ? Palette.blue
                                : Palette.baseWhite,
                            fontSize: 18.sp,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          currentOfferColor = Colors.white;
                          futureOfferColor = Palette.blue;
                        });
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => ExploreInvestmentScreen()),
                        );
                      },
                      child: Container(
                        width: 180.w,
                        height: 44.h,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20.0),
                          color: isDarkMode ? Colors.black : futureOfferColor,
                          border: Border.all(
                            color: Palette.blue,
                          ),
                        ),
                        alignment: Alignment.center,
                        child: Text(
                          'Future Offer',
                          style: TextStyle(
                            color: isDarkMode
                                ? Palette.baseWhite
                                : futureOfferColor == Palette.baseWhite
                                ? Palette.blue
                                : Palette.baseWhite,
                            fontSize: 18.sp,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),



                SizedBox(height: 10.h,),

                CarouselSlider(

                    items: [
                      Container(
                        width: 380.w,
                        height: 260.h,
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
                              EdgeInsets.only(left: 15.w, right: 10.w, top: 10.h),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Image.asset("assets/icons/blocks.png"),
                                  Container(
                                    width: 156.w,
                                    height: 30.h,
                                    decoration: BoxDecoration(
                                      color: isDarkMode ? Color(0xffEBF8FF ):Palette.blue100,
                                      borderRadius: BorderRadius.circular(10.0),
                                    ),
                                    alignment: Alignment.center,
                                    child: Text(
                                      "Return Target: 10-17% ",
                                      style: TextStyle(
                                        color: Color(0xff286CA8),
                                        fontWeight: FontWeight.w400,
                                        fontSize: 14.sp,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 10.h,
                              ),
                              Text(
                                "BlackHole Investment's",
                                style: TextStyle(
                                  color: Color(0xff25E3EF),
                                  fontSize: 20.sp,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                              SizedBox(
                                height: 10.h,
                              ),
                              Text(
                                "RE Development Fund I",
                                style: TextStyle(
                                  color: Palette.baseWhite,
                                  fontSize: 16.sp,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                              SizedBox(
                                height: 10.h,
                              ),
                              Row(
                                children: [
                                  Container(
                                    width: 105.w,
                                    height: 28.h,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(10.0),
                                        border: Border.all(
                                          color: Palette.baseWhite,
                                        )),
                                    alignment: Alignment.center,
                                    child: Text(
                                      "Private Property",
                                      style: TextStyle(
                                        color: Palette.baseWhite,
                                        fontWeight: FontWeight.w400,
                                        fontSize: 12.sp,
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(left: 5.w),
                                    child: Container(
                                      width: 76.w,
                                      height: 28.h,
                                      decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(10.0),
                                          border: Border.all(
                                            color: Palette.baseWhite,
                                          )),
                                      alignment: Alignment.center,
                                      child: Text(
                                        "Urban Infill",
                                        style: TextStyle(
                                          color: Palette.baseWhite,
                                          fontWeight: FontWeight.w400,
                                          fontSize: 12.sp,
                                        ),
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(left: 5.w),
                                    child: Container(
                                      width: 28.w,
                                      height: 28.h,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(12.0),
                                        color: Palette.baseWhite,
                                      ),
                                      alignment: Alignment.center,
                                      child: Text(
                                        "+5",
                                        style: TextStyle(
                                          color: Palette.baseElementDark,
                                          fontWeight: FontWeight.w700,
                                          fontSize: 12.sp,
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 30.h,
                              ),
                              Center(
                                child: SizedBox(
                                  width: 336.w,
                                  height: 45.h,
                                  child: ElevatedButton(
                                    onPressed: () {
                                      // Handle sign in button press here
                                    },
                                    child: Text(
                                      "Learn More...",
                                      style: TextStyle(
                                          color: Color(0xff1D529B),
                                          fontSize: 16.sp,
                                          fontWeight: FontWeight.w700),
                                    ),
                                    style: ElevatedButton.styleFrom(
                                      primary: Color(0xffF8F8F8),
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(20.0),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),

                    ],
                    options:CarouselOptions(
                      scrollPhysics: BouncingScrollPhysics(),
                      aspectRatio: 16 / 9,
                      viewportFraction: 1,
                      onPageChanged: (index, reason) {
                        setState(() {

                        });
                      },
                    ),
                ),


                SizedBox(
                  height: 20.h,
                ),
                Container(
                  height: 527.h,
                  width: 380.w,
                  decoration: BoxDecoration(
                    color:isDarkMode ? Palette.container : Palette.lightBlue,
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  child: Padding(
                    padding:
                        EdgeInsets.only(left: 15.w, right: 15.w, top: 15.h),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "How it works?",
                          style: TextStyle(
                            color:isDarkMode? Palette.darkWhite : Palette.baseElementDark,
                            fontSize: 20.sp,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        SizedBox(
                          height: 20.h,
                        ),
                        VisibilityDetector(
                          key: Key('someUniqueString'),
                          onVisibilityChanged: (VisibilityInfo info) {
                            if (info.visibleFraction == 0 && mounted) {
                              //checks if the player is visible and it hasn't been disposed as yet(mounted) and
                              //pause the chewie player, you could dispose here too');
                              for (var controller in chewieControllers) {
                                print('dispose');
                                controller.pause();
                              }

                            }
                          },
                          child: SizedBox(
                            height: 180.h,
                            width: 344.w,
                            child:    CarouselSlider(
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
                        ),
                        SizedBox(height: 20,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: chewieControllers.asMap().entries.map((entry) {
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
                                  color: currentIndex2 == index ? Palette.blue :Palette.blue100,
                                ),
                              ),
                            );
                          }).toList(),
                        ),
                        SizedBox(
                          height: 20.h,
                        ),
                        Text(
                          "Lorem Ipsum is simply dummy text of the printing and typesetting industry. "
                          "Lorem Ipsum has been the industry's standard dummy text ever since the 1500s,"
                          " when an unknown printer took a galley of type and scrambled it to make a type specimen"
                          " book.",
                          style: TextStyle(
                            color:isDarkMode? Palette.hintText : Palette.baseGrey,
                            fontSize: 18.sp,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 10.h,),
                Container(
                  height: 327.h,
                  width: 380.w,
                  decoration: BoxDecoration(
                    color:isDarkMode ? Palette.container : Palette.lightBlue,
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  child: Padding(
                    padding:
                        EdgeInsets.only(left: 15.w, right: 15.w, top: 15.h),
                    child: Column(

                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Why Us Propertize?",
                          style: TextStyle(
                            color:isDarkMode? Palette.darkWhite : Palette.baseElementDark,
                            fontSize: 20.sp,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        Text(
                          "Here you get some glimpse what our clients say about us.",
                          style: TextStyle(
                            color:isDarkMode? Palette.hintText : Palette.baseGrey,
                            fontSize: 18.sp,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.all(8.0),
                          child: CarouselSlider(
                            options: CarouselOptions(
                              height: 150.h,
                              scrollPhysics: BouncingScrollPhysics(),
                              autoPlay: false,
                              enlargeCenterPage: true,
                              enableInfiniteScroll: true,
                              onPageChanged: (index, reason) {
                                setState(() {
                                  currentIndex = index;
                                });
                              },
                            ),
                            items: [
                              Container(
                                width: 311.w,
                                decoration: BoxDecoration(
                                  color:isDarkMode? Palette.darkBackground: Palette.baseWhite,
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Column(
                                    children: [
                                      Row(
                                        children: [
                                          Padding(
                                            padding:
                                                EdgeInsets.only(right: 10.w),
                                            child: Image.asset(
                                              "assets/icons/newProfile.png",
                                              filterQuality: FilterQuality.high,
                                            ),
                                          ),
                                          Column(
                                            children: [
                                              Text(
                                                "Smith owent",
                                                style: TextStyle(
                                                  color:
                                                    isDarkMode ? Palette.darkWhite:  Palette.baseElementDark,
                                                  fontWeight: FontWeight.w700,
                                                  fontSize: 15.sp,
                                                ),
                                              ),
                                              SvgPicture.asset(
                                                  "assets/icons/stars.svg"),
                                            ],
                                          ),
                                        ],
                                      ),
                                      SizedBox(height: 10.h),
                                      Text(
                                        "Great Platform for Invest and Save Your Future by Becoming a Pro Investor.",
                                        style: TextStyle(
                                          color:isDarkMode ? Palette.darkWhite : Palette.baseElementDark,
                                          fontWeight: FontWeight.w400,
                                          fontSize: 14.sp,
                                        ),
                                        maxLines: 2,
                                        overflow:  TextOverflow.ellipsis,
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: List.generate(totalContainerItems, (index) {
                            return Container(
                              width: 8.0,
                              height: 8.0,
                              margin: EdgeInsets.symmetric(
                                  vertical: 10.0, horizontal: 4.0),
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: currentIndex == index
                                    ? Palette.blue
                                    : Color(0xffC3EBFF),
                              ),
                            );
                          }),
                        ),
                      ],
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
