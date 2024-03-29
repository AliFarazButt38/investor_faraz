import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:investor_flutter/View/Screen/complete_your_profile/upload_documentsScreen.dart';
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


class StatementCheckScreen extends StatefulWidget {
  const StatementCheckScreen({Key? key}) : super(key: key);

  @override
  State<StatementCheckScreen> createState() => _StatementCheckScreenState();
}

class _StatementCheckScreenState extends State<StatementCheckScreen> {
  List<EmploymentStatus> employmentStatusList = [
    EmploymentStatus(title: 'The net worth of each owner is \$1M+\n(excluding primary residence)'),
    EmploymentStatus(title: 'The individual income of each owner\nwas \$200k+ for each of the past two'),
    EmploymentStatus(title: 'Are you or anyone in your household\nassociated with a FINRA Member?'),
    EmploymentStatus(title: 'The entity has total assets exceeding'),
    EmploymentStatus(title: 'For each owner, their joint income\nincluding their spouse was \$300k'),
  ];

  int selectedStatusIndex = -1;
  bool isStatusSelected = false;

  @override
  Widget build(BuildContext context) {
    final themeManager = Provider.of<ThemeManager>(context);
    final isDarkMode = themeManager.themeMode == ThemeMode.dark;
    final userPersonalInfoProvider = Provider.of<UserPersonalInfoProvider>(context, listen: false);
    ScreenUtil.init(context, designSize: const Size(428, 926));
    return Scaffold(
      backgroundColor: isDarkMode ? Palette.darkBackground : Palette.baseBackground,
      body: SafeArea(child:
      Padding(
        padding:  EdgeInsets.only(left: 20.w,right: 20.w,),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,

          children: [
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
            ),            SizedBox(height: 20.h,),
            Text(
              "Do any of these\nstatements apply to you?",
              style: TextStyle(
                fontSize: 30.sp,
                fontWeight: FontWeight.w700,
                color:isDarkMode? Palette.darkWhite : Palette.baseElementDark,
              ),
            ),
            SizedBox(height: 20.h,),
            Text("You can still invest even if none cf these apply\nto you,",
              style: TextStyle(
                color: Palette.baseGrey,
                fontSize: 18.sp,
                fontWeight: FontWeight.w400,
              ),
            ),
            SizedBox(height: 10.h,),
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
                        isStatusSelected = true;
                        userPersonalInfoProvider.updateEmploymentStatement(status.title);

                      });
                    },
                    child: Container(
                      width: 368.w,
                      height: 80.h,

                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(
                          color: status.isSelected ? Palette.blue : (isDarkMode ? Palette.hintText: Palette.blueSides),
                          width: 2.0,
                        ),
                        color:isDarkMode? Palette.filledTextField : Palette.textFieldBlue,
                      ),
                      margin: EdgeInsets.all(10.0),
                      padding: EdgeInsets.all(10.0),
                      child: Row(
                        children: [
                          Container(
                            width: 20.73.w,
                            height: 20.73.h,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              border: Border.all(
                                color: status.isSelected ? Palette.blue : (isDarkMode ? Palette.darkWhite : Palette.baseElementDark),
                                width: 1.0,
                              ),

                              color:  Colors.transparent,
                            ),
                            child: status.isSelected
                                ? Icon(
                              Icons.check,
                              color: Colors.blue,
                              size: 13.0,
                            )
                                : null,
                          ),
                          SizedBox(width: 10.0),
                          Text(
                            status.title,
                            style: TextStyle(
                              color: status.isSelected ? Palette.blue : (isDarkMode? Palette.darkWhite : Palette.baseElementDark),
                              fontSize: 17.sp,
                            ),
                          ),
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
                  onPressed: () async{
                    if (isStatusSelected) {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => UploadDocumentsScreen()));
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text('Please select a choice')),
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
