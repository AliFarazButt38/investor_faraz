import 'package:carousel_slider/carousel_controller.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:chewie/chewie.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:video_player/video_player.dart';

import '../../../Theme/Palette/palette.dart';

class ContainerData {
  final String image;
  final String desc;
  final String text;

  ContainerData({required this.image,required this.desc,required this.text});
}
List<ContainerData> containerDataList = [
  ContainerData(
    image:'assets/icons/img.png',
    text: "Cash & financing",
    desc: "Offering . Property Activity . Financing",
  ),
  ContainerData(
    image: 'assets/icons/img.png',
    text: "Property details",
    desc: "Description . Lease details",
  ),
  ContainerData(
    image:'assets/icons/img.png',
    text: "Documents",
    desc: "Disclosure and circular • Operating\nagreements",
  ),
];

class PropertyInfoScreen extends StatefulWidget {
  const PropertyInfoScreen({Key? key}) : super(key: key);

  @override
  State<PropertyInfoScreen> createState() => _PropertyInfoScreenState();
}

class _PropertyInfoScreenState extends State<PropertyInfoScreen> {
  late VideoPlayerController _videoPlayerController;
  late ChewieController _chewieController;

  @override
  void initState() {
    super.initState();
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
  List<Map<String, dynamic>> imageList = [
    {"id": 1, "image_path": "assets/images/Europe.svg", },
    {"id": 2, "image_path": "assets/images/Europe.svg",},
    {"id": 3, "image_path": "assets/images/Europe.svg",},
  ];
  final CarouselController carouselController = CarouselController();
  int currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context, designSize: const Size(428, 926));
    return Scaffold(
      backgroundColor: Palette.baseBackground,
      body: SafeArea(child:
       SingleChildScrollView(
         child: Padding(
           padding: EdgeInsets.only(left: 15.w,right: 15.w),
           child: Column(
             mainAxisAlignment: MainAxisAlignment.start,
             crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Text("Property Info",style: TextStyle(color: Palette.baseElementDark,fontSize: 28.sp,fontWeight: FontWeight.w700),)
                ],
              ),
              SizedBox(height: 10.h,),
              Divider(
                color: Color(0xffDEDEDE),
                thickness: 1,
              ),
             SizedBox(height: 15.h,),
              Stack(
                children: [
                  CarouselSlider(
                    items: imageList.map((item) {
                      return Builder(
                        builder: (BuildContext context) {
                          int index = imageList.indexOf(item);
                          return SvgPicture.asset(
                            item["image_path"],
                            fit: BoxFit.cover,
                            width: double.infinity,
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
                              color: currentIndex == index ? Palette.blue: Palette.baseWhite,
                            ),
                          ),
                        );
                      }).toList(),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 10.h,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("48% Sold",style: TextStyle(
                    color: Color(0xff00B071),
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w400,
                  ),),
                  Container(
                    height: 34.h,
                    width: 100.w,
                    decoration: BoxDecoration(
                      color: Palette.lightBlue,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    alignment: Alignment.center,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SvgPicture.asset("assets/icons/public_lock.svg",height: 16.h,width: 16.w,),
                        Text("Private",style: TextStyle(
                          color: Palette.blue,
                          fontWeight: FontWeight.w400,
                          fontSize: 16.sp,
                        ),),
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(height: 10.h,),
              Text("1363 Hancock Street",style: TextStyle(color: Palette.baseElementDark,fontSize: 24.sp,fontWeight: FontWeight.w700),),
              SizedBox(height: 10.h,),
              Text("Brooklyn, NY 11237",style: TextStyle(
                color: Palette.baseGrey,
                fontSize: 18.sp,
                fontWeight: FontWeight.w400,
              ),),
              SizedBox(height: 15.h,),
              Row(
                children: [
                  Text("\$2,865/month",style: TextStyle(
                    color: Palette.baseElementDark,
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w400,
                  ),),
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
                    child: Text("Regional Bundle",style: TextStyle(
                      color: Palette.baseGrey,
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w400,
                    ),),
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
                    padding:  EdgeInsets.only(left: 5.w),
                    child: Text("12 units",style: TextStyle(
                      color: Palette.baseGrey,
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w400,
                    ),),
                  ),
                ],
              ),
              SizedBox(height: 10.h,),
              Divider(
                color: Color(0xffDEDEDE),
                thickness: 1,
              ),
              SizedBox(height: 10.h,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Investment Price",style: TextStyle(
                    color: Palette.baseElementDark,
                    fontWeight: FontWeight.w400,
                    fontSize: 18.sp,
                  ),),
                  Column(
                    children: [
                      Text("Know More",style: TextStyle(
                        color: Palette.blue,
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w400,
                      ),),
                      Container(
                        height: 1.h,
                        width: 70.w,
                        color: Palette.blue,
                      ),
                    ],
                  ),
                ],
              ),
              SizedBox(height: 10.h,),
              Text("3,879 USD",style: TextStyle(
                color: Palette.blue,
                fontWeight: FontWeight.w700,
                fontSize: 24.sp,
              ),),
              SizedBox(height: 10.h,),
              Divider(
                color: Color(0xffDEDEDE),
                thickness: 1,
              ),
              SizedBox(height: 10.h,),
              Text("March Dividends",style: TextStyle(color: Palette.baseElementDark,fontSize: 20.sp,fontWeight: FontWeight.w700),),
              SizedBox(height: 10.h,),
              Center(
                child: Container(
                  height: 230.h,
                  width: 380.w,
                  decoration: BoxDecoration(
                    color: Palette.lightBlue,
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child:  Padding(
                    padding:  EdgeInsets.all(10.0),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("Annual rental collection",style: TextStyle(
                              color: Palette.baseElementDark,
                              fontSize: 16.sp,
                              fontWeight: FontWeight.w400,
                            ),),
                            Text("\$490,000",style: TextStyle(
                              color: Palette.blue,
                              fontSize: 16.sp,
                              fontWeight: FontWeight.w700,
                            ),),
                          ],
                        ),
                        SizedBox(height: 10.h,),
                        Divider(
                          color: Color(0xffAFE0FF),
                          thickness: 1,
                        ),
                        SizedBox(height: 10.h,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("Development cap rate",style: TextStyle(
                              color: Palette.baseElementDark,
                              fontSize: 16.sp,
                              fontWeight: FontWeight.w400,
                            ),),
                            Text("4.7%",style: TextStyle(
                              color: Palette.blue,
                              fontSize: 16.sp,
                              fontWeight: FontWeight.w700,
                            ),),
                          ],
                        ),
                        SizedBox(height: 10.h,),
                        Divider(
                          color: Color(0xffAFE0FF),
                          thickness: 1,
                        ),
                        SizedBox(height: 10.h,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("After development value",style: TextStyle(
                              color: Palette.baseElementDark,
                              fontSize: 16.sp,
                              fontWeight: FontWeight.w400,
                            ),),
                            Text("\$3,100,699",style: TextStyle(
                              color: Palette.blue,
                              fontSize: 16.sp,
                              fontWeight: FontWeight.w700,
                            ),),
                          ],
                        ),
                        SizedBox(height: 10.h,),
                        Divider(
                          color: Color(0xffAFE0FF),
                          thickness: 1,
                        ),
                        SizedBox(height: 10.h,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("Disposition date",style: TextStyle(
                              color: Palette.baseElementDark,
                              fontSize: 16.sp,
                              fontWeight: FontWeight.w400,
                            ),),
                            Text("Apr 2/2017",style: TextStyle(
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
              SizedBox(height: 10.h,),
              Divider(
                color: Color(0xffDEDEDE),
                thickness: 1,
              ),
              SizedBox(height: 10.h,),
              Text("About Shares",style: TextStyle(color: Palette.baseElementDark,fontSize: 20.sp,fontWeight: FontWeight.w700),),
              SizedBox(height: 10.h,),
              Center(
                child: Container(
                  height: 170.h,
                  width: 380.w,
                  decoration: BoxDecoration(
                    color: Palette.lightBlue,
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child:  Padding(
                    padding:  EdgeInsets.all(10.0),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("Per share",style: TextStyle(
                              color: Palette.baseElementDark,
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
                        SizedBox(height: 10.h,),
                        Divider(
                          color: Color(0xffAFE0FF),
                          thickness: 1,
                        ),
                        SizedBox(height: 10.h,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("Share left",style: TextStyle(
                              color: Palette.baseElementDark,
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
                        SizedBox(height: 10.h,),
                        Divider(
                          color: Color(0xffAFE0FF),
                          thickness: 1,
                        ),
                        SizedBox(height: 10.h,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("Average purchase",style: TextStyle(
                              color: Palette.baseElementDark,
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
              SizedBox(height: 10.h,),
              Divider(
                color: Color(0xffDEDEDE),
                thickness: 1,
              ),
              SizedBox(height: 10.h,),
              Text("Project Presentation",style: TextStyle(color: Palette.baseElementDark,fontSize: 20.sp,fontWeight: FontWeight.w700),),
              SizedBox(height: 10.h,),
              Center(
                child: Container(
                  height:239.h ,
                  width: 380.w,
                  decoration: BoxDecoration(
                    color: Palette.lightBlue,
                    borderRadius: BorderRadius.circular(15.0),

                  ),
                   child:
                    Padding(
                      padding: EdgeInsets.only(left: 15.w,right: 15.w,top: 15.h),
                      child: Column(
                        children: [
                          AspectRatio(
                            aspectRatio: _videoPlayerController.value.aspectRatio,
                            child: Chewie(controller: _chewieController),
                          ),
                        ],
                      ),
                    ),
                ),
              ),
              SizedBox(height: 10.h,),
              Divider(
                color: Color(0xffDEDEDE),
                thickness: 2,
              ),
              SizedBox(height: 10.h,),
         Center(
           child: Container(
             height:281.h ,
             width: 380.w,
             decoration: BoxDecoration(
               color: Palette.lightBlue,
               borderRadius: BorderRadius.circular(15.0),
             ),
             child: ListView.builder(
               shrinkWrap: true,
               itemCount: containerDataList.length,
               itemBuilder: (BuildContext context, int index) {
                 return Padding(
                   padding:  EdgeInsets.only(left: 10.w,right: 10.w,top: 5.h),
                   child: Column(
                     children: [
                       Row(
                         mainAxisAlignment: MainAxisAlignment.start,
                         crossAxisAlignment: CrossAxisAlignment.start,
                         children: [
                           Image.asset(
                             containerDataList[index].image,
                             height: 56.h,
                             width: 56.w,
                           ),
                           Padding(
                             padding: EdgeInsets.only(left: 10.w,top: 10.w),
                             child: Column(
                               crossAxisAlignment: CrossAxisAlignment.start,
                               children: [
                                 Text(

                                   containerDataList[index].text,style: TextStyle(fontSize: 18.sp,fontWeight: FontWeight.w700,color: Palette.baseElementDark),
                                 ),
                                 SizedBox(height: 10.h,),
                                 Text(
                                   containerDataList[index].desc,
                                   style: TextStyle(color: Palette.baseGrey,fontSize: 16.sp,fontWeight: FontWeight.w400),
                                 ),
                               ],
                             ),
                           ),
                         ],
                       ),
                       Divider(
                         color: Color(0xffAFE0FF),
                         thickness: 1,
                       ),

                     ],
                   ),
                 );
               },
             ),
           ),
         ),
              SizedBox(height: 20.h,),
              Center(
                child: SizedBox(
                  width: 348.w,
                  height: 56.h,
                  child: ElevatedButton(
                    onPressed: () {

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
                      primary:Palette.blue,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                    ),
                  ),
                ),
              ),
             SizedBox(height: 10.h,),
            ],
    ),
         ),
       ),
   ),
    );
  }
}
