import 'package:flutter/material.dart';
import 'package:frontend_aps/common/constant/aps_color.dart';
import '../../../common/widget/dashboard_card_menu.dart';

class GuruDashboardScreen extends StatelessWidget {
  const GuruDashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: ListView(
          children: [
            const SizedBox(height: 20),
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Menu Guru',
                  style: TextStyle(
                    color: ApsColor.black,
                    fontSize: 25,
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
                    Radius.circular(30),
                  ),
                ),
                prefixIcon: Icon(Icons.search_sharp),
                prefixIconColor: ApsColor.grey,
              ),
            ),
            const SizedBox(height: 20),
            CardMenu(
              image: 'khs',
              firstTitle: 'Validasi',
              secondTitle: 'Pelanggaran',
              color: ApsColor.dashboard1,
              onTap: () {},
            ),
            const SizedBox(height: 20),
            CardMenu(
              image: 'matkul',
              firstTitle: 'Tambah',
              secondTitle: 'Pelanggaran',
              color: ApsColor.dashboard2,
              onTap: () {},
            ),
            const SizedBox(height: 30),
            CardMenu(
              image: 'jadwal',
              firstTitle: 'Cetak Laporan',
              secondTitle: 'Pelanggaran',
              color: ApsColor.dashboard3,
              onTap: () {},
            ),
          ],
        ),
      ),
    );
  }
}
