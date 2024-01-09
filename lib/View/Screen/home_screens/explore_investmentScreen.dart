import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:investor_flutter/Provider/propertyProvider.dart';
import 'package:investor_flutter/View/Screen/home_screens/property_infoScreen.dart';
import 'package:provider/provider.dart';

import '../../../Model/property_model.dart';
import '../../../Theme/Palette/palette.dart';
import '../../../Theme/theme_manager.dart';

class ExploreInvestmentScreen extends StatefulWidget {
  const ExploreInvestmentScreen({Key? key}) : super(key: key);

  @override
  State<ExploreInvestmentScreen> createState() => _ExploreInvestmentScreenState();
}

class _ExploreInvestmentScreenState extends State<ExploreInvestmentScreen> {
  int selectedIndex = 0;
  bool showAllProperties = true;
  List<PropertyModel> filteredProperties = [];
  @override
  void initState() {
    super.initState();
    Provider.of<PropertyInfoProvider>(context, listen: false).getPropertyData();
    Provider.of<PropertyInfoProvider>(context,listen: false).fetchCategories();
    showAllProperties=true;
    selectedIndex=-1;
    filteredProperties = Provider.of<PropertyInfoProvider>(context, listen: false).propertyList;
  }

  @override
  Widget build(BuildContext context) {
    final themeManager = Provider.of<ThemeManager>(context);
    final isDarkMode = themeManager.themeMode == ThemeMode.dark;
    final propertyProvider = Provider.of<PropertyInfoProvider>(context);
    ScreenUtil.init(context, designSize: const Size(428, 926));
    List<PropertyBundle> propertyBundles = [
      PropertyBundle(
        imageAsset: "assets/images/newEurope.png",
        bundleType: "Regional Bundle",
        lockType: "Private",
        location: "Europe",
        description: "investments across all currently available and future property bundles in Europe.",
        investmentStart: "Investments start from 3,879 USD",
      ),
      PropertyBundle(
        imageAsset: "assets/images/newgreece.png",
        bundleType: "Agency Bundle",
        lockType: "Public",
        location: "Greece",
        description: "investments across all currently available and future property bundles in Europe.",
        investmentStart: "Investments start from 1,000 USD",
      ),
    ];
    return Scaffold(
      backgroundColor: isDarkMode ? Palette.darkBackground : Palette.baseBackground,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.only(left: 15.w, right: 15.w),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 20.h),
                Row(
                  children: [
                    isDarkMode
                        ? GestureDetector(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: Image.asset(
                        "assets/icons/darkBack.png",
                        height: 46.h,
                        width: 46.w,
                      ),
                    )
                        : GestureDetector(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: Image.asset(
                        "assets/icons/goBack.png",
                        height: 46.h,
                        width: 46.w,
                      ),
                    ),
                    SizedBox(width: 20.w),
                    Text(
                      "Explore Investment",
                      style: TextStyle(
                          color: isDarkMode ? Palette.darkWhite : Palette.baseElementDark,
                          fontSize: 28.sp,
                          fontWeight: FontWeight.w700),
                    )
                  ],
                ),
                SizedBox(height: 10.h),
                Divider(
                  color: isDarkMode ? Color(0xff404550) : Color(0xffDEDEDE),
                  thickness: 1,
                ),
                SizedBox(height: 10.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    isDarkMode
                        ? Image.asset(
                      "assets/icons/darkCategories.png",
                      height: 24.h,
                      width: 24.w,
                    )
                        : Image.asset(
                      "assets/icons/categories.png",
                      height: 24.h,
                      width: 24.w,
                    ),
                    SizedBox(width: 8),
                    Text(
                      "Categories",
                      style: TextStyle(
                        fontWeight: FontWeight.w700,
                        fontSize: 18,
                        color: isDarkMode ? Palette.darkWhite : Palette.baseElementDark,
                      ),
                    ),
                    Spacer(),
                    Text(
                      "More",
                      style: TextStyle(
                        color: Palette.blue,
                        fontSize: 16,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 20.h),
                SizedBox(
                  height: 44.h, // Set the desired height
                  child: ListView.separated(
                    scrollDirection: Axis.horizontal,
                    separatorBuilder: (BuildContext context, int index) => SizedBox(width: 10.w),
                    itemCount: propertyProvider.categories.length + 1, // Add 1 for "All Properties"
                    itemBuilder: (BuildContext context, int index) {
                      final isSelected = (showAllProperties && index == 0) || (!showAllProperties && selectedIndex == index - 1);
                      return GestureDetector(
                        onTap: () {
                          setState(() {
                            if (index == 0) {
                              showAllProperties = true;
                              selectedIndex = -1; // Set selectedIndex to -1 to indicate "All Properties"
                            }
                            else {
                              showAllProperties = false;
                              selectedIndex = index - 1; // Adjust index for non-"All Properties" categories
                              filteredProperties = propertyProvider.propertyList
                                  .where((property) => property.category == propertyProvider.categories[selectedIndex])
                                  .toList();
                            }
                          });
                        },
                        child: Container(
                          width: 161.w,
                          height: 44.h,
                          decoration: BoxDecoration(
                            color: isSelected ? (isDarkMode ? Colors.black : Palette.lightBlue) : (isDarkMode ? Colors.black : Color(0xffF4F4F4)),
                            borderRadius: BorderRadius.circular(15),
                            border: Border.all(
                              color: isSelected ? (isDarkMode ? Palette.blue : Palette.blue) : (isDarkMode ? Color(0xff404550) : Color(0xffDEDEDE)),
                            ),
                          ),
                          alignment: Alignment.center,
                          child: Text(
                            // index == 0 ? "All Properties" : index == 1 ? "Urban" : "Sage Neighborhood",
                            index == 0 ? "All Properties" : propertyProvider.categories[index - 1],
                            style: TextStyle(
                              color: isSelected ? (isDarkMode ? Palette.blue : Palette.blue) : (isDarkMode ? Palette.hintText : Palette.baseGrey),
                              fontWeight: isSelected ? FontWeight.w700 : FontWeight.w400,
                              fontSize: 16.sp,
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
                Consumer<PropertyInfoProvider>(
                  builder: (context, propertyInfo, _) {
                    List<PropertyModel> propertyList = propertyInfo.propertyList;
                    if (selectedIndex >= 0 && selectedIndex < propertyProvider.categories.length) {
                      final selectedCategory = propertyProvider.categories[selectedIndex];
                      propertyList = propertyList.where((property) => property.category == selectedCategory).toList();
                    }

                    return ListView.builder(
                      itemCount: propertyList.length,
                      shrinkWrap: true,
                      scrollDirection: Axis.vertical,
                      physics: BouncingScrollPhysics(),
                      itemBuilder: (context, index) {
                        PropertyModel property = propertyList[index];
                        return Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(height: 20.h),
                            Image.asset(
                                 propertyBundles[0].imageAsset,
                                // property.sliderImage![0]
                            ),
                            SizedBox(height: 10.h),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  property.bundle,
                                  style: TextStyle(
                                    color: isDarkMode ? Palette.hintText : Palette.baseGrey,
                                    fontSize: 16.sp,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                                Container(
                                  height: 34.h,
                                  width: 100.w,
                                  decoration: BoxDecoration(
                                    color: isDarkMode ? Palette.container : Palette.lightBlue,
                                    borderRadius: BorderRadius.circular(15),
                                  ),
                                  alignment: Alignment.center,
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      SvgPicture.asset("assets/icons/private_lock.svg", height: 16.h, width: 16.w),
                                      Text(
                                        "Private",
                                        style: TextStyle(
                                          color: Palette.blue,
                                          fontWeight: FontWeight.w400,
                                          fontSize: 16.sp,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: 10.h),
                            Text(
                              property.country,
                              style: TextStyle(
                                  color: isDarkMode ? Palette.darkWhite : Palette.baseElementDark,
                                  fontSize: 24.sp,
                                  fontWeight: FontWeight.w700),
                            ),
                            SizedBox(height: 10.h),
                            Text(
                              "investments across all currently available and future property bundles in Europe.",
                              style: TextStyle(
                                color: isDarkMode ? Palette.hintText : Palette.baseGrey,
                                fontSize: 16.sp,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                            SizedBox(height: 10.h),
                            Text(
                              "Investments start from ${property.investPrice} USD",
                              style: TextStyle(
                                  color: isDarkMode ? Palette.darkWhite : Palette.baseElementDark,
                                  fontSize: 20.sp,
                                  fontWeight: FontWeight.w700),
                            ),
                            SizedBox(height: 15.h),
                            Center(
                              child: SizedBox(
                                width: 380.w,
                                height: 52.h,
                                child: ElevatedButton(
                                  onPressed: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => PropertyInfoScreen(propertyModel: propertyInfo.propertyList[index]),
                                      ),
                                    );
                                  },
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        "Invest Now",
                                        style: TextStyle(
                                          color: Palette.baseWhite,
                                          fontWeight: FontWeight.w700,
                                          fontSize: 18.sp,
                                        ),
                                      ),
                                      SizedBox(width: 10.w),
                                      Image.asset("assets/icons/investNext.png", height: 20.h, width: 20.w),
                                    ],
                                  ),
                                  style: ElevatedButton.styleFrom(
                                    primary: Palette.blue,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(25.0),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(height: 20.h),
                          ],
                        );
                      },
                    );
                  },
                ),
                if (Provider.of<PropertyInfoProvider>(context).isLoading)
                  Center(
                    child: CircularProgressIndicator(), // Loading indicator
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class PropertyBundle {
  final String imageAsset;
  final String bundleType;
  final String lockType;
  final String location;
  final String description;
  final String investmentStart;

  PropertyBundle({
    required this.imageAsset,
    required this.bundleType,
    required this.lockType,
    required this.location,
    required this.description,
    required this.investmentStart,
  });
}
