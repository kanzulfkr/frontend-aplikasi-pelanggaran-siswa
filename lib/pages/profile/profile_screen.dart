import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../bloc/getUser/get_user_bloc.dart';
import '../../common/constant/aps_color.dart';
import '../../common/widget/btn_warning.dart';
import 'widget/pp_card_profile.dart';
import 'widget/pp_logout_alert_dialog.dart';
import 'widget/pp_profile_menu.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  void initState() {
    context.read<GetUserBloc>().add(const GetUserEvent.getProfile());
    log("Get User Api..");
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: ListView(
          children: [
            const CardProfile(),
            Container(
              padding: const EdgeInsets.all(20),
              margin: const EdgeInsets.only(top: 50, bottom: 20),
              width: double.maxFinite,
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.all(
                  Radius.circular(20),
                ),
                color: ApsColor.white,
                boxShadow: [
                  BoxShadow(
                    offset: Offset(0, 3),
                    blurRadius: 2,
                    color: ApsColor.grey,
                    blurStyle: BlurStyle.normal,
                  )
                ],
              ),
              child: const Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ProfileMenu(
                      iconData: Icons.edit_document,
                      name: 'Edit Informasi Profil',
                      status: ''),
                  SizedBox(height: 15),
                  ProfileMenu(
                      iconData: Icons.notifications,
                      name: 'Notifikasi',
                      status: 'ON'),
                  SizedBox(height: 15),
                  ProfileMenu(
                      iconData: Icons.translate_outlined,
                      name: 'Bahasa',
                      status: 'Indonesia'),
                ],
              ),
            ),
            Container(
              margin: const EdgeInsets.only(bottom: 60),
              padding: const EdgeInsets.all(20),
              width: double.maxFinite,
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.all(
                  Radius.circular(20),
                ),
                color: ApsColor.white,
                boxShadow: [
                  BoxShadow(
                    offset: Offset(0, 3),
                    blurRadius: 2,
                    color: ApsColor.grey,
                    blurStyle: BlurStyle.normal,
                  )
                ],
              ),
              child: const Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ProfileMenu(
                      iconData: Icons.security, name: 'Keamanan', status: ''),
                  SizedBox(height: 15),
                  ProfileMenu(
                      iconData: Icons.dark_mode_outlined,
                      name: 'Tema',
                      status: 'Mode Terang'),
                ],
              ),
            ),
            WarningButton(
              name: 'Logout',
              onPress: () {
                showDialog(
                  context: context,
                  builder: (context) {
                    return const LogoutAlertDialog();
                  },
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
