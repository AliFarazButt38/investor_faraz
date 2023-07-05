import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:investor_flutter/View/Screen/home_screens/dashboard_screen.dart';
import 'package:investor_flutter/View/Screen/home_screens/home_screen.dart';
import 'package:investor_flutter/View/Screen/profile_screens/personal_profile_infoScreen.dart';
import 'package:investor_flutter/View/Screen/profile_screens/profile_screen.dart';

import '../../../Theme/Palette/palette.dart';
import '../home_screens/wealth_calculatorScreen.dart';

class NavigationBottom extends StatefulWidget {
  const NavigationBottom({Key? key}) : super(key: key);

  @override
  State<NavigationBottom> createState() => _NavigationBottomState();
}

class _NavigationBottomState extends State<NavigationBottom> {
  int _selectedIndex = 0;
  static  List<Widget> _widgetOptions = <Widget>[
    HomeScreen(),
    WealthCalculatorScreen(),
    DashboardScreen(),
   ProfilePage()
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Palette.baseBackground,
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Palette.lightBlue,
        showSelectedLabels: true, // Show labels for all tabs
        showUnselectedLabels: true,
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Column(
              children: [
                Container(
                  height: 5, // Height of the line
                  width: 50, // Width of the line
                  decoration: BoxDecoration(
                    color: _selectedIndex == 0 ? Palette.blue : Colors.transparent,
                    borderRadius: BorderRadius.only(
                      bottomLeft:Radius.circular(10),
                      bottomRight: Radius.circular(10),
                    ),
                  ),

                  margin: EdgeInsets.only(bottom: 9), // Space between icon and line
                ),
                SvgPicture.asset(
                  'assets/icons/home.svg',
                  semanticsLabel: 'Acme Logo',
                  color: _selectedIndex == 0 ? Palette.blue : null,
                ),
              ],
            ),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Column(
              children: [
                Container(
                  height: 5, // Height of the line
                  width: 50, // Width of the line
                  decoration: BoxDecoration(
                    color: _selectedIndex == 1 ? Palette.blue : Colors.transparent,
                    borderRadius: BorderRadius.only(
                      bottomLeft:Radius.circular(10),
                      bottomRight: Radius.circular(10),
                    ),
                  ),

                  margin: EdgeInsets.only(bottom: 9), // Space between icon and line
                ),
                SvgPicture.asset(
                  'assets/icons/simulate.svg',
                  semanticsLabel: 'Acme Logo',
                  color: _selectedIndex == 1 ? Palette.blue : Palette.baseGrey,
                ),
              ],
            ),
            label: 'Simulate',
          ),
          BottomNavigationBarItem(
            icon: Column(
              children: [
                Container(
                  height: 5, // Height of the line
                  width: 50, // Width of the line
                  decoration: BoxDecoration(
                    color: _selectedIndex == 2 ? Palette.blue : Colors.transparent,
                    borderRadius: BorderRadius.only(
                      bottomLeft:Radius.circular(10),
                      bottomRight: Radius.circular(10),
                    ),
                  ),

                  margin: EdgeInsets.only(bottom: 9), // Space between icon and line
                ),
                SvgPicture.asset(
                  'assets/icons/dashboard.svg',
                  semanticsLabel: 'Acme Logo',
                  color: _selectedIndex == 2 ? Palette.blue : null,
                ),
              ],
            ),
            label: 'Dashboard',
          ),
          BottomNavigationBarItem(
            icon: Column(
              children: [
                Container(
                  height: 5, // Height of the line
                  width: 50, // Width of the line
                  decoration: BoxDecoration(
                    color: _selectedIndex == 3 ? Palette.blue : Colors.transparent,
                    borderRadius: BorderRadius.only(
                      bottomLeft:Radius.circular(10),
                      bottomRight: Radius.circular(10),
                    ),
                  ),

                  margin: EdgeInsets.only(bottom: 9), // Space between icon and line
                ),
                SvgPicture.asset(
                  'assets/icons/profileIcon.svg',
                  semanticsLabel: 'Acme Logo',
                  color: _selectedIndex == 3 ? Palette.blue : null,
                ),
              ],
            ),
            label: 'Profile',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Palette.blue,
        unselectedItemColor: Palette.baseGrey,
        onTap: _onItemTapped,
      ),
    );
  }
}
