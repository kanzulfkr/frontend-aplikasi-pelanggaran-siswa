import 'package:flutter/material.dart';
import 'package:frontend_aps/common/widget/skelton.dart';

import '../../../common/constant/aps_color.dart';
import '../../../common/widget/btn_warning.dart';
import '../../profile/widget/pp_logout_alert_dialog.dart';
import '../../profile/widget/pp_profile_menu.dart';

class LoadingProfile extends StatelessWidget {
  const LoadingProfile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: ListView(
          children: [
            const SizedBox(height: 50),
            Container(
              height: 150,
              width: double.maxFinite,
              margin: const EdgeInsets.only(top: 40),
              padding: const EdgeInsets.all(20),
              decoration: const BoxDecoration(
                color: ApsColor.white,
                borderRadius: BorderRadius.all(
                  Radius.circular(20),
                ),
                boxShadow: [
                  BoxShadow(
                    offset: Offset(0, 3),
                    blurRadius: 2,
                    blurStyle: BlurStyle.normal,
                    color: ApsColor.grey,
                  ),
                ],
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                      height: 80,
                      margin: const EdgeInsets.only(right: 20, left: 5),
                      child: const CircleSkeleton(size: 80)),
                  const Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Skelton(height: 25, width: 100),
                      Skelton(height: 25, width: 180),
                      Skelton(height: 25, width: 130),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(height: 0),
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
