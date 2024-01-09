import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:investor_flutter/View/Screen/complete_your_profile/personal_informationScreen.dart';
import 'package:provider/provider.dart';

import '../../../Provider/userProvider.dart';
import '../../../Theme/Palette/palette.dart';
import '../../../Theme/theme_manager.dart';
class EmploymentStatus {
  final String title;
  bool isSelected;

  EmploymentStatus({required this.title, this.isSelected = false});
}

class EmployementInfoScreen extends StatefulWidget {
  const EmployementInfoScreen({Key? key}) : super(key: key);

  @override
  State<EmployementInfoScreen> createState() => _EmployementInfoScreenState();
}

class _EmployementInfoScreenState extends State<EmployementInfoScreen> {
  TextEditingController employerController = TextEditingController();
  TextEditingController jobController = TextEditingController();
  TextEditingController industryController = TextEditingController();
  bool isStatusSelected = false;
  final _formKey = GlobalKey<FormState>();
  List<EmploymentStatus> employmentStatusList = [
    EmploymentStatus(title: 'Self Employed'),
    EmploymentStatus(title: 'Employed'),
    EmploymentStatus(title: 'Unemployed'),
    EmploymentStatus(title: 'Retired'),
    EmploymentStatus(title: 'Student'),

  ];
  int selectedStatusIndex = -1;
  @override
  Widget build(BuildContext context) {
    final themeManager = Provider.of<ThemeManager>(context);
    final isDarkMode = themeManager.themeMode == ThemeMode.dark;
    final userPersonalInfoProvider = Provider.of<UserPersonalInfoProvider>(context);

    ScreenUtil.init(context, designSize: const Size(428, 926));
    return Scaffold(
      backgroundColor: isDarkMode ? Palette.darkBackground : Palette.baseBackground,
      body: SafeArea(child:
      SingleChildScrollView(
        child: Padding(
          padding:  EdgeInsets.only(left: 20.w,right: 20.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 20.h,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    onTap: (){
                      Navigator.pop(context);
                    },
                    child: Image.asset("assets/icons/back.png",height: 34.h,width: 34.w,),
                  ),
                  Padding(
                    padding:  EdgeInsets.only(right: 170.w),
                    child: SvgPicture.asset("assets/icons/investor.svg", width: 48.w, height: 39.h),
                  ),
                ],
              ),              SizedBox(height: 20.h,),
              Text(
                "Employment status",
                style: TextStyle(
                  fontSize: 30.sp,
                  fontWeight: FontWeight.w700,
                  color: isDarkMode ? Palette.darkWhite : Palette.baseElementDark,
                ),
              ),
              SizedBox(height: 20.h,),
              ListView.builder(
                itemCount: employmentStatusList.length,
                shrinkWrap: true,
                physics: BouncingScrollPhysics(),
                itemBuilder: (BuildContext context, int index) {
                  EmploymentStatus status = employmentStatusList[index];
                  return GestureDetector(
                    onTap: () {
                      setState(() {
                        if (selectedStatusIndex != -1) {
                          employmentStatusList[selectedStatusIndex].isSelected = false;
                        }
                        status.isSelected = true;
                        selectedStatusIndex = index;
                        isStatusSelected = true;

                        userPersonalInfoProvider.updateSelectedEmploymentStatus(status.title);

                      });
                    },
                    child: Container(
                      height: 60.h,
                      width: 368.w,
                      decoration: BoxDecoration(
                        color:isDarkMode? Palette.filledTextField : Palette.textFieldBlue,
                        border: Border.all(
                          color: status.isSelected ? Palette.blue : (isDarkMode ? Palette.hintText: Palette.blueSides),
                          width: 1.0,
                        ),
                        borderRadius: BorderRadius.circular(25),
                      ),
                      margin: EdgeInsets.only(right: 10.w,top: 10.h,bottom: 10.h,left: 10.w),
                      padding: EdgeInsets.all(10.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            status.title,
                            style: TextStyle(
                              color: status.isSelected ? Palette.blue : (isDarkMode? Palette.darkWhite : Palette.baseElementDark),
                              fontSize: 18.sp,
                              fontWeight: status.isSelected ?FontWeight.w700 : FontWeight.w400,
                            ),
                          ),
                          if (status.isSelected)
                            SvgPicture.asset("assets/icons/check.svg",height: 22.h,width: 22.w,),
                        ],
                      ),
                    ),
                  );
                },
              ),
              SizedBox(height: 20.h,),
              Text(
                "Employment info",
                style: TextStyle(
                  fontSize: 30.sp,
                  fontWeight: FontWeight.w700,
                  color: isDarkMode ? Palette.darkWhite : Palette.baseElementDark,
                ),
              ),
              SizedBox(height: 20.h,),
              Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      TextFormField(
                        controller: employerController,
                        onChanged: (value) {
                          setState(() {
                            userPersonalInfoProvider.updateEmployerName(value);
                          });
                        },
                        decoration: InputDecoration(
                          labelText: "Employer name / Company",
                          hintText: "Enter name",
                          labelStyle: TextStyle(
                            color:isDarkMode ? Palette.darkWhite : Palette.baseElementDark,
                            fontSize: 17.sp,
                            fontWeight: FontWeight.w400,
                          ),

                          hintStyle: TextStyle(
                            color: isDarkMode ? Palette.hintText : Palette.baseGrey,
                            fontSize: 17.sp,
                            fontWeight: FontWeight.w400,

                          ),
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: isDarkMode ? Palette.hintText :  Palette.blueSides, // Change border color if passwords don't match
                            ),
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Palette.blue ,
                            ),
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                          errorBorder: OutlineInputBorder(
                            borderSide: const BorderSide(color: Palette.red),
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                          focusedErrorBorder: OutlineInputBorder(
                            borderSide: const BorderSide(color: Palette.red),
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                          filled: true,
                          fillColor: isDarkMode? Palette.filledTextField : Palette.textFieldBlue,
                        ),
                        validator: (text) {
                          if(text!.isEmpty){
                            return 'enter employer name / company ';
                          }

                          return null;
                        },
                      ),
                      SizedBox(height: 15.h,),
                      TextFormField(
                        controller: jobController,
                        onChanged: (value) {
                          setState(() {
                            userPersonalInfoProvider.updateJobTitle(value);
                          });
                        },
                        decoration: InputDecoration(
                          labelText: "Your job title",
                          labelStyle: TextStyle(
                            color:isDarkMode ? Palette.darkWhite : Palette.baseElementDark,
                            fontSize: 17.sp,
                            fontWeight: FontWeight.w400,
                          ),
                          hintText: "Enter job title",
                          hintStyle: TextStyle(
                            color: isDarkMode ? Palette.hintText : Palette.baseGrey,
                            fontSize: 17.sp,
                            fontWeight: FontWeight.w400,

                          ),
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: isDarkMode ? Palette.hintText :  Palette.blueSides, // Change border color if passwords don't match
                            ),
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Palette.blue ,
                            ),
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                          errorBorder: OutlineInputBorder(
                            borderSide: const BorderSide(color: Palette.red),
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                          focusedErrorBorder: OutlineInputBorder(
                            borderSide: const BorderSide(color: Palette.red),
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                          filled: true,
                          fillColor: isDarkMode? Palette.filledTextField : Palette.textFieldBlue,
                        ),
                        validator: (text) {
                          if(text!.isEmpty){
                            return 'enter job title ';
                          }

                          return null;
                        },
                      ),
                      SizedBox(height: 15.h,),
                      TextFormField(
                        controller: industryController,
                        onChanged: (value) {
                          setState(() {
                            userPersonalInfoProvider.updateOccupationIndustry(value);
                          });
                        },
                        decoration: InputDecoration(
                          labelText: "Your Occupation Industry",
                          labelStyle: TextStyle(
                            color:isDarkMode ? Palette.darkWhite : Palette.baseElementDark,
                            fontSize: 17.sp,
                            fontWeight: FontWeight.w400,
                          ),
                          hintText: "Write industry name",
                          hintStyle: TextStyle(
                            color: isDarkMode ? Palette.hintText : Palette.baseGrey,
                            fontSize: 17.sp,
                            fontWeight: FontWeight.w400,

                          ),
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: isDarkMode ? Palette.hintText :  Palette.blueSides, // Change border color if passwords don't match
                            ),
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Palette.blue ,
                            ),
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                          errorBorder: OutlineInputBorder(
                            borderSide: const BorderSide(color: Palette.red),
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                          focusedErrorBorder: OutlineInputBorder(
                            borderSide: const BorderSide(color: Palette.red),
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                          filled: true,
                          fillColor: isDarkMode? Palette.filledTextField : Palette.textFieldBlue,
                        ),
                        validator: (text) {
                          if(text!.isEmpty){
                            return 'enter occupation industry ';
                          }
                          return null;
                        },
                      ),
                      SizedBox(height: 15.h,),
                    ],
                  )),
              Center(
                child: SizedBox(
                  width: 304.w,
                  height: 56.h,
                  child: ElevatedButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        if (isStatusSelected) {
                          Navigator.push(context, MaterialPageRoute(builder: (context) => PersonalInfoScreen()));
                        } else {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(content: Text('Please select an employment status')),
                          );
                        }
                      }
                    },
                    child: Text(
                      "Next",
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
      ),
    );
  }
}
