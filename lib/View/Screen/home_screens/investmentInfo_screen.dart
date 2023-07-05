import 'package:carousel_slider/carousel_controller.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:investor_flutter/View/Widget/line_chart.dart';

import '../../../Theme/Palette/palette.dart';

class InvestmentInfoScreen extends StatefulWidget {
  const InvestmentInfoScreen({Key? key}) : super(key: key);

  @override
  State<InvestmentInfoScreen> createState() => _InvestmentInfoScreenState();
}

class _InvestmentInfoScreenState extends State<InvestmentInfoScreen> {
  List<Map<String, dynamic>> imageList = [
    {"id": 1, "image_path": "assets/images/Greece.svg", },
    {"id": 2, "image_path": "assets/images/Greece.svg",},
    {"id": 3, "image_path": "assets/images/Greece.svg",},
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
           padding: EdgeInsets.only(left: 10.w,right: 10.w),
           child: Column(
             crossAxisAlignment: CrossAxisAlignment.start,
             children: [
               Text("Investment Info",style: TextStyle(color: Palette.baseElementDark,fontSize: 28.sp,fontWeight: FontWeight.w700),),
               SizedBox(height: 10.h,),
               Divider(
                 color: Color(0xffDEDEDE),
                 thickness: 1,
               ),
               SizedBox(height: 10.h,),
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
               Text("1363 Hancock Street",style: TextStyle(color: Palette.baseElementDark,fontSize: 24.sp,fontWeight: FontWeight.w700),),
               SizedBox(height: 10.h,),
               Text("Brooklyn, NY 11237",style: TextStyle(
                 color: Palette.baseGrey,
                 fontSize: 18.sp,
                 fontWeight: FontWeight.w400,
               ),),
               SizedBox(height: 10.h,),
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
               Text("Ground up development project",style: TextStyle(
                 color: Palette.baseElementDark,
                 fontWeight: FontWeight.w700,
                 fontSize: 16.sp,
               ),),
               SizedBox(height: 10.h,),
               Text("Single-family, 12 units. Rental development.\nUp and coming neighborhood",style: TextStyle(
                 color: Palette.baseElementDark,
                 fontWeight: FontWeight.w400,
                 fontSize: 16.sp,
               ),),
               SizedBox(height: 10.h,),
               Divider(
                 color: Color(0xffDEDEDE),
                 thickness: 1,
               ),
               SizedBox(height: 10.h,),
               Row(
                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
                 children: [
                   Text("Total Investment value",style: TextStyle(
                     color: Palette.baseElementDark,
                     fontWeight: FontWeight.w400,
                     fontSize: 18.sp,
                   ),),
                   Text("90,000 USD",style: TextStyle(
                     color: Palette.blue,
                     fontWeight: FontWeight.w700,
                     fontSize: 24.sp,
                   ),),
                 ],
               ),
               SizedBox(height: 5.h,),
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
                             Text("Total invested",style: TextStyle(
                               color: Palette.baseElementDark,
                               fontSize: 16.sp,
                               fontWeight: FontWeight.w400,
                             ),),
                             Text("\$65,000",style: TextStyle(
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
                             Text("Total earns",style: TextStyle(
                               color: Palette.baseElementDark,
                               fontSize: 16.sp,
                               fontWeight: FontWeight.w400,
                             ),),
                             Text("\$25,000",style: TextStyle(
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
                             Text("Return on investment annualy",style: TextStyle(
                               color: Palette.baseElementDark,
                               fontSize: 16.sp,
                               fontWeight: FontWeight.w400,
                             ),),
                             Text("12.3%",style: TextStyle(
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
               Center(
                 child: Container(
                   height: 172.h,
                   width: 380.w,
                   decoration: BoxDecoration(
                     color: Palette.lightBlue,
                     borderRadius: BorderRadius.circular(15),
                   ),
                   child: Padding(
                     padding:  EdgeInsets.only(left: 15.w,right: 15.w,top: 15.h),
                     child: Column(
                       crossAxisAlignment: CrossAxisAlignment.start,
                       children: [
                         Container(
                           width: 148.w,
                           height: 24.h,
                           decoration: BoxDecoration(
                             color: Palette.baseWhite,
                             borderRadius: BorderRadius.circular(12),
                           ),
                           alignment: Alignment.center,
                           child: Text(
                             "Possibilities to grow",
                             style: TextStyle(
                               color:Color(0xff286CA8),
                               fontWeight: FontWeight.w400,
                               fontSize: 16.sp,
                             ),
                           ),
                         ),
                         SizedBox(height: 10.h,),
                         SizedBox(
                             height: 120.h,
                             width: 332.w,
                             child: LineChartWidget()),
                       ],
                     ),
                   ),
                 ),
               ),
               SizedBox(height: 10.h,),
               Text("Project Metrics",style: TextStyle(color: Palette.baseElementDark,fontSize: 20.sp,fontWeight: FontWeight.w700),),
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
                             Text("After development ARC",style: TextStyle(
                               color: Palette.baseElementDark,
                               fontSize: 16.sp,
                               fontWeight: FontWeight.w400,
                             ),),
                             Text("\$13,000",style: TextStyle(
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
                             Text("After development cap rate",style: TextStyle(
                               color: Palette.baseElementDark,
                               fontSize: 16.sp,
                               fontWeight: FontWeight.w400,
                             ),),
                             Text("4.8%",style: TextStyle(
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
                             Text("2,600,000",style: TextStyle(
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
                             Text("Estimated disposition date",style: TextStyle(
                               color: Palette.baseElementDark,
                               fontSize: 16.sp,
                               fontWeight: FontWeight.w400,
                             ),),
                             Text("Q2/2026",style: TextStyle(
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
               SizedBox(height: 20.h,),
             ],
           ),
         ),
       )),
    );
  }
}
