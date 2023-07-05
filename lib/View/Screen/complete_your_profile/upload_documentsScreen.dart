import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../../Theme/Palette/palette.dart';
class EmploymentStatus {
  final String title;
  bool isSelected;

  EmploymentStatus({required this.title, this.isSelected = false});
}


class UploadDocumentsScreen extends StatefulWidget {
  const UploadDocumentsScreen({Key? key}) : super(key: key);

  @override
  State<UploadDocumentsScreen> createState() => _UploadDocumentsScreenState();
}

class _UploadDocumentsScreenState extends State<UploadDocumentsScreen> {
  List<EmploymentStatus> employmentStatusList = [
    EmploymentStatus(title: 'EIN Verification'),
    EmploymentStatus(title: 'Operating Agreement'),
    EmploymentStatus(title: 'Certificate of Formation'),

  ];

  int selectedStatusIndex = -1;

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context, designSize: const Size(428, 926));
    return Scaffold(
      backgroundColor: Palette.baseBackground,
      body: SafeArea(child:
      Padding(
        padding:  EdgeInsets.only(left: 20.w,right: 20.w,),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,

          children: [
            Center(child: SvgPicture.asset("assets/icons/investor.svg", width: 48.w, height: 39.h)),
            SizedBox(height: 20.h,),
            Text(
              "Upload Documents",
              style: TextStyle(
                fontSize: 30.sp,
                fontWeight: FontWeight.w700,
                color: Palette.baseElementDark,
              ),
            ),
            SizedBox(height: 20.h,),
            Text("Upload your legal documents to complete\nenterprise account and invest fastly",
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
                      });
                    },
                    child: Container(
                      width: 368.w,
                      height: 74.h,

                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(
                          color: status.isSelected ? Palette.blue : Palette.blueSides,
                          width: 2.0,
                        ),
                        color: Palette.textFieldBlue,
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
                                color: status.isSelected ? Palette.blue : Palette.baseElementDark,
                                width: 1.0,
                              ),

                              color:  Colors.transparent,
                            ),
                            child: status.isSelected
                                ? Icon(
                              Icons.check,
                              color: Palette.blue,
                              size: 13.0,
                            )
                                : null,
                          ),
                          SizedBox(width: 10.0),
                          Expanded(
                            child: Text(
                              status.title,
                              style: TextStyle(
                                color: status.isSelected ? Palette.blue : Palette.baseElementDark,
                                fontSize: 17.sp,
                              ),
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
              child: Container(
                height: 56.h,
                width: 304.w,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Palette.blue,
                ),
                child: Center(
                  child: Text("Done",style: TextStyle(
                    color: Palette.baseWhite,
                    fontWeight: FontWeight.w700,
                    fontSize: 18.sp,
                  ),),
                ),
              ),
            ),
            SizedBox(height: 30.h,),
          ],
        ),
      ),
      ),
    );
  }
}
