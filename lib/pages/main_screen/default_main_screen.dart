import 'package:flutter/material.dart';
import '../../common/constant/utils.dart';
import '../../common/constant/list_bottom_navigation.dart';
import 'pages/load_dashboard.dart';
import 'pages/load_profile.dart';

class DefaultMainScreen extends StatefulWidget {
  const DefaultMainScreen({super.key});

  @override
  State<DefaultMainScreen> createState() => _DefaultMainScreenState();
}

class _DefaultMainScreenState extends State<DefaultMainScreen> {
  final _screens = [
    const LoadingDashboard(),
    const LoadingProfile(),
    const LoadingProfile(),
  ];

  int currentPageIndex = 0;
  NavigationDestinationLabelBehavior labelBehavior =
      NavigationDestinationLabelBehavior.alwaysHide;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
        destinations: ListBottomNavigation().defaultBottomNavigasi,
      ),
      body: SafeArea(
        child: IndexedStack(
          index: currentPageIndex,
          children: _screens,
        ),
      ),
    );
  }
}
