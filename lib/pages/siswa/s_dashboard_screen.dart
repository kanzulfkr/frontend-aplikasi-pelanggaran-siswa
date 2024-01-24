import 'package:flutter/material.dart';
import 'package:frontend_aps/common/constant/aps_theme.dart';
import 'widget/d_card_menu.dart';

class SiswaDashboardScreen extends StatelessWidget {
  const SiswaDashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final primaryTextTheme = Theme.of(context).primaryTextTheme;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: ListView(
          children: [
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Menu Siswa',
                  style: primaryTextTheme.displayMedium,
                ),
                const Icon(
                  Icons.notifications_rounded,
                  color: SiakadTheme.primaryColor,
                  size: 30,
                ),
              ],
            ),
            const SizedBox(height: 20),
            TextFormField(
              decoration: const InputDecoration(
                hintText: 'Cari di sini',
                hintStyle:
                    TextStyle(color: SiakadTheme.grey, letterSpacing: 0.4),
                filled: true,
                fillColor: SiakadTheme.secondaryColor,
                border: OutlineInputBorder(
                  borderSide: BorderSide.none,
                  borderRadius: BorderRadius.all(
                    Radius.circular(30),
                  ),
                ),
                prefixIcon: Icon(Icons.search_sharp),
                prefixIconColor: SiakadTheme.grey,
              ),
            ),
            const SizedBox(height: 80),
            CardMenu(
              primaryTextTheme: primaryTextTheme,
              image: 'khs',
              name1: 'Lihat Poin',
              name2: 'Pelanggaran',
              color: SiakadTheme.dashboard1,
            ),
            const SizedBox(height: 30),
            CardMenu(
              primaryTextTheme: primaryTextTheme,
              image: 'matkul',
              name1: 'Lihat Detail',
              name2: 'Pelanggaran',
              color: SiakadTheme.dashboard2,
            ),
          ],
        ),
      ),
    );
  }
}
