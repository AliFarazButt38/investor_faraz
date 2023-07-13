import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:investor_flutter/View/Screen/complete_your_profile/account_typeScreen.dart';
import 'package:provider/provider.dart';

import '../../../Theme/Palette/palette.dart';
import '../../../Theme/theme_manager.dart';
class ContainerData {
  final String image;

  final String desc;
  final String text;

  ContainerData({required this.image,required this.desc,required this.text});
}
          List<ContainerData> containerDataList = [
          ContainerData(
          image:'assets/icons/lock.png',
          text: "We protect your SSN",
          desc: "Your SSN will not be shared without your\npermission, except as required by law.",
          ),
          ContainerData(
          image: 'assets/icons/shield.png',
          text: "No impact on your credit score",
          desc: "Your SSN will only be used to verify\nyour identity. This will not affect your credit\nscore.",
          ),
          ContainerData(
          image:'assets/icons/encryoted.png',
          text: "Encrypted and Secure",
          desc: "Your information will be encrypted and\ntransmitted to us via a secure connection.",
          ),
          ];

class CompleteYourProfile extends StatefulWidget {
  const CompleteYourProfile({Key? key}) : super(key: key);

  @override
  State<CompleteYourProfile> createState() => _CompleteYourProfileState();
}

class _CompleteYourProfileState extends State<CompleteYourProfile> {
  @override
  Widget build(BuildContext context) {
    final themeManager = Provider.of<ThemeManager>(context);
  final isDarkMode = themeManager.themeMode == ThemeMode.dark;
    ScreenUtil.init(context, designSize: const Size(428, 926));
    return Scaffold(
      backgroundColor: isDarkMode ? Palette.darkBackground : Palette.baseBackground,
      body: SafeArea(child:
      Padding(
        padding:  EdgeInsets.only(left: 20.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,

          children: [
            SizedBox(height: 20.h,),

            Center(child: SvgPicture.asset("assets/icons/investor.svg", width: 48.w, height: 39.h)),
           SizedBox(height: 20.h,),
            Text(
              "Complete your\nprofile",
              style: TextStyle(
                fontSize: 40.sp,
                fontWeight: FontWeight.w700,
                color: isDarkMode ? Palette.darkWhite : Palette.baseElementDark,
              ),
            ),
            SizedBox(height: 15.h,),
            Text("We are required by law to get some details\nto get you started and approve your\ninvestment.",
              style: TextStyle(
                color: isDarkMode ? Palette.hintText : Palette.baseGrey,
                fontSize: 18.sp,
                fontWeight: FontWeight.w400,
              ),
            ),
            SizedBox(height: 20.h,),
            Expanded(
              child: ListView.builder(
                shrinkWrap: true,
                itemCount: containerDataList.length,
                itemBuilder: (BuildContext context, int index) {
                  return Column(
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

                                  containerDataList[index].text,style: TextStyle(fontSize: 18.sp,fontWeight: FontWeight.w700,

                                  color: isDarkMode ? Palette.darkWhite : Palette.baseElementDark,
                                ),
                                ),
                                SizedBox(height: 10.h,),
                                Text(
                                    containerDataList[index].desc,
                                    style: TextStyle(
                                        color: isDarkMode ? Palette.hintText : Palette.baseGrey,
                                        fontSize: 16.sp,fontWeight: FontWeight.w400),

                                ),
                              ],
                            ),
                          ),
                        ],
                      ),

                    ],
                  );
                },
              ),
            ),
            Center(
              child: SizedBox(
                width: 304.w,
                height: 56.h,
                child: ElevatedButton(
                  onPressed: (){
                 Navigator.push(context, MaterialPageRoute(builder: (context)=>AccountTypeScreen()));
                  },
                  child: Text(
                    "Continue",
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
            SizedBox(height: 30.h,)
          ],
        ),
      ),
      ),
    );
  }
}
