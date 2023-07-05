import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../Theme/Palette/palette.dart';

class EmailVerificationScreen extends StatefulWidget {
  @override
  _EmailVerificationScreenState createState() => _EmailVerificationScreenState();
}

class _EmailVerificationScreenState extends State<EmailVerificationScreen> {
  int otp1=0;
  int otp2=0;
  int otp3=0;
  int otp4=0;
  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context, designSize: const Size(428, 926));
    return Scaffold(
      backgroundColor: Palette.baseBackground,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 15.w),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Image.asset("assets/icons/cross.png", height: 28.h, width: 28.w),
                  Padding(
                    padding:  EdgeInsets.only(right: 170.w),
                    child: SvgPicture.asset("assets/icons/investor.svg", width: 48.w, height: 39.h),
                  ),
                  ],
                ),
          SizedBox(height: 20.h,),
          Text(
            "Email verification" ,
            style: TextStyle(
              fontSize: 28.sp,
              fontWeight: FontWeight.w700,
              color: Palette.baseElementDark,
            ),
          ),
              SizedBox(height: 50.h,),
              Text("Enter code",style: TextStyle(
                color: Palette.baseElementDark,
                fontSize: 17.sp,
                fontWeight: FontWeight.w400,
              ),),
              SizedBox(height: 30.h,),
              Padding(
                padding: EdgeInsets.only(left: 40.w,right: 40.w),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Container(
                      height: 56.h,
                      width: 56.w,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        border: Border.all(
                          color: Palette.blueSides,
                        ),
                        color: Palette.textFieldBlue, // light orange color
                      ),
                      child: TextFormField(

                        onChanged: (value) {
                          if (value.length == 1) {
                            setState(() {
                              otp1 = int.parse(value);
                            });
                            FocusScope.of(context).nextFocus();
                          }
                        },
                        keyboardType: TextInputType.number,
                        textAlign: TextAlign.center,
                        inputFormatters: [
                          LengthLimitingTextInputFormatter(1),
                          FilteringTextInputFormatter.digitsOnly,
                        ],
                        style:  TextStyle(fontSize: 20.55.sp,),
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color:  Palette.blue,width: 1),
                          ),
                        ),// optional styling for the text inside
                      ),
                    ),
                    Container(
                      height: 56.h,
                      width: 56.w,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                          border: Border.all(
                            color: Palette.blueSides,
                          ),
                          color: Palette.textFieldBlue  // light orange color

                      ),
                      child: TextFormField(

                        onChanged: (value) {
                          if (value.length == 1) {
                            setState(() {
                              otp2 = int.parse(value);
                            });
                            FocusScope.of(context).nextFocus();
                          }
                        },
                        keyboardType: TextInputType.number,
                        textAlign: TextAlign.center,
                        inputFormatters: [
                          LengthLimitingTextInputFormatter(1),
                          FilteringTextInputFormatter.digitsOnly,
                        ],
                        style:  TextStyle(fontSize: 20.55.sp,),
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color:  Palette.blue,width: 1),
                          ),
                        ),// optional styling for the text inside
                      ),
                    ),
                    Container(
                      height: 56.h,
                      width: 56.w,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        border: Border.all(
                          color: Palette.blueSides,
                        ),
                        color: Palette.textFieldBlue, // light orange color

                      ),
                      child: TextFormField(

                        onChanged: (value) {
                          if (value.length == 1) {
                            setState(() {
                              otp3 = int.parse(value);
                            });
                            FocusScope.of(context).nextFocus();
                          }
                        },
                        keyboardType: TextInputType.number,
                        textAlign: TextAlign.center,
                        inputFormatters: [
                          LengthLimitingTextInputFormatter(1),
                          FilteringTextInputFormatter.digitsOnly,
                        ],
                        style:  TextStyle(fontSize: 20.55.sp,),
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color:  Palette.blue,width: 1),
                          ),
                        ),// optional styling for the text inside
                      ),
                    ),
                    Container(
                      height: 56.h,
                      width: 56.w,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                          border: Border.all(
                            color: Palette.blueSides,
                          ),
                          color: Palette.textFieldBlue  // light orange color

                      ),
                      child: TextFormField(

                        onChanged: (value) {
                          if (value.length == 1) {
                            setState(() {
                              otp4 = int.parse(value) ;
                            });
                            FocusScope.of(context).nextFocus();
                          }
                        },
                        keyboardType: TextInputType.number,
                        textAlign: TextAlign.center,
                        inputFormatters: [
                          LengthLimitingTextInputFormatter(1),
                          FilteringTextInputFormatter.digitsOnly,
                        ],
                        style:  TextStyle(fontSize: 20.55.sp,),
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color:  Palette.blue,width: 1),
                          ),
                        ),// optional styling for the text inside
                      ),
                    ),

                  ],
                ),
              ),
              SizedBox(height: 60.h,),
              SizedBox(
                width: 304.w,
                height: 56.h,
                child: ElevatedButton(
                  onPressed: () {
                    // Handle send OTP button press here
                  },
                  child: Text(
                    "Submit",
                    style: TextStyle(color: Colors.white),
                  ),
                  style: ElevatedButton.styleFrom(
                    primary:Palette.blue,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20.0),
                    ),
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
