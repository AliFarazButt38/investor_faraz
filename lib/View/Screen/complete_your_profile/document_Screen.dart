import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../../Theme/Palette/palette.dart';


class DocumentScreen extends StatefulWidget {
  const DocumentScreen({Key? key}) : super(key: key);

  @override
  State<DocumentScreen> createState() => _DocumentScreenState();
}

class _DocumentScreenState extends State<DocumentScreen> {
  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context, designSize: const Size(428, 926));
    return Scaffold(
      backgroundColor: Palette.baseBackground,
      body: SafeArea(child:
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,

        children: [
          Center(child: SvgPicture.asset("assets/icons/investor.svg", width: 48.w, height: 39.h)),
          SizedBox(height: 20.h,),
          Padding(
            padding:  EdgeInsets.only(left: 20.w),
            child: Text(
              "Which document do you\nwant to upload?",
              style: TextStyle(
                fontSize: 30.sp,
                fontWeight: FontWeight.w700,
                color: Palette.baseElementDark,
              ),
            ),
          ),
          SizedBox(height: 15.h,),
          Padding(
            padding:  EdgeInsets.only(left: 20.w),
            child: Text("FYI, we can only accept US-issued IDs right\nnow.Make sure your name matches the\nspelling on your social security card.",
              style: TextStyle(
                color: Palette.baseGrey,
                fontSize: 18.sp,
                fontWeight: FontWeight.w400,
              ),
            ),
          ),
          SizedBox(height: 20.h,),
          Expanded(child: Center(child: SvgPicture.asset("assets/images/document.svg",width: 188.w,height: 168.h,))),
          SizedBox(height: 50.h,),
          Center(
            child: SizedBox(
              width: 304.w,
              height: 56.h,
              child: ElevatedButton(
                onPressed: () {

                },
                child: Text(
                  "Driver's License",
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
          SizedBox(height: 15.h,),
          Center(
            child: SizedBox(
              width: 304.w,
              height: 56.h,
              child: ElevatedButton(
                onPressed: () {
                  // Handle sign in button press here
                },
                child: Text(
                  "Social Security Card",
                  style: TextStyle(color: Palette.blue),
                ),
                style: ElevatedButton.styleFrom(
                  primary: Color(0xffF8F8F8),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20.0),
                    side: BorderSide(color: Palette.blue),
                  ),
                ),
              ),
            ),
          ),
          SizedBox(height: 50.h,)
        ],
      ),
      ),
    );
  }
}
