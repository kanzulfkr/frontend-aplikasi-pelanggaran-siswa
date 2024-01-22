import 'package:flutter/material.dart';
import 'package:frontend_aps/utils/aps_theme.dart';
import 'widget/card_menu.dart';

class DashboardPage extends StatelessWidget {
  const DashboardPage({super.key});

  @override
  Widget build(BuildContext context) {
    final primaryTextTheme = Theme.of(context).primaryTextTheme;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 50),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Perkuliahan',
                  style: primaryTextTheme.displayMedium,
                ),
                const Icon(
                  Icons.notifications_rounded,
                  color: SiakadTheme.primaryColor,
                  size: 30,
                ),
              ],
            ),
            const Spacer(flex: 2),
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
            const Spacer(flex: 3),
            CardMenu(
              primaryTextTheme: primaryTextTheme,
              image: 'khs',
              name1: 'Validasi',
              name2: 'Pelanggaran',
              color: SiakadTheme.dashboard1,
            ),
            const Spacer(flex: 3),
            CardMenu(
              primaryTextTheme: primaryTextTheme,
              image: 'matkul',
              name1: 'Tambah',
              name2: 'Pelanggaran',
              color: SiakadTheme.dashboard2,
            ),
            const Spacer(flex: 3),
            CardMenu(
              primaryTextTheme: primaryTextTheme,
              image: 'jadwal',
              name1: 'Cetak Laporan',
              name2: 'Pelanggaran',
              color: SiakadTheme.dashboard3,
            ),
          ],
        ),
      ),
    );
  }
}
