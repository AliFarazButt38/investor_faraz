import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:investor_flutter/View/Screen/profile_screens/update_profileScreen.dart';

import '../../../Theme/Palette/palette.dart';

class PersonalProfileInfoScreen extends StatefulWidget {
  const PersonalProfileInfoScreen({Key? key}) : super(key: key);

  @override
  State<PersonalProfileInfoScreen> createState() => _PersonalProfileInfoScreenState();
}

class _PersonalProfileInfoScreenState extends State<PersonalProfileInfoScreen> {
  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context, designSize: const Size(428, 926));
    return Scaffold(
      backgroundColor: Palette.baseBackground,
      body: SafeArea(
        child: Padding(
          padding:  EdgeInsets.only(left: 15.w,right: 15.w),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Profile",style: TextStyle(
                    color: Palette.baseElementDark,
                    fontSize: 28.sp,
                    fontWeight: FontWeight.w700,
                  ),),
                  GestureDetector(
                      onTap: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context)=>UpdateProfileScreen()));

                      },
                      child: SvgPicture.asset("assets/icons/edit.svg",height: 46.h,width: 46.w,)),
                ],
              ),
              SizedBox(height: 10.h,),
              Divider(
                color: Color(0xffDEDEDE),
                thickness: 1,
              ),
              SizedBox(height: 10.h,),
              SvgPicture.asset("assets/images/profile.svg",height: 100.h,width: 100.w,),
              SizedBox(height: 10.h,),
              Text("John Smith",style: TextStyle(
                color: Palette.baseElementDark,
                fontSize: 30.sp,
                fontWeight: FontWeight.w700,
              ),),
              SizedBox(height: 5.h,),
              Text("example@gmail.com",style: TextStyle(
                color: Palette.baseGrey,
                fontSize: 18.sp,
                fontWeight: FontWeight.w400,
              ),),
              SizedBox(height: 10.h,),
              Divider(
                color: Color(0xffDEDEDE),
                thickness: 1,
              ),
              SizedBox(height: 10.h,),
              Container(
                height: 420.h,
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
                          Text("Email",style: TextStyle(
                            color: Palette.baseElementDark,
                            fontSize: 16.sp,
                            fontWeight: FontWeight.w700,
                          ),),
                          Text("example@gmail.com",style: TextStyle(
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
                          Text("Password",style: TextStyle(
                            color: Palette.baseElementDark,
                            fontSize: 16.sp,
                            fontWeight: FontWeight.w700,
                          ),),
                          Text("*********",style: TextStyle(
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
                          Text("Account type",style: TextStyle(
                            color: Palette.baseElementDark,
                            fontSize: 16.sp,
                            fontWeight: FontWeight.w700,
                          ),),
                          Text("Individual",style: TextStyle(
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
                          Text("Employment status",style: TextStyle(
                            color: Palette.baseElementDark,
                            fontSize: 16.sp,
                            fontWeight: FontWeight.w700,
                          ),),
                          Text("Self Employed",style: TextStyle(
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
                          Text("Employer name",style: TextStyle(
                            color: Palette.baseElementDark,
                            fontSize: 16.sp,
                            fontWeight: FontWeight.w700,
                          ),),
                          Text("John wick",style: TextStyle(
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
                          Text("Job title",style: TextStyle(
                            color: Palette.baseElementDark,
                            fontSize: 16.sp,
                            fontWeight: FontWeight.w700,
                          ),),
                          Text("Manager",style: TextStyle(
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
                          Text("Occupation industry",style: TextStyle(
                            color: Palette.baseElementDark,
                            fontSize: 16.sp,
                            fontWeight: FontWeight.w700,
                          ),),
                          Text("Industry Name",style: TextStyle(
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
            ],
          ),
        ),
      ),
    );
  }
}
