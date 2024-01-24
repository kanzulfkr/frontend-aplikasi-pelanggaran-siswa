import 'package:flutter/material.dart';
import 'package:frontend_aps/common/constant/aps_theme.dart';

import 'g_dashboard_screen.dart';
import 'g_profile_screen.dart';

class GuruMainScreen extends StatefulWidget {
  const GuruMainScreen({super.key});

  @override
  State<GuruMainScreen> createState() => _GuruMainScreenState();
}

class _GuruMainScreenState extends State<GuruMainScreen> {
  final _screens = [
    const GuruDashboardScreen(),
    const GuruProfileScreen(),
    const GuruProfileScreen(),
  ];

  int currentPageIndex = 0;
  NavigationDestinationLabelBehavior labelBehavior =
      NavigationDestinationLabelBehavior.alwaysHide;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        bottomNavigationBar: NavigationBar(
          backgroundColor: SiakadTheme.white,
          labelBehavior: labelBehavior,
          selectedIndex: currentPageIndex,
          onDestinationSelected: (int index) {
            setState(() {
              currentPageIndex = index;
            });
          },
          destinations: const <Widget>[
            NavigationDestination(
              selectedIcon: Icon(
                Icons.home_filled,
                color: SiakadTheme.primaryColor,
              ),
              icon: Icon(
                Icons.home_filled,
                color: SiakadTheme.grey,
              ),
              label: 'Dashboard',
            ),
            NavigationDestination(
              selectedIcon: Icon(
                Icons.insert_chart_outlined,
                color: SiakadTheme.primaryColor,
              ),
              icon: Icon(
                Icons.insert_chart_outlined,
                color: SiakadTheme.grey,
              ),
              label: 'College',
            ),
            NavigationDestination(
              selectedIcon: Icon(
                Icons.person,
                color: SiakadTheme.primaryColor,
              ),
              icon: Icon(
                Icons.person,
                color: SiakadTheme.grey,
              ),
              label: 'Profile',
            ),
          ],
        ),
        body: IndexedStack(
          index: currentPageIndex,
          children: _screens,
        ),
      ),
    );
  }
}
