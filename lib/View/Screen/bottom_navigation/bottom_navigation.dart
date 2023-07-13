import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import 'package:investor_flutter/View/Screen/home_screens/dashboard_screen.dart';
import 'package:investor_flutter/View/Screen/home_screens/explore_investmentScreen.dart';
import 'package:investor_flutter/View/Screen/home_screens/home_screen.dart';
import 'package:investor_flutter/View/Screen/profile_screens/personal_profile_infoScreen.dart';
import 'package:investor_flutter/View/Screen/profile_screens/profile_screen.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';
import 'package:provider/provider.dart';

import '../../../Theme/Palette/palette.dart';
import '../../../Theme/theme_manager.dart';
import '../home_screens/wealth_calculatorScreen.dart';

class NavigationBottom extends StatefulWidget {
  const NavigationBottom({Key? key}) : super(key: key);

  @override
  State<NavigationBottom> createState() => _NavigationBottomState();
}

class _NavigationBottomState extends State<NavigationBottom> {
  int _selectedIndex = 0;
 PersistentTabController? _controller;

  List<Widget> _buildScreens() {
    return [
      HomeScreen(),
      WealthCalculatorScreen(),
      DashboardScreen(),
      ProfilePage(),
    ];
  }

  List<PersistentBottomNavBarItem> _navBarItems() {
    return [
      PersistentBottomNavBarItem(
        icon: _selectedIndex == 0
            ? Column(
          children: [
            SvgPicture.asset(
              'assets/icons/selected_Home.svg',
              semanticsLabel: 'Acme Logo',
              color: Palette.blue,
            ),
            SizedBox(height: 4),
            Text(
              "Home",
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w400,
                color: Palette.blue,
              ),
            ),
          ],
        )
            : Column(
          children: [
            SvgPicture.asset(
              'assets/icons/home.svg',
              semanticsLabel: 'Acme Logo',
              color: Palette.baseGrey,
            ),
            SizedBox(height: 4,),
            Text(
              "Home",
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w400,
                color: Palette.baseGrey,
              ),
            ),
          ],
        ),
      ),
      PersistentBottomNavBarItem(
        icon: _selectedIndex == 1
            ? Column(
          children: [
            SvgPicture.asset(
              'assets/icons/selected_Simulate.svg',
              semanticsLabel: 'Acme Logo',
              color: Palette.blue,
            ),
            SizedBox(height: 4),
            Text(
              "Simulate",
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w400,
                color: Palette.blue,
              ),
            ),
          ],
        )
            : Column(
          children: [
            SvgPicture.asset(
              'assets/icons/simulate.svg',
              semanticsLabel: 'Acme Logo',
              color: Palette.baseGrey,
            ),
            SizedBox(height:4 ,),
            Text(
              "Simulate",
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w400,
                color: Palette.baseGrey,
              ),
            ),
          ],
        ),
      ),
      PersistentBottomNavBarItem(
        icon: _selectedIndex == 2
            ? Column(
          children: [
            SvgPicture.asset(
              'assets/icons/selected_Dashboard.svg',
              semanticsLabel: 'Acme Logo',
              color: Palette.blue,
            ),
            SizedBox(height: 4),
            Text(
              "Dashboard",
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w400,
                color: Palette.blue,
              ),
            ),
          ],
        )
            : Column(
          children: [
            SvgPicture.asset(
              'assets/icons/dashboard.svg',
              semanticsLabel: 'Acme Logo',
              color: Palette.baseGrey,
            ),
            SizedBox(height: 4),
            Text(
              "Dashboard",
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w400,
                color: Palette.baseGrey,
              ),
            ),
          ],
        ),
      ),
      PersistentBottomNavBarItem(
        icon: _selectedIndex == 3
            ? Column(
          children: [
            SvgPicture.asset(
              'assets/icons/selected_profile.svg',
              semanticsLabel: 'Acme Logo',
              color: Palette.blue,
            ),
            SizedBox(height: 4),
            Text(
              "Profile",
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w400,
                color: Palette.blue,
              ),
            ),
          ],
        )
            : Column(
          children: [
            SvgPicture.asset(
              'assets/icons/profileIcon.svg',
              semanticsLabel: 'Acme Logo',
              color: Palette.baseGrey,
            ),
            SizedBox(height: 4),
            Text(
              "Profile",
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w400,
                color: Palette.baseGrey,
              ),
            ),
          ],
        ),
      ),
    ];
  }

  @override
  void initState() {
    super.initState();
    _controller = PersistentTabController(initialIndex: _selectedIndex);
  }

  @override
  Widget build(BuildContext context) {
    final themeManager = Provider.of<ThemeManager>(context);
    final isDarkMode = themeManager.themeMode == ThemeMode.dark;
    return Scaffold(
      body: PersistentTabView(
        context,
        controller: _controller,
        screens: _buildScreens(),
        items: _navBarItems(),
        confineInSafeArea: true,
        backgroundColor:isDarkMode ? Palette.darkBackground : Palette.lightBlue,
        handleAndroidBackButtonPress: true,
        resizeToAvoidBottomInset: true,
        stateManagement: true,
            navBarHeight: 70,
        popAllScreensOnTapOfSelectedTab: true,
        popActionScreens: PopActionScreensType.all,
        itemAnimationProperties: ItemAnimationProperties(
          duration: Duration(milliseconds: 200),
          curve: Curves.ease,
        ),
        screenTransitionAnimation: ScreenTransitionAnimation(
          animateTabTransition: true,
          curve: Curves.ease,
          duration: Duration(milliseconds: 200),
        ),
        navBarStyle: NavBarStyle.style3,
        onItemSelected: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },
      ),
    );
  }
}
