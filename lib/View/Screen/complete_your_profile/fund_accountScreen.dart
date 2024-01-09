import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:investor_flutter/View/Screen/complete_your_profile/document_Screen.dart';
import 'package:provider/provider.dart';

import '../../../Auth/firestore_auth.dart';
import '../../../Provider/userProvider.dart';
import '../../../Theme/Palette/palette.dart';
import '../../../Theme/theme_manager.dart';
class EmploymentStatus {
  final String title;
  bool isSelected;

  EmploymentStatus({required this.title, this.isSelected = false});
}
class AcreditedInvestor {
  final String title;
  bool isSelected;

  AcreditedInvestor({required this.title, this.isSelected = false});
}

class LevelRiskStatus {
  final String title;
  bool isSelected;

  LevelRiskStatus({required this.title, this.isSelected = false});
}

class EmployedStatus {
  final String title;
  bool isSelected;

  EmployedStatus({required this.title, this.isSelected = false});
}

class Politicaltatus {
  final String title;
  bool isSelected;

  Politicaltatus({required this.title, this.isSelected = false});
}
class FundAccountScreen extends StatefulWidget {
  const FundAccountScreen({Key? key}) : super(key: key);

  @override
  State<FundAccountScreen> createState() => _FundAccountScreenState();
}

class _FundAccountScreenState extends State<FundAccountScreen> {

  List<EmploymentStatus> employmentStatusList = [
    EmploymentStatus(title: 'Income'),
    EmploymentStatus(title: 'Retirement Savings'),
    EmploymentStatus(title: 'Gift'),
    EmploymentStatus(title: 'Other'),
  ];
  int selectedStatusIndex = -1;

  List<AcreditedInvestor> accreditInvestorList = [
    AcreditedInvestor(title: 'Yes'),
    AcreditedInvestor(title: 'No'),
  ];
  int selectedIndex = -1;

  List<LevelRiskStatus> levelRiskList = [
    LevelRiskStatus(title: 'Moderate'),
    LevelRiskStatus(title: 'Aggressive'),
    LevelRiskStatus(title: 'Conservative'),
  ];
  int selectedLevel = -1;

  List<EmployedStatus> employedList = [
    EmployedStatus(title: 'Yes'),
    EmployedStatus(title: 'No'),
  ];
  int employedStatus = -1;

