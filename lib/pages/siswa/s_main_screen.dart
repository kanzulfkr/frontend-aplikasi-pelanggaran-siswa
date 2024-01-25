import 'package:flutter/material.dart';
import 'package:frontend_aps/pages/siswa/widget/point_component.dart';

import '../../common/constant/aps_color.dart';
import '../profile/profile_screen.dart';
import 'pages/s_dashboard_screen.dart';

class SiswaMainScreen extends StatefulWidget {
  const SiswaMainScreen({super.key});

  @override
  State<SiswaMainScreen> createState() => _SiswaMainScreenState();
}

class _SiswaMainScreenState extends State<SiswaMainScreen> {
  final _screens = [
    const SiswaDashboardScreen(),
    const CheckPoinComponent(hideTitle: false),
    const ProfileScreen(),
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
          backgroundColor: ApsColor.white,
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
                color: ApsColor.primaryColor,
              ),
              icon: Icon(
                Icons.home_filled,
                color: ApsColor.grey,
              ),
              label: 'Dashboard',
            ),
            NavigationDestination(
              selectedIcon: Icon(
                Icons.insert_chart_outlined,
                color: ApsColor.primaryColor,
              ),
              icon: Icon(
                Icons.insert_chart_outlined,
                color: ApsColor.grey,
              ),
              label: 'College',
            ),
            NavigationDestination(
              selectedIcon: Icon(
                Icons.person,
                color: ApsColor.primaryColor,
              ),
              icon: Icon(
                Icons.person,
                color: ApsColor.grey,
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
