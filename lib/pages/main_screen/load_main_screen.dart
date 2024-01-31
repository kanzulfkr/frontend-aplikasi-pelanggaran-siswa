import 'package:flutter/material.dart';
import 'package:frontend_aps/pages/main_screen/pages/load_violation.dart';
import 'package:liquid_pull_to_refresh/liquid_pull_to_refresh.dart';
import '../../common/constant/utils.dart';
import '../../common/constant/list_bottom_navigation.dart';
import 'check_role.dart';
import 'pages/load_dashboard.dart';
import 'pages/load_profile.dart';

class LoadingMainScreen extends StatefulWidget {
  const LoadingMainScreen({super.key});

  @override
  State<LoadingMainScreen> createState() => _LoadingMainScreenState();
}

class _LoadingMainScreenState extends State<LoadingMainScreen> {
  final _screens = [
    const LoadingDashboard(),
    const LoadingViolation(hideTitlev: false),
    const LoadingProfile(),
  ];

  int currentPageIndex = 0;
  NavigationDestinationLabelBehavior labelBehavior =
      NavigationDestinationLabelBehavior.alwaysHide;

  Future<void> _handleRefresh() async {
    await Future.delayed(const Duration(seconds: 2));
    if (context.mounted) {
      Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(
          builder: (context) => const CheckRole(),
        ),
        (Route<dynamic> route) => false,
      );
    }
  }

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
        child: LiquidPullToRefresh(
          height: 70,
          onRefresh: _handleRefresh,
          color: ApsColor.primaryColor,
          animSpeedFactor: 4,
          springAnimationDurationInMilliseconds: 800,
          showChildOpacityTransition: false,
          child: IndexedStack(
            index: currentPageIndex,
            children: _screens,
          ),
        ),
      ),
    );
  }
}
