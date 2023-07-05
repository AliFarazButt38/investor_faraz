import 'package:carousel_slider/carousel_slider.dart';
import 'package:chewie/chewie.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:investor_flutter/View/Screen/home_screens/explore_investmentScreen.dart';
import 'package:video_player/video_player.dart';

import '../../../Theme/Palette/palette.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late VideoPlayerController _videoPlayerController;
 late ChewieController _chewieController;

  @override
  void initState() {
    super.initState();
    currentOfferColor = Palette.blue;
    futureOfferColor = Colors.white;
    _videoPlayerController = VideoPlayerController.network('https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/BigBuckBunny.mp4');
    _chewieController = ChewieController(
      videoPlayerController: _videoPlayerController,
      autoPlay: true,
      looping: true,
    );
  }
  @override
  void dispose() {
    _videoPlayerController.dispose();
    _chewieController.dispose();
    super.dispose();
  }



  int currentIndex = 0;
  int totalContainerItems = 3;
  Color currentOfferColor = Colors.white;
  Color futureOfferColor = Colors.white;

  void _handleCurrentOfferTap() {
    setState(() {
      currentOfferColor = Palette.blue;
      futureOfferColor = Colors.white;
    });
  }

  void _handleFutureOfferTap() {
    setState(() {
      currentOfferColor = Colors.white;
      futureOfferColor = Palette.blue;
    });
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) =>ExploreInvestmentScreen()),
    );
  }



  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context, designSize: const Size(428, 926));
    return Scaffold(
      backgroundColor: Palette.baseBackground,
    body: SafeArea(
      child: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.only(left: 10.w,right: 10.w),
          child: Column(
            children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Explore Funds",style: TextStyle(color: Palette.baseElementDark,fontSize: 28.sp,fontWeight: FontWeight.w700),)
                  ,SvgPicture.asset("assets/icons/search.svg",height: 46.h,width: 46.w,),
                  ],
                ),
              SizedBox(height: 10.h,),
              Divider(
                color: Color(0xffDEDEDE),
                thickness: 1,
              ),
              SizedBox(height: 10.h,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                GestureDetector(
                  onTap: _handleCurrentOfferTap,
                  child: Container(
                    width: 180.w,
                    height: 44.h,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15.0),
                      color: currentOfferColor,
                      border: Border.all(
                        color: Palette.blue,
                      ),
                    ),

                    alignment: Alignment.center,
                    child: Text(
                      'Current Offer',
                      style: TextStyle(
                        color: currentOfferColor == Colors.white
                            ? Colors.blue
                            : Colors.white,
                        fontSize: 18.sp,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: _handleFutureOfferTap,
                  child: Container(
                    width: 180.w,
                    height: 44.h,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15.0),
                      color: futureOfferColor,
                      border: Border.all(
                        color: Palette.blue,
                      ),
                    ),
                    alignment: Alignment.center,
                    child: Text(
                      'Future Offer',
                      style: TextStyle(
                        color: futureOfferColor == Colors.white
                            ? Colors.blue
                            : Colors.white,
                        fontSize: 18.sp,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                ),
              ],
            ),
              SizedBox(height: 10.h,),
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
                  padding:  EdgeInsets.only(left: 15.w,right: 10.w,top: 10.h),
                  child: Column(

                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Image.asset("assets/icons/img_1.png"),
                        Container(
                          width: 156.w,
                          height: 30.h,
                          decoration: BoxDecoration(
                            color:Palette.blue100,
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
                      SizedBox(height: 10.h,),
                      Text("BlackHole Investment's",style:TextStyle(
                        color: Color(0xff25E3EF),
                        fontSize: 20.sp,
                        fontWeight: FontWeight.w400,
                      ),),
                      SizedBox(height: 10.h,),
                      Text("RE Development Fund I",style:TextStyle(
                        color:Palette.baseWhite,
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w400,
                      ),),
                      SizedBox(height: 10.h,),
                      Row(
                        children: [
                          Container(
                            width: 105.w,
                            height: 28.h,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10.0),
                              border: Border.all(
                                color: Palette.baseWhite,
                              )
                            ),
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
                            padding:  EdgeInsets.only(left: 5.w),
                            child: Container(
                              width: 76.w,
                              height: 28.h,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10.0),
                                  border: Border.all(
                                    color: Palette.baseWhite,
                                  )
                              ),
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
                            padding:  EdgeInsets.only(left: 5.w),
                            child: Container(
                              width: 28.w,
                              height: 28.h,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(12.0),
                                color: Palette.baseWhite,
                              ),
                              alignment: Alignment.center,
                              child: Text("+5",style: TextStyle(
                                color: Palette.baseElementDark,
                                fontWeight: FontWeight.w700,
                                fontSize: 12.sp,
                              ),),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 30.h,),
                      Center(
                        child: SizedBox(
                          width: 336.w,
                          height: 56.h,
                          child: ElevatedButton(
                            onPressed: () {
                              // Handle sign in button press here
                            },
                            child: Text(
                              "Learn More...",
                              style: TextStyle(color: Color(0xff1D529B),
                              fontSize: 16.sp,
                                fontWeight: FontWeight.w700
                              ),
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
              SizedBox(height: 20.h,),
              Container(
                height:527.h,
                width: 380.w,
                decoration: BoxDecoration(
                  color: Palette.lightBlue,
                  borderRadius: BorderRadius.circular(10.0),
                ),
                child: Padding(
                  padding: EdgeInsets.only(left: 15.w,right: 15.w,top: 15.h),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("How it works?",
                      style: TextStyle(
                        color: Palette.baseElementDark,
                        fontSize: 20.sp,
                        fontWeight: FontWeight.w700,
                      ),
                      ),
                      SizedBox(height: 20.h,),
                      AspectRatio(
                        aspectRatio: _videoPlayerController.value.aspectRatio,
                        child: Chewie(controller: _chewieController),
                      ),
                      SizedBox(height:20.h,),
                      Text("Lorem Ipsum is simply dummy text of the printing and typesetting industry. "
                          "Lorem Ipsum has been the industry's standard dummy text ever since the 1500s,"
                          " when an unknown printer took a galley of type and scrambled it to make a type specimen"
                          " book.",style: TextStyle(
                        color: Palette.baseGrey,
                        fontSize: 18.sp,
                        fontWeight: FontWeight.w400,
                      ),

                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 20.h,),
              Container(
                height:327.h,
                width: 380.w,
                decoration: BoxDecoration(
                  color: Palette.lightBlue,
                  borderRadius: BorderRadius.circular(10.0),
                ),
                child: Padding(
                  padding: EdgeInsets.only(left: 15.w,right: 15.w,top: 15.h),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Why Us Propertize?",
                        style: TextStyle(
                          color: Palette.baseElementDark,
                          fontSize: 20.sp,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      SizedBox(height: 10.h,),
                      Text("Here you get some glimpse what our clients say about us.",
                        style: TextStyle(
                          color: Palette.baseGrey,
                          fontSize: 18.sp,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      SizedBox(height: 15.h,),
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
                                color: Palette.baseWhite,
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Column(
                                  children: [
                                    Row(
                                      children: [
                                        Padding(
                                          padding: EdgeInsets.only(right: 10.w),
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
                                                color: Palette.baseElementDark,
                                                fontWeight: FontWeight.w700,
                                                fontSize: 15.sp,
                                              ),
                                            ),
                                            SvgPicture.asset("assets/icons/stars.svg"),
                                          ],
                                        ),
                                      ],
                                    ),
                                    SizedBox(height: 20.h),
                                    Text(
                                      "Great Platform for Invest and Save Your Future by Becoming a Pro Investor.",
                                      style: TextStyle(
                                        color: Palette.baseElementDark,
                                        fontWeight: FontWeight.w400,
                                        fontSize: 14.sp,
                                      ),
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
                            margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 4.0),
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: currentIndex == index ? Palette.blue : Color(0xffC3EBFF),
                            ),
                          );
                        }),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 20.h,),

            ],
          ),
        ),
      ),
    ),
    );
  }
}
