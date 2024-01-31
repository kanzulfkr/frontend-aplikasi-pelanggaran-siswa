import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../bloc/getUser/get_user_bloc.dart';
import '../../common/constant/aps_color.dart';
import '../profile/profile_screen.dart';
import 'pages/s_check_point_screen.dart';
import 'pages/s_dashboard_screen.dart';

class SiswaMainScreen extends StatefulWidget {
  const SiswaMainScreen({super.key});

  @override
  State<SiswaMainScreen> createState() => _SiswaMainScreenState();
}

class _SiswaMainScreenState extends State<SiswaMainScreen> {
  final _screens = [
    const SiswaDashboardScreen(),
    const CheckPointScreen(hideTitle: true),
    const ProfileScreen(),
  ];

  @override
  void initState() {
    super.initState();
    context.read<GetUserBloc>().add(const GetUserEvent.getProfile());
    log("Get User in SiswaMainScreen");
    // context.read<PointBloc>().add(const PointEvent.getPoint());
    // log("Get Poin Api..");
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
          backgroundColor: const Color.fromARGB(255, 255, 255, 255),
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
                color: Color.fromARGB(255, 131, 143, 159),
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
                color: Color.fromARGB(255, 131, 143, 159),
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
                color: Color.fromARGB(255, 131, 143, 159),
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
