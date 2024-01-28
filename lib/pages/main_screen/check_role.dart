import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:frontend_aps/pages/teacher/pages/t_dashboard_screen.dart';
import 'package:frontend_aps/pages/student/pages/s_check_point_screen.dart';
import 'package:frontend_aps/pages/student/pages/s_dashboard_screen.dart';
import 'package:frontend_aps/pages/teacher/pages/t_violation_screen.dart';
import '../../../../bloc/getUser/get_user_bloc.dart';
import '../../../../common/constant/aps_color.dart';
import '../../common/constant/list_bottom_navigation.dart';
import '../profile/profile_screen.dart';
import 'default_main_screen.dart';

class CheckRole extends StatefulWidget {
  const CheckRole({super.key});

  @override
  State<CheckRole> createState() => _CheckRoleState();
}

class _CheckRoleState extends State<CheckRole> {
  final _siswaScreens = [
    const SiswaDashboardScreen(),
    const CheckPointScreen(hideTitle: true),
    const ProfileScreen(),
  ];
  final _guruScreens = [
    const GuruDashboardScreen(),
    const ViolationScreen(hideTitleV: true),
    const ProfileScreen(),
  ];

  @override
  void initState() {
    super.initState();
    context.read<GetUserBloc>().add(const GetUserEvent.getProfile());
    log("Get User Api..");
  }

  int currentPageIndex = 0;
  NavigationDestinationLabelBehavior labelBehavior =
      NavigationDestinationLabelBehavior.alwaysHide;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GetUserBloc, GetUserState>(
      builder: (context, state) {
        return state.maybeWhen(
          loading: () {
            return const DefaultMainScreen();
          },
          loaded: (data) {
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
                  destinations: ListBottomNavigation().defaultBottomNavigasi,
                ),
                body: IndexedStack(
                  index: currentPageIndex,
                  children: data.data!.roles == '6' || data.data!.roles == '7'
                      ? _siswaScreens
                      : _guruScreens,
                ),
              ),
            );
          },
          // error: (message) => Center(child: Text(message)),
          error: (message) => const DefaultMainScreen(),
          orElse: () {
            return const DefaultMainScreen();
          },
        );
      },
    );
  }
}
