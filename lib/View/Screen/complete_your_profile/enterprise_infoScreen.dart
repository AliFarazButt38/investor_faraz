import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:investor_flutter/View/Screen/complete_your_profile/statements_checkScreen.dart';

import '../../../Theme/Palette/palette.dart';


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
              "Employment info",
              style: TextStyle(
                fontSize: 30.sp,
                fontWeight: FontWeight.w700,
                color: Palette.baseElementDark,
              ),
            ),
            SizedBox(height: 20.h,),
             Expanded(
               child: Form(
                 key: _formKey,
                   child: Column(
                 children: [
                   TextFormField(
                     controller: enterpriseController,
                     onChanged: (value) {
                       setState(() {
                       });
                     },
                     decoration: InputDecoration(
                       labelText: "Enterprise name",
                       hintText: "Enter name",
                       labelStyle: TextStyle(
                         color: Palette.baseElementDark,
                         fontSize: 17.sp,
                         fontWeight: FontWeight.w400,
                       ),

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
                       ), errorBorder: OutlineInputBorder(
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
                         return 'enter name';
                       }

                       return null;
                     },
                   ),
                   SizedBox(height: 15.h,),
                   TextFormField(
                     controller: dateController,
                     onChanged: (value) {
                       setState(() {
                       });
                     },
                     decoration: InputDecoration(
                       labelText: "Enterprise formation date",
                       labelStyle: TextStyle(
                         color: Palette.baseElementDark,
                         fontSize: 17.sp,
                         fontWeight: FontWeight.w400,
                       ),
                       hintText: "Select date",
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
                         return 'enter date ';
                       }

                       return null;
                     },
                   ),
                   SizedBox(height: 15.h,),
                   TextFormField(
                     controller: titleController,
                     onChanged: (value) {
                       setState(() {
                       });
                     },
                     decoration: InputDecoration(
                       labelText: "Signatory title",
                       labelStyle: TextStyle(
                         color: Palette.baseElementDark,
                         fontSize: 17.sp,
                         fontWeight: FontWeight.w400,
                       ),
                       hintText: "Write title",
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
                             // Reset the error state on change
                           });
                         },
                         decoration: InputDecoration(
                           labelText: "Employer Identification Number",
                           labelStyle: TextStyle(
                             color: Palette.baseElementDark,
                             fontWeight: FontWeight.w400,
                             fontSize: 17.sp,
                           ),
                           hintText: "I’d number",
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
                             color: isPasswordVisible? Palette.blue : Palette.baseGrey,
                           ),
                         ),
                       ),
                     ],

                   ),

                 ],
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
