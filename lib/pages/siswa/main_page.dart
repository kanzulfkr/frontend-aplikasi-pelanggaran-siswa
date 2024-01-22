import 'package:flutter/material.dart';
import 'package:frontend_aps/pages/siswa/dashboard_page.dart';
import 'package:frontend_aps/pages/siswa/profile_page.dart';
import 'package:frontend_aps/utils/aps_theme.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  final _screens = [
    const DashboardPage(),
    const ProfilePage(),
    const ProfilePage(),
  ];

  int currentPageIndex = 0;
  NavigationDestinationLabelBehavior labelBehavior =
      NavigationDestinationLabelBehavior.alwaysHide;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
    );
  }
}
