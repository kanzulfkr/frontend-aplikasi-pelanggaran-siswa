import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../bloc/getUser/get_user_bloc.dart';
import '../../common/constant/aps_theme.dart';
import '../../common/widget/btn_warning.dart';
import '../siswa/widget/pp_logout_alert_dialog.dart';
import '../siswa/widget/pp_profile_menu.dart';
import 'widget/pp_card_profile.dart';

class GuruProfileScreen extends StatefulWidget {
  const GuruProfileScreen({super.key});

  @override
  State<GuruProfileScreen> createState() => _GuruProfileScreenState();
}

class _GuruProfileScreenState extends State<GuruProfileScreen> {
  @override
  void initState() {
    context.read<GetUserBloc>().add(const GetUserEvent.getProfile());
    log("Get User Api..");
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final primaryTextTheme = Theme.of(context).primaryTextTheme;
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: ListView(
          children: [
            const SizedBox(height: 40),
            GuruCardProfile(primaryTextTheme: primaryTextTheme),
            const SizedBox(height: 20),
            Container(
              padding: const EdgeInsets.all(20),
              width: double.maxFinite,
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.all(
                  Radius.circular(20),
                ),
                color: SiakadTheme.white,
                boxShadow: [
                  BoxShadow(
                    offset: Offset(0, 3),
                    blurRadius: 2,
                    color: SiakadTheme.grey,
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
            const SizedBox(height: 20),
            Container(
              padding: const EdgeInsets.all(20),
              width: double.maxFinite,
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.all(
                  Radius.circular(20),
                ),
                color: SiakadTheme.white,
                boxShadow: [
                  BoxShadow(
                    offset: Offset(0, 3),
                    blurRadius: 2,
                    color: SiakadTheme.grey,
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
            const SizedBox(height: 40),
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
