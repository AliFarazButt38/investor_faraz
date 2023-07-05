import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:investor_flutter/View/Screen/home_screens/property_infoScreen.dart';

import '../../../Theme/Palette/palette.dart';

class ExploreInvestmentScreen extends StatefulWidget {
  const ExploreInvestmentScreen({Key? key}) : super(key: key);

  @override
  State<ExploreInvestmentScreen> createState() => _ExploreInvestmentScreenState();
}

class _ExploreInvestmentScreenState extends State<ExploreInvestmentScreen> {
  int selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context, designSize: const Size(428, 926));
    return Scaffold(
      backgroundColor: Palette.baseBackground,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.only(left: 15.w,right: 15.w),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text("Explore Investment",style: TextStyle(color: Palette.baseElementDark,fontSize: 28.sp,fontWeight: FontWeight.w700),)
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
                   Text("Categories",style: TextStyle(
                     fontWeight: FontWeight.w700,
                     fontSize: 18.sp,
                     color: Palette.baseElementDark,
                   ),),
                    Text("More",style: TextStyle(
                      color: Palette.blue,
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w700,
                    ),),
                  ],
                ),
                SizedBox(height: 20.h,),
                SizedBox(
                  height: 44.h, // Set the desired height
                  child: ListView.separated(
                    scrollDirection: Axis.horizontal,
                    separatorBuilder: (BuildContext context, int index) => SizedBox(width: 10.w),
                    itemCount: 3,
                    itemBuilder: (BuildContext context, int index) {
                      final isSelected = selectedIndex == index;
                      return GestureDetector(
                        onTap: () {
                          setState(() {
                            selectedIndex = index;
                          });
                        },
                        child: Container(
                          width: index == 0 ? 161.w : index == 1 ? 103.w : 199.w,
                          height: 44.h,
                          decoration: BoxDecoration(
                            color: isSelected ? Palette.lightBlue: Color(0xffF4F4F4),
                            borderRadius: BorderRadius.circular(15),
                            border: Border.all(
                              color: isSelected ? Palette.blue : Color(0xffDEDEDE),                          ),
                          ),
                          alignment: Alignment.center,
                          child: Text(
                            index == 0 ? "All Properties" : index == 1 ? "Urban" : "Sage Neighborhood",
                            style: TextStyle(
                              color: isSelected ? Palette.blue : Palette.baseGrey,
                              fontWeight:  isSelected ? FontWeight.w700 : FontWeight.w400,
                              fontSize: 16.sp,
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
                SizedBox(height: 10.h,),
                SvgPicture.asset("assets/images/Rectangle 1567 (1).svg"),
                SizedBox(height: 10.h,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Regional Bundle",style: TextStyle(
                      color: Palette.baseGrey,
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
                Text("Europe",style: TextStyle(color: Palette.baseElementDark,fontSize: 24.sp,fontWeight: FontWeight.w700),),
                SizedBox(height: 10.h,),
                Text("investments across all currently available and\nfuture property bundles in Europe.",style: TextStyle(
                  color: Palette.baseGrey,
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w400,
                ),),
                SizedBox(height: 10.h,),
                Text("Investments start from 3,879 USD",style: TextStyle(color: Palette.baseElementDark,fontSize: 20.sp,fontWeight: FontWeight.w700),),
                SizedBox(height: 15.h,),
                Center(
                  child: SizedBox(
                    width: 380.w,
                    height: 52.h,
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context)=>PropertyInfoScreen()));
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Invest Now",
                            style: TextStyle(color:Palette.baseWhite,
                            fontWeight: FontWeight.w700,
                              fontSize: 18.sp,
                            ),
                          ),
                      Icon(Icons.arrow_forward,size: 20,)
                        ],
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
                SizedBox(height: 20.h,),
                SvgPicture.asset("assets/images/Greece.svg"),
                SizedBox(height: 10.h,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Agency Bundle",style: TextStyle(
                      color: Palette.baseGrey,
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
                          SvgPicture.asset("assets/icons/private_lock.svg",height: 16.h,width: 16.w,),
                          Text("Public",style: TextStyle(
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
                Text("Greece",style: TextStyle(color: Palette.baseElementDark,fontSize: 24.sp,fontWeight: FontWeight.w700),),
                SizedBox(height: 10.h,),
                Text("investments across all currently available and\nfuture property bundles in Europe.",style: TextStyle(
                  color: Palette.baseGrey,
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w400,
                ),),
                SizedBox(height: 10.h,),
                Text("Investments start from 1,000 USD",style: TextStyle(color: Palette.baseElementDark,fontSize: 20.sp,fontWeight: FontWeight.w700),),
                SizedBox(height: 15.h,),
                Center(
                  child: SizedBox(
                    width: 380.w,
                    height: 52.h,
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context)=>PropertyInfoScreen()));
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Invest Now",
                            style: TextStyle(color:Palette.baseWhite,
                              fontWeight: FontWeight.w700,
                              fontSize: 18.sp,
                            ),
                          ),
                          Icon(Icons.arrow_forward,size: 20,)
                        ],
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
                SizedBox(height: 20.h,),
              ],
            ),
          ),
        ),
      ),

    );
  }
}
