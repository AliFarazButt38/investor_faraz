import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:intl/intl.dart';
import 'package:investor_flutter/View/Screen/complete_your_profile/statements_checkScreen.dart';
import 'package:provider/provider.dart';

import '../../../Provider/userProvider.dart';
import '../../../Theme/Palette/palette.dart';
import '../../../Theme/theme_manager.dart';


class EnterPriseInfoScreen extends StatefulWidget {
  const EnterPriseInfoScreen({Key? key}) : super(key: key);

  @override
  State<EnterPriseInfoScreen> createState() => _EnterPriseInfoScreenState();
}

class _EnterPriseInfoScreenState extends State<EnterPriseInfoScreen> {
  TextEditingController enterpriseController = TextEditingController();
  TextEditingController dateController = TextEditingController();
  TextEditingController titleController = TextEditingController();
  TextEditingController idController = TextEditingController();

  bool isPasswordVisible=false;

  final _formKey = GlobalKey<FormState>();
  DateTime? _selectedDate;
  final DateFormat _dateFormat = DateFormat('MM/dd/yyyy');
  @override
  Widget build(BuildContext context) {
    final themeManager = Provider.of<ThemeManager>(context);
    final isDarkMode = themeManager.themeMode == ThemeMode.dark;
    final userPersonalInfoProvider = Provider.of<UserPersonalInfoProvider>(context);
    ScreenUtil.init(context, designSize: const Size(428, 926));
    return Scaffold(
      backgroundColor: isDarkMode ? Palette.darkBackground : Palette.baseBackground,
      body: SafeArea(child:
      Padding(
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
            ),            SizedBox(height: 20.h,),
            Text(
              "Employment info",
              style: TextStyle(
                fontSize: 30.sp,
                fontWeight: FontWeight.w700,
                color: isDarkMode ? Palette.darkWhite : Palette.baseElementDark,
              ),
            ),
            SizedBox(height: 20.h,),
            Expanded(
              child: Form(
                  key: _formKey,
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        TextFormField(
                          controller: enterpriseController,
                          onChanged: (value) {
                            setState(() {
                              userPersonalInfoProvider.updateEnterpriseName(value);
                            });
                          },
                          decoration: InputDecoration(
                            labelText: "Enterprise name",
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
                            ), errorBorder: OutlineInputBorder(
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
                              return 'enter name';
                            }

                            return null;
                          },
                        ),
                        SizedBox(height: 15.h,),
                        TextFormField(
                          controller: dateController,
                          onTap: () async {
                            final DateTime? selectedDate = await showDatePicker(
                              context: context,
                              initialDate: DateTime.now(),
                              firstDate: DateTime(1900), // Adjust the minimum date as needed
                              lastDate: DateTime.now(),
                            );

                            if (selectedDate != null) {
                              dateController.text = DateFormat('dd/MM/yyyy').format(selectedDate);
                              userPersonalInfoProvider.updateFormationDate(dateController.text);
                            }
                          },
                          decoration: InputDecoration(
                            labelText: "Enterprise formation date",
                            labelStyle: TextStyle(
                              color:isDarkMode ? Palette.darkWhite : Palette.baseElementDark,
                              fontSize: 17.sp,
                              fontWeight: FontWeight.w400,
                            ),
                            hintText: "Select date",
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
                            if (text!.isEmpty) {
                              return 'enter date ';
                            }
                            return null;
                          },
                        ),



                        // TextFormField(
                        //   controller: dateController,
                        //   onChanged: (value) {
                        //     setState(() {
                        //       userPersonalInfoProvider.updateFormationDate(value);
                        //     });
                        //   },
                        //   decoration: InputDecoration(
                        //     labelText: "Enterprise formation date",
                        //     labelStyle: TextStyle(
                        //       color:isDarkMode ? Palette.darkWhite : Palette.baseElementDark,
                        //       fontSize: 17.sp,
                        //       fontWeight: FontWeight.w400,
                        //     ),
                        //     hintText: "Select date",
                        //     hintStyle: TextStyle(
                        //       color: isDarkMode ? Palette.hintText : Palette.baseGrey,
                        //       fontSize: 17.sp,
                        //       fontWeight: FontWeight.w400,
                        //
                        //     ),
                        //     enabledBorder: OutlineInputBorder(
                        //       borderSide: BorderSide(
                        //         color: isDarkMode ? Palette.hintText :  Palette.blueSides, // Change border color if passwords don't match
                        //       ),
                        //       borderRadius: BorderRadius.circular(8.0),
                        //     ),
                        //     focusedBorder: OutlineInputBorder(
                        //       borderSide: BorderSide(
                        //         color: Palette.blue ,
                        //       ),
                        //       borderRadius: BorderRadius.circular(8.0),
                        //     ),
                        //     errorBorder: OutlineInputBorder(
                        //       borderSide: const BorderSide(color: Palette.red),
                        //       borderRadius: BorderRadius.circular(8.0),
                        //     ),
                        //     focusedErrorBorder: OutlineInputBorder(
                        //       borderSide: const BorderSide(color: Palette.red),
                        //       borderRadius: BorderRadius.circular(8.0),
                        //     ),
                        //     filled: true,
                        //     fillColor: isDarkMode? Palette.filledTextField : Palette.textFieldBlue,
                        //   ),
                        //   validator: (text) {
                        //     if(text!.isEmpty){
                        //       return 'enter date ';
                        //     }
                        //
                        //     return null;
                        //   },
                        // ),
                        SizedBox(height: 15.h,),
                        TextFormField(
                          controller: titleController,
                          onChanged: (value) {
                            setState(() {
                              userPersonalInfoProvider.updateSignatoryTitle(value);
                            });
                          },
                          decoration: InputDecoration(
                            labelText: "Signatory title",
                            labelStyle: TextStyle(
                              color:isDarkMode ? Palette.darkWhite : Palette.baseElementDark,
                              fontSize: 17.sp,
                              fontWeight: FontWeight.w400,
                            ),
                            hintText: "Write title",
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
                                color: isDarkMode ? Palette.blue :Palette.blue ,
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
                              return 'enter title';
                            }

                            return null;
                          },
                        ),
                        SizedBox(height: 15.h,),
                        Stack(
                          children:[
                            TextFormField(
                              // Password TextField
                              obscureText: !isPasswordVisible, // Hides the entered text
                              controller: idController,
                              onChanged: (value) {
                                setState(() {
                                  userPersonalInfoProvider.updateEmployerIdentificationNumber(value);
                                });
                              },
                              decoration: InputDecoration(
                                labelText: "Employer Identification Number",
                                labelStyle: TextStyle(
                                  color:isDarkMode ? Palette.darkWhite : Palette.baseElementDark,
                                  fontWeight: FontWeight.w400,
                                  fontSize: 17.sp,
                                ),
                                hintText: "I’d number",
                                hintStyle: TextStyle(
                                  color: isDarkMode ? Palette.hintText : Palette.baseGrey,
                                  fontWeight: FontWeight.w400,
                                  fontSize: 17.sp,
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: isDarkMode ? Palette.hintText :  Palette.blueSides, // Change border color if passwords don't match
                                  ),
                                  borderRadius: BorderRadius.circular(8.0),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Palette.blueSides, // Change border color if passwords don't match
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
                                  return 'enter id number';
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
                                    isPasswordVisible= !isPasswordVisible; // Toggle text visibility
                                  });
                                },
                                child: ImageIcon(
                                  AssetImage("assets/icons/hide.png"),
                                  size: 24.sp,
                                  color: isPasswordVisible?  Palette.blue : (isDarkMode ? Palette.hintText : Palette.baseGrey),
                                ),
                              ),
                            ),
                          ],

                        ),

                      ],
                    ),
                  )),
            ),
            Center(
              child: SizedBox(
                width: 304.w,
                height: 56.h,
                child: ElevatedButton(
                  onPressed: (){
                    if (_formKey.currentState!.validate()) {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => StatementCheckScreen()));
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
