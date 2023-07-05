import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:investor_flutter/View/Screen/complete_your_profile/fund_accountScreen.dart';

import '../../../Theme/Palette/palette.dart';
class EmploymentStatus {
  final String title;
  bool isSelected;

  EmploymentStatus({required this.title, this.isSelected = false});
}

class PersonalInfoScreen extends StatefulWidget {
  const PersonalInfoScreen({Key? key}) : super(key: key);

  @override
  State<PersonalInfoScreen> createState() => _PersonalInfoScreenState();
}

class _PersonalInfoScreenState extends State<PersonalInfoScreen> {
  TextEditingController dobController = TextEditingController();
  TextEditingController socialController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  bool isSocialNumberVisible = false;
  bool isEnterAddressVisible=false;
  bool isStatusSelected = false;

  final _formKey = GlobalKey<FormState>();

  List<EmploymentStatus> employmentStatusList = [
    EmploymentStatus(title: 'Single or Dating'),
    EmploymentStatus(title: 'Married'),
    EmploymentStatus(title: 'Domestic Partner'),
    EmploymentStatus(title: 'Widowed'),
    EmploymentStatus(title: 'Divorced'),

  ];

  int selectedStatusIndex = -1;
  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context, designSize: const Size(428, 926));
    return Scaffold(
      backgroundColor: Palette.baseBackground,
      body: SafeArea(child:
      SingleChildScrollView(
        child: Padding(
          padding:  EdgeInsets.only(left: 20.w,right: 20.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(child: SvgPicture.asset("assets/icons/investor.svg", width: 48.w, height: 39.h)),
              SizedBox(height: 20.h,),
              Text(
                "Personal Information",
                style: TextStyle(
                  fontSize: 30.sp,
                  fontWeight: FontWeight.w700,
                  color: Palette.baseElementDark,
                ),
              ),
              SizedBox(height: 20.h,),
              Form(
                  key: _formKey,
                  child: Column(
                children: [
                  TextFormField(
                    controller: dobController,
                    onChanged: (value) {
                      setState(() {
                      });
                    },
                    decoration: InputDecoration(
                      labelText: "Date of birth",
                      labelStyle: TextStyle(
                        color: Palette.baseElementDark,
                        fontSize: 17.sp,
                        fontWeight: FontWeight.w400,
                      ),
                      hintText: "09/07/1995",
                      hintStyle: TextStyle(
                        color: Palette.baseGrey,
                        fontSize: 17.sp,
                        fontWeight: FontWeight.w400,

                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color:Palette.blueSides,
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
                      fillColor:Palette.textFieldBlue,
                    ),
                    validator: (text) {
                      if(text!.isEmpty){
                        return 'enter date of birth ';
                      }

                      return null;
                    },
                  ),
                  SizedBox(height: 15.h,),
                  Stack(
                    children:[
                      TextFormField(
                        // Password TextField
                        obscureText: !isSocialNumberVisible,  // Hides the entered text
                        controller: socialController,
                        onChanged: (value) {
                          setState(() {
                            // Reset the error state on change
                          });
                        },
                        decoration: InputDecoration(
                          labelText: "Social number",
                          labelStyle: TextStyle(
                            color: Palette.baseElementDark,
                            fontWeight: FontWeight.w400,
                            fontSize: 17.sp,
                          ),
                          hintText: "Social security number",
                          hintStyle: TextStyle(
                            color: Palette.baseGrey,
                            fontWeight: FontWeight.w400,
                            fontSize: 17.sp,
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color:  Palette.blueSides, // Change border color if passwords don't match
                            ),
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color:  Palette.blue , // Change border color if passwords don't match
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
                          fillColor: Palette.textFieldBlue,
                        ),
                        validator: (text) {
                          if(text!.isEmpty){
                            return 'enter social number ';
                          }

                          return null;
                        },
                      ),
                      Positioned(
                        right: 8.0,
                        top: 20,
                        child: GestureDetector(
                          onTap: (){
                            setState(() {
                              isSocialNumberVisible = !isSocialNumberVisible; // Toggle text visibility
                            });
                          },
                          child: ImageIcon(
                            AssetImage("assets/icons/hide.png"),
                            size: 24.sp,
                            color: isSocialNumberVisible ? Palette.blue : Palette.baseGrey,
                          ),
                        ),
                      ),
                    ],

                  ),
                  SizedBox(height: 15.h,),
                  Stack(
                    children:[
                      TextFormField(
                        // Password TextField
                        obscureText: !isEnterAddressVisible, // Hides the entered text
                        controller: addressController,
                        onChanged: (value) {
                          setState(() {
                            // Reset the error state on change
                          });
                        },
                        decoration: InputDecoration(
                          labelText: "Enter address",
                          labelStyle: TextStyle(
                            color: Palette.baseElementDark,
                            fontWeight: FontWeight.w400,
                            fontSize: 17.sp,
                          ),
                          hintText: "Your permanent address",
                          hintStyle: TextStyle(
                            color: Palette.baseGrey,
                            fontWeight: FontWeight.w400,
                            fontSize: 17.sp,
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color:  Palette.blueSides, // Change border color if passwords don't match
                            ),
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color:  Palette.blue , // Change border color if passwords don't match
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
                          fillColor: Palette.textFieldBlue,
                        ),
                        validator: (text) {
                          if(text!.isEmpty){
                            return 'enter address ';
                          }

                          return null;
                        },
                      ),
                      Positioned(
                        right: 8.0,
                        top: 20,
                        child: GestureDetector(
                          onTap: (){
                            setState(() {
                              isEnterAddressVisible = !isEnterAddressVisible; // Toggle text visibility
                            });
                          },
                          child: ImageIcon(
                            AssetImage("assets/icons/hide.png"),
                            size: 24.sp,
                            color: isEnterAddressVisible? Palette.blue : Palette.baseGrey,
                          ),
                        ),
                      ),
                    ],

                  ),
                ],
              )),
              SizedBox(height: 15.h,),
              Text(
                "What's your relationship\nstatus?",
                style: TextStyle(
                  fontSize: 30.sp,
                  fontWeight: FontWeight.w700,
                  color: Palette.baseElementDark,
                ),
              ),
              SizedBox(height: 10.h,),
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
                          Text(
                            status.title,
                            style: TextStyle(
                              color: status.isSelected ? Palette.blue : Palette.baseElementDark,
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
              Center(
                child: SizedBox(
                  width: 304.w,
                  height: 56.h,
                  child: ElevatedButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        if (isStatusSelected) {
                          Navigator.push(context, MaterialPageRoute(builder: (context) => FundAccountScreen()));
                        } else {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(content: Text('Please select an relationship status')),
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
