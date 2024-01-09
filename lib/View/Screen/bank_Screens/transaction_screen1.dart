import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:plaid_flutter/plaid_flutter.dart';
import 'package:provider/provider.dart';
import 'package:http/http.dart' as http;
import '../../../Theme/Palette/palette.dart';
import '../../../Theme/theme_manager.dart';

class ContainerData {
  final String image;
  final String text;
  final String time;
  final String amount;

  ContainerData({required this.image, required this.text,required this.time,required this.amount});
}

List<ContainerData> containerDataList = [
  ContainerData(
    image:'assets/icons/hancock.png',
    text: 'Hancock Property',
    amount: "-\$1,000",
    time: "3 Dec, 2022",
  ),
  ContainerData(
    image:'assets/icons/hancock.png',
    text: 'Hancock Property',
    amount: "-\$1,000",
    time: "3 Dec, 2022",
  ),
  ContainerData(
    image:'assets/icons/hancock.png',
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
  Future<String> fetchLinkToken(String clientUserId) async {
    final response = await http.post(
      Uri.parse('https://sandbox.plaid.com/link/token/create'),
      headers: <String, String>{
        'Content-Type': 'application/json',
        'Plaid-Client-ID': '64c8e897e39b6a00137acfff',
        'Plaid-Secret': 'f347f202de237c8ed27aeba4b23d2f',

      },
      body: jsonEncode(<String, dynamic>{
        "user": {"client_user_id": clientUserId},
        'client_id': '64c8e897e39b6a00137acfff',
        'secret': 'f347f202de237c8ed27aeba4b23d2f',
        'client_name': 'Your App Name',
        'products': ['transactions','auth'],
        'country_codes': ['US'],
        'language': 'en',
      }),
    );

    if (response.statusCode == 200) {

      final Map<String, dynamic> data = jsonDecode(response.body);
      print("Response body: ${response.body}");
      return data['link_token'];
    } else {
      print('Error fetching link token: ${response.statusCode}');
      print('Response body: ${response.body}');
      throw Exception('Failed to load link token');
    }
  }
  LinkConfiguration? _configuration;
  StreamSubscription<LinkEvent>? _streamEvent;
  StreamSubscription<LinkExit>? _streamExit;
  StreamSubscription<LinkSuccess>? _streamSuccess;
  LinkObject? _successObject;
  @override
  void initState() {
    super.initState();

    _streamEvent = PlaidLink.onEvent.listen(_onEvent);
    _streamExit = PlaidLink.onExit.listen(_onExit);
    _streamSuccess = PlaidLink.onSuccess.listen(_onSuccess);
  }

  @override
  void dispose() {
    _streamEvent?.cancel();
    _streamExit?.cancel();
    _streamSuccess?.cancel();
    super.dispose();
  }

  void _openPlaidLink() async {
    final linkToken = await fetchLinkToken('64c8e897e39b6a00137acfff');
    setState(() {
      _configuration = LinkTokenConfiguration(
        token: linkToken,
      );
    });

    if (_configuration != null) {
      PlaidLink.open(configuration: _configuration!);
    }
  }
  void _onEvent(LinkEvent event) {
    final name = event.name;
    final metadata = event.metadata.description();
    print("onEvent: $name, metadata: $metadata");
  }

  void _onSuccess(LinkSuccess event) {
    final token = event.publicToken;
    final metadata = event.metadata.description();
    print("onSuccess: $token, metadata: $metadata");
    setState(() => _successObject = event);
  }

  void _onExit(LinkExit event) {
    final metadata = event.metadata.description();
    final error = event.error?.description();
    print("onExit metadata: $metadata, error: $error");
  }
  @override
  Widget build(BuildContext context) {
    final themeManager = Provider.of<ThemeManager>(context);
    final isDarkMode = themeManager.themeMode == ThemeMode.dark;
    ScreenUtil.init(context, designSize: const Size(428, 926));
    return Scaffold(
      backgroundColor: isDarkMode ? Palette.darkBackground : Palette.baseBackground,
      body: SafeArea(child:
      Padding(
        padding:  EdgeInsets.only(left: 15.w,right: 15.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 20.h,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Bank Account Info",style: TextStyle(
                  color:isDarkMode ? Palette.darkWhite : Palette.baseElementDark,
                  fontSize: 28.sp,
                  fontWeight: FontWeight.w700,
                ),),
                GestureDetector(
                    onTap: _openPlaidLink,
                    child: Image.asset("assets/icons/plus.png",height: 46.h,width: 46.w,)),
              ],
            ),
            SizedBox(height: 10.h,),
            Divider(
              color:isDarkMode? Color(0xff404550): Color(0xffDEDEDE),
              thickness: 1,
            ),
            SizedBox(height: 10.h,),
            Text("Bank Account One",style: TextStyle(
              color:isDarkMode ? Palette.darkWhite : Palette.baseElementDark,
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
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("Account holder name",style: TextStyle(
                            color:isDarkMode ? Palette.darkWhite : Palette.baseElementDark,
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

                      Divider(
                        color: isDarkMode? Color(0xff404550):  Color(0xffAFE0FF),
                        thickness: 1,
                      ),

                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("Account number",style: TextStyle(
                            color:isDarkMode ? Palette.darkWhite : Palette.baseElementDark,
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

                      Divider(
                        color: isDarkMode? Color(0xff404550):  Color(0xffAFE0FF),
                        thickness: 1,
                      ),

                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("Available balance",style: TextStyle(
                            color:isDarkMode ? Palette.darkWhite : Palette.baseElementDark,
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
              color: isDarkMode? Color(0xff404550):Color(0xffDEDEDE),
              thickness: 1,
            ),
            SizedBox(height: 10.h,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Recent Transactions",style: TextStyle(
                  color:isDarkMode ? Palette.darkWhite : Palette.baseElementDark,
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
              borderRadius: BorderRadius.circular(10),
               color:isDarkMode ? Palette.container : Palette.lightBlue,
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
                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                     children: [
                       Row(

                         children: [
                           Padding(
                             padding:  EdgeInsets.all(8.0),
                             child: Image.asset(
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
                                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                   children: [
                                     Text(

                                       containerDataList[index].text,
                                       style: TextStyle(fontSize: 16.sp,fontWeight: FontWeight.w700,
                                           color: isDarkMode ? Palette.darkWhite :  Palette.baseElementDark
                                       ),
                                       maxLines: 2,
                                       overflow: TextOverflow.ellipsis,
                                     ),
                                   SizedBox(width: 70.w,),
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
                                     style: TextStyle(
                                         color:isDarkMode ? Palette.hintText : Palette.baseGrey,
                                         fontSize: 15.sp)),

                               ],
                             ),
                           ),

                         ],
                       ),
                       Padding(
                         padding:  EdgeInsets.only(left: 20.w,right: 20.w),
                         child: Divider(thickness: 1,height: 1.h,
                           color:isDarkMode? Color(0xff404550): Color(0xffAFE0FF),
                         ),
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
