import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:investor_flutter/View/Screen/complete_your_profile/employement_InfoScreen.dart';

import '../../../Theme/Palette/palette.dart';
import 'enterprise_infoScreen.dart';
class EmploymentStatus {
  final String title;
  bool isSelected;

  EmploymentStatus({required this.title, this.isSelected = false});
}

class AccountTypeScreen extends StatefulWidget {
  const AccountTypeScreen({Key? key}) : super(key: key);

  @override
  State<AccountTypeScreen> createState() => _AccountTypeScreenState();
}

class _AccountTypeScreenState extends State<AccountTypeScreen> {
  List<EmploymentStatus> employmentStatusList = [
    EmploymentStatus(title: 'individual'),
    EmploymentStatus(title: 'Enterprise (Corporation or Trust)'),
  ];

  int selectedStatusIndex = -1;
  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context, designSize: const Size(428, 926));
    return Scaffold(
      backgroundColor: Palette.baseBackground,
      body: SafeArea(child:
      Padding(
        padding:  EdgeInsets.only(left: 20.w,right: 20.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(child: SvgPicture.asset("assets/icons/investor.svg", width: 48.w, height: 39.h)),
            SizedBox(height: 20.h,),
            Text(
              "Choose your account\ntype",
              style: TextStyle(
                fontSize: 30.sp,
                fontWeight: FontWeight.w700,
                color: Palette.baseElementDark,
              ),
            ),
            SizedBox(height: 20.h,),
            Expanded(
              child: ListView.builder(
                itemCount: employmentStatusList.length,
                shrinkWrap: true,
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
                      });
                    },
                    child: Container(
                      height: 60.h,
                      width: 368.w,
                      decoration: BoxDecoration(
                        color: Palette.textFieldBlue,
                        border: Border.all(
                          color: status.isSelected ? Palette.blue : Palette.blueSides,
                          width: 1.0,
                        ),
                        borderRadius: BorderRadius.circular(20),
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
                                  color: status.isSelected ? Palette.blue : Palette.baseElementDark,
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
            ),
            Center(
              child: SizedBox(
                width: 304.w,
                height: 56.h,
                child: ElevatedButton(
                  onPressed: (){
                    EmploymentStatus selectedStatus =
                    employmentStatusList[selectedStatusIndex];
                    if (selectedStatus.title == 'individual') {
                    Navigator.push(
                      context,
                       MaterialPageRoute(
                           builder: (context) =>EmployementInfoScreen(),
                      ),
                        );
                          } else if (selectedStatus.title ==
                    'Enterprise (Corporation or Trust)') {
                    Navigator.push(
                          context,
                     MaterialPageRoute(
                        builder: (context) => EnterPriseInfoScreen(),
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
    );
  }
}
