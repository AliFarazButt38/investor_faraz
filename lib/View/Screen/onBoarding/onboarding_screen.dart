import 'package:carousel_slider/carousel_controller.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:investor_flutter/Theme/Palette/palette.dart';
import 'package:investor_flutter/View/Screen/emailAndPhone/email_address_screen.dart';
import 'package:investor_flutter/View/Screen/emailAndPhone/login_accountScreen.dart';

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({Key? key}) : super(key: key);

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  List<Map<String, dynamic>> imageList = [
    {"id": 1, "image_path": "assets/images/Frame.svg", "text": "Invest like an\nexpert", "text2":"Smart, low-fee investing that automatically grows your money like the pro investors"},
    {"id": 2, "image_path": "assets/images/Group 4.svg", "text": "Save for your \nfuture" , "text2":"Invest and grow your money for the long term"},
    {"id": 3, "image_path": "assets/images/Travel_agent_2_.svg", "text": "Smartest thing to\ndo with money", "text2":"We'll build you an intelligent,personalized portfolio using diversified, low-cost ETFs."},
  ];

  final CarouselController carouselController = CarouselController();
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context, designSize: const Size(428, 926));
    return Scaffold(
      backgroundColor: Palette.baseBackground,
      body: SafeArea(
        child: Padding(
          padding:  EdgeInsets.only(left: 15.w,right: 15.w),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                imageList[currentIndex]["text"],
                style: TextStyle(
                  fontSize: 40.sp,
                  fontWeight: FontWeight.w700,
                  color: Palette.baseElementDark,
                ),
              ),

              Text(
                imageList[currentIndex]["text2"],
                style: TextStyle(
                  fontSize: 18.sp,
                  fontWeight: FontWeight.w400,
                  color: Palette.baseGrey,
                ),
              ),

              CarouselSlider(
                items: imageList.map((item) {
                  return Builder(
                    builder: (BuildContext context) {
                      return SvgPicture.asset(
                        item["image_path"],
                        semanticsLabel: "ACME logo",
                        height:299.h ,
                        width: 300.w,
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

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: imageList.asMap().entries.map((entry) {
                  return GestureDetector(
                    onTap: () => carouselController.animateToPage(entry.key),
                    child: Container(
                      width: currentIndex == entry.key ? 7 : 7,
                      height: 7,
                      margin: EdgeInsets.symmetric(horizontal: 3.0),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: currentIndex == entry.key
                            ? Palette.blue
                            : Palette.blue100,
                      ),
                    ),
                  );
                }).toList(),
              ),

              Center(
                child: Container(
                  height: 56.h,
                  width: 304.w,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Palette.blue,
                  ),
                  child: Center(
                    child: Text("Become an Investor",style: TextStyle(
                      color: Palette.baseWhite,
                      fontWeight: FontWeight.w700,
                      fontSize: 18.sp,
                    ),),
                  ),
                ),
              ),

              Center(
                child: GestureDetector(
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>EmailAddressScreen()));
                  },
                  child: Text("Sign In",style: TextStyle(
                    color: Palette.blue,
                    fontWeight: FontWeight.w700,
                    fontSize: 18.sp,
                  ),),
                ),
              ),
              SizedBox(height: 30.h,),
                ],
          ),
        ),
      ),
    );
  }
}