  List<Politicaltatus> politicalList = [
    Politicaltatus(title: 'Yes'),
    Politicaltatus(title: 'No'),
  ];
  int politicalStatus = -1;
  bool employmentStatusCompleted = false;
  bool accreditedInvestorCompleted = false;
  bool levelRiskCompleted = false;
  bool employedStatusCompleted = false;
  bool politicalStatusCompleted = false;

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
              ),
              SizedBox(height: 20.h,),
              Text(
                "How will you fund your\nAMIA account?",
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
                        userPersonalInfoProvider.updateEmploymentStatusCompleted(status.title);


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
                "Are you an accredited\ninvestor?",
                style: TextStyle(
                  fontSize: 30.sp,
                  fontWeight: FontWeight.w700,
                  color: isDarkMode ? Palette.darkWhite : Palette.baseElementDark,
                ),
              ),
              SizedBox(height: 10.h,),
              Text("Know More",style: TextStyle(
                color: Palette.blue,
                fontSize: 14.sp,
                fontWeight: FontWeight.w400,
              ),),
              Container(
                height: 2,
                width: 65,
                color: Palette.blue,
              ),
              SizedBox(height: 20.h,),

              ListView.builder(
                itemCount: accreditInvestorList.length,
                shrinkWrap: true,
                physics: BouncingScrollPhysics(),
                itemBuilder: (BuildContext context, int index) {
                  AcreditedInvestor status = accreditInvestorList[index];
                  return GestureDetector(
                    onTap: () {
                      setState(() {
                        if (selectedIndex != -1) {
                          accreditInvestorList[selectedIndex].isSelected = false;
                        }
                        status.isSelected = true;
                        selectedIndex = index;
                        userPersonalInfoProvider.updateAccreditedInvestorCompleted(status.title);
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
                          Expanded(
                            child: Container(
                              alignment: Alignment.center,
                              child: Text(
                                status.title,
                                style: TextStyle(
                                  color: status.isSelected ? Palette.blue : (isDarkMode? Palette.darkWhite : Palette.baseElementDark),
                                  fontSize: 18.sp,
                                  fontWeight: status.isSelected ?FontWeight.w700 : FontWeight.w400,
                                ),
                              ),
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
              SizedBox(height: 5,),
              Text("Either way, you can still invest with Landa.",style: TextStyle(
                fontWeight: FontWeight.w400,
                fontSize: 15.sp,
                color:isDarkMode ? Palette.hintText : Palette.baseGrey,
              ),),
              SizedBox(height: 20.h,),
              Text(
                "What level of risk do you\nlike to take in your\ninvestments?",
                style: TextStyle(
                  fontSize: 30.sp,
                  fontWeight: FontWeight.w700,
                  color: isDarkMode ? Palette.darkWhite : Palette.baseElementDark,
                ),
              ),

              ListView.builder(
                itemCount: levelRiskList.length,
                shrinkWrap: true,
                physics: BouncingScrollPhysics(),
                itemBuilder: (BuildContext context, int index) {
                  LevelRiskStatus status = levelRiskList[index];
                  return GestureDetector(
                    onTap: () {
                      setState(() {
                        if (selectedLevel != -1) {
                          levelRiskList[selectedLevel].isSelected = false;
                        }
                        status.isSelected = true;
                        selectedLevel = index;
                        userPersonalInfoProvider.updateLevelRiskCompleted(status.title);
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
                "Are you employed by or\nassociated with a\nmember of Cither a\nstock exchange Or\nFINRA?",
                style: TextStyle(
                  fontSize: 30.sp,
                  fontWeight: FontWeight.w700,
                  color: isDarkMode ? Palette.darkWhite : Palette.baseElementDark,
                ),
              ),

              SizedBox(height: 20.h,),
              ListView.builder(
                itemCount: employedList.length,
                shrinkWrap: true,
                physics: BouncingScrollPhysics(),
                itemBuilder: (BuildContext context, int index) {
                  EmployedStatus status = employedList[index];
                  return GestureDetector(
                    onTap: () {
                      setState(() {
                        if (employedStatus != -1) {
                          employedList[employedStatus].isSelected = false;
                        }
                        status.isSelected = true;
                        employedStatus = index;
                        userPersonalInfoProvider.updateEmployedStatusCompleted(status.title);

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
                          Expanded(
                            child: Container(
                              alignment: Alignment.center,
                              child: Text(
                                status.title,
                                style: TextStyle(
                                  color: status.isSelected ? Palette.blue : (isDarkMode? Palette.darkWhite : Palette.baseElementDark),
                                  fontSize: 18.sp,
                                  fontWeight: status.isSelected ?FontWeight.w700 : FontWeight.w400,
                                ),
                              ),
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
                "Politically Exposed Person",
                style: TextStyle(
                  fontSize: 30.sp,
                  fontWeight: FontWeight.w700,
                  color: isDarkMode ? Palette.darkWhite : Palette.baseElementDark,
                ),
              ),
              SizedBox(height: 20.h,),
              Text("Are you, or anyone with an interest in this\nrelationship,currently or formerly,either:\n1. A senior military,government,or political official,or\n2. An immediate family member or close\nassociate, either personally or professionally\nof a senior military, government, or political official? ",
                style: TextStyle(
                  fontWeight: FontWeight.w400,
                  fontSize: 18.sp,
                  color: isDarkMode ? Palette.hintText : Palette.baseGrey,
                ),),
              SizedBox(height: 10.h,),
              ListView.builder(
                itemCount: politicalList.length,
                shrinkWrap: true,
                physics: BouncingScrollPhysics(),
                itemBuilder: (BuildContext context, int index) {
                  Politicaltatus status = politicalList[index];
                  return GestureDetector(
                    onTap: () {
                      setState(() {
                        if (politicalStatus != -1) {
                          politicalList[politicalStatus].isSelected = false;
                        }
                        status.isSelected = true;
                        politicalStatus = index;
                        userPersonalInfoProvider.updatePoliticalStatusCompleted(status.title);

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
                          Expanded(
                            child: Container(
                              alignment: Alignment.center,
                              child: Text(
                                status.title,
                                style: TextStyle(
                                  color: status.isSelected ? Palette.blue : (isDarkMode? Palette.darkWhite : Palette.baseElementDark),
                                  fontSize: 18.sp,
                                  fontWeight: status.isSelected ?FontWeight.w700 : FontWeight.w400,
                                ),
                              ),
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
              Center(
                child: SizedBox(
                  width: 304.w,
                  height: 56.h,
                  child: ElevatedButton(
                    onPressed: () async{
                      if (userPersonalInfoProvider.employmentStatusCompleted.isNotEmpty &&
                          userPersonalInfoProvider.accreditedInvestorCompleted.isNotEmpty &&
                          userPersonalInfoProvider.levelRiskCompleted.isNotEmpty &&
                          userPersonalInfoProvider.employedStatusCompleted.isNotEmpty &&
                          userPersonalInfoProvider.politicalStatusCompleted.isNotEmpty) {
                        Navigator.push(context, MaterialPageRoute(builder: (context)=>DocumentScreen()));
                      } else {
                        // Show an error on a SnackBar
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text('Please complete all sections'),
                          ),
                        );
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
