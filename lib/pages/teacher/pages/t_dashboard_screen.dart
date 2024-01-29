import 'package:flutter/material.dart';
import 'package:frontend_aps/common/constant/aps_color.dart';
import 'package:frontend_aps/pages/teacher/pages/t_add_violation_screen.dart';
import 'package:provider/provider.dart';
import '../../../common/widget/dashboard_card_menu.dart';
import '../../../provider/store_violation_provider.dart';
import 't_validation_screen.dart';
import 't_violation_screen.dart';

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
            const SizedBox(height: 20),
            CardMenu(
              image: 'khs',
              firstTitle: 'Validasi',
              secondTitle: 'Pelanggaran',
              color: ApsColor.dashboard1,
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const ValidationScreen(),
                  ),
                );
              },
            ),
            const SizedBox(height: 20),
            CardMenu(
              image: 'matkul',
              firstTitle: 'Tambah',
              secondTitle: 'Pelanggaran',
              color: ApsColor.dashboard2,
              onTap: () {
                final storeProv =
                    Provider.of<StoreViolationProvider>(context, listen: false);
                storeProv.setStudentId(null);
                storeProv.setViolationTypesId(null);
                storeProv.setStudentController('');
                storeProv.setViolationTypesController('');
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const AddViolationScreen(),
                  ),
                );
              },
            ),
            const SizedBox(height: 30),
            CardMenu(
              image: 'jadwal',
              firstTitle: 'Lihat Data',
              secondTitle: 'Pelanggaran',
              color: ApsColor.dashboard3,
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>
                        const ViolationScreen(hideTitleV: false),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
