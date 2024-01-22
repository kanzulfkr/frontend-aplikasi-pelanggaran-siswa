import 'package:flutter/material.dart';
import 'package:frontend_aps/pages/splash/role_screen.dart';
import 'package:frontend_aps/pages/splash/widget/warning_btn.dart';
import 'package:frontend_aps/utils/aps_theme.dart';
import 'widget/profile_menu.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

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
          // mainAxisAlignment: MainAxisAlignment.start,
          // crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 40),
            Container(
              height: 150,
              width: double.maxFinite,
              padding: const EdgeInsets.all(20),
              decoration: const BoxDecoration(
                  color: SiakadTheme.white,
                  borderRadius: BorderRadius.all(
                    Radius.circular(20),
                  ),
                  boxShadow: [
                    BoxShadow(
                      offset: Offset(0, 3),
                      blurRadius: 2,
                      blurStyle: BlurStyle.normal,
                      color: SiakadTheme.grey,
                    ),
                  ]),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Image.asset(
                    'assets/images/profile.png',
                    scale: 2.2,
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        width: 100,
                        height: 30,
                        decoration: BoxDecoration(
                          borderRadius: const BorderRadius.all(
                            Radius.circular(20),
                          ),
                          border: Border.all(
                            width: 1.4,
                            color: SiakadTheme.primaryColor,
                          ),
                        ),
                        child: Center(
                          child: Text(
                            'Siswa',
                            style: primaryTextTheme.bodySmall,
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 160,
                        child: Text(
                          'Muhammad Kanzul Fikri',
                          style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w800,
                              color: SiakadTheme.primaryColor),
                          overflow: TextOverflow.clip,
                        ),
                      ),
                      Text(
                        'Senin, 28 Agustus 2023',
                        style: primaryTextTheme.bodySmall,
                      ),
                    ],
                  )
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
              onPress: () => Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => const RoleScreen()),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
