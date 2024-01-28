import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:frontend_aps/common/constant/aps_color.dart';
import 'package:frontend_aps/pages/teacher/pages/t_violation_screen.dart';
import '../../bloc/getUser/get_user_bloc.dart';
import '../profile/profile_screen.dart';
import 'pages/t_dashboard_screen.dart';

class GuruMainScreen extends StatefulWidget {
  const GuruMainScreen({super.key});

  @override
  State<GuruMainScreen> createState() => _GuruMainScreenState();
}

class _GuruMainScreenState extends State<GuruMainScreen> {
  final _screens = [
    const GuruDashboardScreen(),
    const ViolationScreen(hideTitleV: true),
    const ProfileScreen(),
  ];

  @override
  void initState() {
    super.initState();
    context.read<GetUserBloc>().add(const GetUserEvent.getProfile());
    log("Get User in GuruMainScreen");
    // context.read<ViolationBloc>().add(const ViolationEvent.getViolation());
    // log("Get Violation Api..");
  }

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
