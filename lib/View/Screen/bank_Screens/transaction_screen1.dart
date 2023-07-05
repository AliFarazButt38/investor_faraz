import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../Theme/Palette/palette.dart';
class ContainerData {
  final String image;
  final String text;
  final String time;
  final String amount;

  ContainerData({required this.image, required this.text,required this.time,required this.amount});
}

List<ContainerData> containerDataList = [
  ContainerData(
    image:'assets/icons/hancock.svg',
    text: 'Hancock Property',
    amount: "-\$1,000",
    time: "3 Dec, 2022",
  ),
  ContainerData(
    image:'assets/icons/hancock.svg',
    text: 'Hancock Property',
    amount: "-\$1,000",
    time: "3 Dec, 2022",
  ),
  ContainerData(
    image:'assets/icons/hancock.svg',
    text: 'Hancock Property',
    amount: "+\$1,000",
    time: "3 Dec, 2022",
  ),
];

class TransactionScreen1 extends StatefulWidget {
  const TransactionScreen1({Key? key}) : super(key: key);

  @override
  State<TransactionScreen1> createState() => _TransactionScreen1State();
}

class _TransactionScreen1State extends State<TransactionScreen1> {
  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context, designSize: const Size(428, 926));
    return Scaffold(
      backgroundColor: Palette.baseBackground,
      body: SafeArea(child:
      Padding(
        padding:  EdgeInsets.only(left: 15.w,right: 15.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Text("Bank Account Info",style: TextStyle(
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
            SizedBox(height: 10.h,),
            Text("Bank Account One",style: TextStyle(
              color: Palette.baseElementDark,
              fontSize: 20.sp,
              fontWeight: FontWeight.w700,
            ),),
            SizedBox(height: 15.h,),
            Center(
              child: Container(
                height: 188.h,
                width: 380.w,
                decoration: BoxDecoration(
                   border: Border.all(
                     color: Palette.blue,
                   ),
                     borderRadius: BorderRadius.circular(10.0),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("Account holder name",style: TextStyle(
                            color: Palette.baseElementDark,
                            fontSize: 16.sp,
                            fontWeight: FontWeight.w700,
                          ),),
                          Text("John Wick",style: TextStyle(
                            color: Palette.blue,
                            fontSize: 16.sp,
                            fontWeight: FontWeight.w700,
                          ),),
                        ],
                      ),
                      SizedBox(height: 10.h,),
                      Divider(
                        color: Color(0xffAFE0FF),
                        thickness: 1,
                      ),
                      SizedBox(height: 10.h,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("Account number",style: TextStyle(
                            color: Palette.baseElementDark,
                            fontSize: 16.sp,
                            fontWeight: FontWeight.w700,
                          ),),
                          Text("895 ***** 68789",style: TextStyle(
                            color: Palette.blue,
                            fontSize: 16.sp,
                            fontWeight: FontWeight.w700,
                          ),),
                        ],
                      ),
                      SizedBox(height: 10.h,),
                      Divider(
                        color: Color(0xffAFE0FF),
                        thickness: 1,
                      ),
                      SizedBox(height: 10.h,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("Available balance",style: TextStyle(
                            color: Palette.baseElementDark,
                            fontSize: 16.sp,
                            fontWeight: FontWeight.w700,
                          ),),
                          Text("\$3,456,897",style: TextStyle(
                            color: Palette.blue,
                            fontSize: 16.sp,
                            fontWeight: FontWeight.w700,
                          ),),
                        ],
                      ),

                    ],
                  ),
                ),
              ),
            ),
            SizedBox(height: 10.h,),
            Divider(
              color: Color(0xffDEDEDE),
              thickness: 1,
            ),
            SizedBox(height: 10.h,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Recent Transactions",style: TextStyle(
                  color: Palette.baseElementDark,
                  fontSize: 20.sp,
                  fontWeight: FontWeight.w700,
                ),),
                Text("See all",style: TextStyle(
                  color: Palette.blue,
                  fontSize: 15.sp,
                  fontWeight: FontWeight.w700,
                ),),
              ],
            ),
            SizedBox(height: 20.h,),
         Center(
           child: Container(
             height: 252.h,
             width: 380.w,
             decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
               color: Palette.lightBlue,
             ),
             child: ListView.builder(
               physics: BouncingScrollPhysics(),
               scrollDirection: Axis.vertical,
               shrinkWrap: true,
               itemCount: containerDataList.length,
               itemBuilder: (BuildContext context, int index) {

                 Color amountColor;
                 if (containerDataList[index].amount.startsWith('-')) {
                   amountColor = Palette.red;
                 } else if (containerDataList[index].amount.startsWith('+')) {
                   amountColor = Colors.green;
                 } else {
                   amountColor = Colors.black;
                 }
                 return Container(
                   height: 80.h,
                   width: 90.w,
                   child: Column(
                     children: [
                       Row(
                         mainAxisAlignment: MainAxisAlignment.start,
                         crossAxisAlignment: CrossAxisAlignment.start,
                         children: [
                           Padding(
                             padding:  EdgeInsets.all(8.0),
                             child: SvgPicture.asset(
                               containerDataList[index].image,
                               height: 56.h,
                               width: 56.w,
                             ),
                           ),
                           Padding(
                             padding: EdgeInsets.only(left: 10.w,top: 10.w),
                             child: Column(
                               crossAxisAlignment: CrossAxisAlignment.start,
                               children: [
                                 Row(
                                   children: [
                                     Text(

                                       containerDataList[index].text,
                                       style: TextStyle(fontSize: 16.sp,fontWeight: FontWeight.w700,color: Palette.baseElementDark),
                                       maxLines: 2,
                                       overflow: TextOverflow.ellipsis,
                                     ),
                                       SizedBox(width: 100.w,),
                                     Text(

                                       containerDataList[index].amount,style: TextStyle(fontSize: 16.sp,color: amountColor,fontWeight: FontWeight.w700),
                                       maxLines: 2,
                                       overflow: TextOverflow.ellipsis,
                                     ),
                                   ],
                                 ),
                                 SizedBox(height: 10.h,),
                                 Text(
                                     containerDataList[index].time,
                                     style: TextStyle(color: Palette.baseGrey,fontSize: 15.sp)),

                               ],
                             ),
                           ),

                         ],
                       ),
                       Padding(
                         padding:  EdgeInsets.only(left: 20.w,right: 20.w),
                         child: Divider(thickness: 1,height: 1.h,color: Color(0xffAFE0FF),),
                       ),
                     ],
                   ),
                 );
               },
             ),
           ),
         ),
          ],
        ),
      ),
      ),
    );
  }
}
