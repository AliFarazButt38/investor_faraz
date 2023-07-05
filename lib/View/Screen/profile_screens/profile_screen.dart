import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:investor_flutter/Theme/Palette/palette.dart';
import 'package:investor_flutter/View/Screen/bank_Screens/transaction_screen1.dart';
import 'package:investor_flutter/View/Screen/profile_screens/personal_profile_infoScreen.dart';

class ProfilePage extends StatefulWidget {
  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context, designSize: const Size(428, 926));
    return Scaffold(
      backgroundColor: Palette.baseBackground,
      body: SafeArea(
        child: Padding(
          padding:  EdgeInsets.only(left: 15.w,right: 15.w),
          child: ListView(
            children: [
              Row(
                children: [
                  Text("Profile",style: TextStyle(
                    color: Palette.baseElementDark,
                    fontSize: 28.sp,
                    fontWeight: FontWeight.w700,
                  ),),
                ],
              ),
              SizedBox(height: 10.h,),
              Divider(
                color: Color(0xffDEDEDE),
                thickness: 1,
              ),
              GestureDetector(
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>PersonalProfileInfoScreen()));

                  },
                  child: buildListTile('assets/icons/settings.svg', 'Profile Settings')),
              Divider(
                color: Color(0xffECECEC),
                thickness: 1,
              ),
              buildListTile('assets/icons/accountSetup.svg', 'Account Setup'),
              Divider(
                color: Color(0xffECECEC),
                thickness: 1,
              ),
              GestureDetector(
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>TransactionScreen1()));
                  },
                  child: buildListTile('assets/icons/bank_account.svg', 'Bank Account')),
              Divider(
                color: Color(0xffECECEC),
                thickness: 1,
              ),
              buildListTile('assets/icons/settings.svg', 'Documents'),
              Divider(
                color: Color(0xffECECEC),
                thickness: 1,
              ),
              buildListTile('assets/icons/cutomer_support.svg', 'Customer Support'),
              Divider(
                color: Color(0xffECECEC),
                thickness: 1,
              ),
              buildListTile('assets/icons/privacypolicy.svg', 'Privacy Policy'),
              Divider(
                color: Color(0xffECECEC),
                thickness: 1,
              ),
              buildListTile('assets/icons/darkmode.svg', 'Dark Mode', hasTrailingIcon: true),
              Divider(
                color: Color(0xffECECEC),
                thickness: 1,
              ),
              buildListTile('assets/icons/logout.svg', 'Log Out'),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildListTile(String iconPath, String title, {bool hasTrailingIcon = false}) {
    return ListTile(
      leading: SvgPicture.asset(
        iconPath,
        width: 24.w, // Adjust the width as needed
        height: 24.h, // Adjust the height as needed
      ),
      title: Text(title,style: TextStyle(
        color: Palette.baseElementDark,
        fontWeight: FontWeight.w400,
        fontSize: 16.sp,
      ),),
      trailing: hasTrailingIcon ? SvgPicture.asset("assets/icons/darkmodebutton.svg",height: 36.h,width: 68.w,) : null,
    );
  }
}



