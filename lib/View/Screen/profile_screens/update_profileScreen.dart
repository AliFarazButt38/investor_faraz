import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:investor_flutter/Theme/Palette/palette.dart';
import 'package:provider/provider.dart';

import '../../../Theme/theme_manager.dart';

class UpdateProfileScreen extends StatefulWidget {
  const UpdateProfileScreen({Key? key}) : super(key: key);

  @override
  State<UpdateProfileScreen> createState() => _UpdateProfileScreenState();
}

class _UpdateProfileScreenState extends State<UpdateProfileScreen> {
  TextEditingController fullnameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController EmployerController = TextEditingController();
  TextEditingController occupationController = TextEditingController();
  TextEditingController jobController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    final themeManager = Provider.of<ThemeManager>(context);
    final isDarkMode = themeManager.themeMode == ThemeMode.dark;
    ScreenUtil.init(context, designSize: const Size(428, 926));
    return Scaffold(
      backgroundColor: isDarkMode ? Palette.darkBackground : Palette.baseBackground,
      body: SafeArea(
        child: Padding(
          padding:  EdgeInsets.only(left: 15.w,right: 15.w),
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(height: 20.h,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    isDarkMode? GestureDetector(
                      onTap: (){
                        Navigator.pop(context);
                      },
                      child:Image.asset("assets/icons/darkBack.png",height: 46.h,width: 46.w,),
                    ):
                    GestureDetector(
                      onTap: (){
                        Navigator.pop(context);
                      },
                      child:Image.asset("assets/icons/goBack.png",height: 46.h,width: 46.w,),
                    ),
                    SizedBox(width: 20.w,),
                    Text("Personal Profile",style: TextStyle(
                      color:isDarkMode ? Palette.darkWhite : Palette.baseElementDark,
                      fontSize: 28.sp,
                      fontWeight: FontWeight.w700,
                    ),),
                    Spacer(),
                    SvgPicture.asset("assets/icons/editBlue.svg",height: 46.h,width: 46.w,),
                  ],
                ),
                SizedBox(height: 10.h,),
                Divider(
                  color:isDarkMode? Color(0xff404550): Color(0xffDEDEDE),
                  thickness: 1,
                ),
                SizedBox(height: 10.h,),
                SvgPicture.asset("assets/icons/camera.svg",height: 150.h,width: 150.w,),
                SizedBox(height: 10.h,),
                Divider(
                  color:isDarkMode? Color(0xff404550): Color(0xffDEDEDE),
                  thickness: 1,
                ),
                SizedBox(height: 10.h,),
                Form(
                    key: _formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                          Text("Full Name",style: TextStyle(
                            color:isDarkMode ? Palette.darkWhite : Palette.baseElementDark,
                            fontSize: 18.sp,
                            fontWeight: FontWeight.w400,
                          ),),
                        SizedBox(height: 5.h,),
                        TextFormField(
                          controller: fullnameController,
                          onChanged: (value) {
                            setState(() {
                            });
                          },
                          decoration: InputDecoration(
                            hintText: "Enter name",
                            labelStyle: TextStyle(
                              color: Palette.baseElementDark,
                              fontSize: 17.sp,
                              fontWeight: FontWeight.w400,
                            ),

                            hintStyle: TextStyle(
                              color:isDarkMode ? Palette.hintText : Palette.baseGrey,
                              fontSize: 17.sp,
                              fontWeight: FontWeight.w400,

                            ),
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: isDarkMode ? Palette.hintText :  Palette.blueSides, // Change border color if passwords don't match
                              ),
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Palette.blue ,
                              ),
                              borderRadius: BorderRadius.circular(10.0),
                            ), errorBorder: OutlineInputBorder(
                            borderSide: const BorderSide(color: Palette.red),
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                            focusedErrorBorder: OutlineInputBorder(
                              borderSide: const BorderSide(color: Palette.red),
                              borderRadius: BorderRadius.circular(10.0),
                            ),

                            filled: true,
                            fillColor:isDarkMode ? Palette.filledTextField : Palette.textFieldBlue,
                          ),
                          validator: (text) {
                            if(text!.isEmpty){
                              return 'enter name';
                            }

                            return null;
                          },
                        ),
                        SizedBox(height: 15.h,),
                        Text("Email",style: TextStyle(
                          color:isDarkMode ? Palette.darkWhite : Palette.baseElementDark,                          fontSize: 18.sp,
                          fontWeight: FontWeight.w400,
                        ),),
                        SizedBox(height: 5.h,),
                        TextFormField(
                          controller: emailController,
                          onChanged: (value) {
                            setState(() {
                            });
                          },
                          decoration: InputDecoration(
                            labelStyle: TextStyle(
                              color: Palette.baseElementDark,
                              fontSize: 17.sp,
                              fontWeight: FontWeight.w400,
                            ),
                            hintText: "example@gmail.com",
                            hintStyle: TextStyle(
                              color: isDarkMode ? Palette.hintText : Palette.baseGrey,
                              fontSize: 17.sp,
                              fontWeight: FontWeight.w400,

                            ),
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: isDarkMode ? Palette.hintText :  Palette.blueSides, // Change border color if passwords don't match
                              ),
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Palette.blue ,
                              ),
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                            errorBorder: OutlineInputBorder(
                              borderSide: const BorderSide(color: Palette.red),
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                            focusedErrorBorder: OutlineInputBorder(
                              borderSide: const BorderSide(color: Palette.red),
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                            filled: true,
                            fillColor:isDarkMode ? Palette.filledTextField :  Palette.textFieldBlue,
                          ),
                          validator: (text) {
                            if(text!.isEmpty){
                              return 'enter date ';
                            }

                            return null;
                          },
                        ),
                        SizedBox(height: 15.h,),
                        Text("Employer Name",style: TextStyle(
                          color:isDarkMode ? Palette.darkWhite : Palette.baseElementDark,                          fontSize: 18.sp,
                          fontWeight: FontWeight.w400,
                        ),),
                        SizedBox(height: 5.h,),
                        TextFormField(
                          controller: EmployerController,
                          onChanged: (value) {
                            setState(() {
                            });
                          },
                          decoration: InputDecoration(

                            labelStyle: TextStyle(
                              color: Palette.baseElementDark,
                              fontSize: 17.sp,
                              fontWeight: FontWeight.w400,
                            ),
                            hintText: "John Wick",
                            hintStyle: TextStyle(
                              color: isDarkMode ? Palette.hintText : Palette.baseGrey,
                              fontSize: 17.sp,
                              fontWeight: FontWeight.w400,

                            ),
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: isDarkMode ? Palette.hintText :  Palette.blueSides, // Change border color if passwords don't match
                              ),
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Palette.blue ,
                              ),
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                            errorBorder: OutlineInputBorder(
                              borderSide: const BorderSide(color: Palette.red),
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                            focusedErrorBorder: OutlineInputBorder(
                              borderSide: const BorderSide(color: Palette.red),
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                            filled: true,
                            fillColor:isDarkMode ? Palette.filledTextField :  Palette.textFieldBlue,
                          ),
                          validator: (text) {
                            if(text!.isEmpty){
                              return 'enter title';
                            }

                            return null;
                          },
                        ),
                        SizedBox(height: 15.h,),
                        Text("Job Title",style: TextStyle(
                          color:isDarkMode ? Palette.darkWhite : Palette.baseElementDark,                          fontSize: 18.sp,
                          fontWeight: FontWeight.w400,
                        ),),
                        SizedBox(height: 5.h,),
                        TextFormField(
                          controller: jobController,
                          onChanged: (value) {
                            setState(() {
                            });
                          },
                          decoration: InputDecoration(
                            labelStyle: TextStyle(
                              color: Palette.baseElementDark,
                              fontSize: 17.sp,
                              fontWeight: FontWeight.w400,
                            ),
                            hintText: "Manager",
                            hintStyle: TextStyle(
                              color: isDarkMode ? Palette.hintText : Palette.baseGrey,
                              fontSize: 17.sp,
                              fontWeight: FontWeight.w400,

                            ),
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: isDarkMode ? Palette.hintText :  Palette.blueSides, // Change border color if passwords don't match
                              ),
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Palette.blue ,
                              ),
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                            errorBorder: OutlineInputBorder(
                              borderSide: const BorderSide(color: Palette.red),
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                            focusedErrorBorder: OutlineInputBorder(
                              borderSide: const BorderSide(color: Palette.red),
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                            filled: true,
                            fillColor:isDarkMode ? Palette.filledTextField :  Palette.textFieldBlue,
                          ),
                          validator: (text) {
                            if(text!.isEmpty){
                              return 'enter title';
                            }

                            return null;
                          },
                        ),
                        SizedBox(height: 15.h,),
                        Text("Occupation Industry",style: TextStyle(
                          color:isDarkMode ? Palette.darkWhite : Palette.baseElementDark,                          fontSize: 18.sp,
                          fontWeight: FontWeight.w400,
                        ),),
                        SizedBox(height: 5.h,),
                        TextFormField(
                          controller: occupationController,
                          onChanged: (value) {
                            setState(() {
                            });
                          },
                          decoration: InputDecoration(
                            labelStyle: TextStyle(
                              color: Palette.baseElementDark,
                              fontSize: 17.sp,
                              fontWeight: FontWeight.w400,
                            ),
                            hintText: "Industry Name",
                            hintStyle: TextStyle(
                              color: isDarkMode ? Palette.hintText : Palette.baseGrey,
                              fontSize: 17.sp,
                              fontWeight: FontWeight.w400,

                            ),
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: isDarkMode ? Palette.hintText :  Palette.blueSides, // Change border color if passwords don't match
                              ),
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Palette.blue ,
                              ),
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                            errorBorder: OutlineInputBorder(
                              borderSide: const BorderSide(color: Palette.red),
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                            focusedErrorBorder: OutlineInputBorder(
                              borderSide: const BorderSide(color: Palette.red),
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                            filled: true,
                            fillColor:isDarkMode ? Palette.filledTextField :  Palette.textFieldBlue,
                          ),
                          validator: (text) {
                            if(text!.isEmpty){
                              return 'enter title';
                            }

                            return null;
                          },
                        ),
                      ],
                    )),
                SizedBox(height: 30.h,),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
