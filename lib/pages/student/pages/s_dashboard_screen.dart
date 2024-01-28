import 'package:flutter/material.dart';
import '../../../common/constant/aps_color.dart';
import '../../../common/widget/dashboard_card_menu.dart';
import 's_check_point_screen.dart';
import 's_detail_violation_screen.dart';

class SiswaDashboardScreen extends StatelessWidget {
  const SiswaDashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        child: ListView(
          children: [
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Aplikasi Pelanggaran Siswa',
                  style: TextStyle(
                    color: ApsColor.black,
                    fontSize: 20,
                    fontWeight: FontWeight.w700,
                    fontFamily: '',
                  ),
                ),
                Icon(
                  Icons.notifications_rounded,
                  color: ApsColor.primaryColor,
                  size: 30,
                ),
              ],
            ),
            const SizedBox(height: 20),
            TextFormField(
              decoration: const InputDecoration(
                hintText: 'Cari di sini',
                hintStyle: TextStyle(color: ApsColor.grey, letterSpacing: 0.4),
                filled: true,
                fillColor: ApsColor.secondaryColor,
                border: OutlineInputBorder(
                  borderSide: BorderSide.none,
                  borderRadius: BorderRadius.all(
                    Radius.circular(20),
                  ),
                ),
                prefixIcon: Icon(Icons.search_sharp),
                prefixIconColor: ApsColor.grey,
              ),
            ),
            const SizedBox(height: 80),
            CardMenu(
              image: 'khs',
              firstTitle: 'Lihat Akumulasi',
              secondTitle: 'Poin Siswa',
              color: ApsColor.dashboard1,
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) =>
                          const CheckPointScreen(hideTitle: false)),
                );
              },
            ),
            const SizedBox(height: 30),
            CardMenu(
              image: 'matkul',
              firstTitle: 'Lihat Detail',
              secondTitle: 'Pelanggaran',
              color: ApsColor.dashboard2,
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const DetailSiswaViolationScreen()),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
