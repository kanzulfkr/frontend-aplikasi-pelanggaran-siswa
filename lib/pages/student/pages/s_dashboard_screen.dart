import 'package:flutter/material.dart';
import 'package:liquid_pull_to_refresh/liquid_pull_to_refresh.dart';
import '../../../common/constant/aps_color.dart';
import '../../../common/widget/dashboard_card_menu.dart';
import '../../main_screen/check_role.dart';
import '../../notification/notification_screen.dart';
import 's_check_point_screen.dart';
import 's_detail_violation_screen.dart';

class SiswaDashboardScreen extends StatefulWidget {
  const SiswaDashboardScreen({super.key});

  @override
  State<SiswaDashboardScreen> createState() => _SiswaDashboardScreenState();
}

class _SiswaDashboardScreenState extends State<SiswaDashboardScreen> {
  Future<void> _handleRefresh() async {
    await Future.delayed(const Duration(seconds: 2));
    if (context.mounted) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const CheckRole()),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade50,
      resizeToAvoidBottomInset: false,
      body: LiquidPullToRefresh(
        height: 70,
        onRefresh: _handleRefresh,
        color: ApsColor.primaryColor,
        animSpeedFactor: 4,
        springAnimationDurationInMilliseconds: 800,
        showChildOpacityTransition: false,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          child: ListView(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Aplikasi Pelanggaran Siswa',
                    style: TextStyle(
                      color: ApsColor.black,
                      fontSize: 20,
                      fontWeight: FontWeight.w700,
                      fontFamily: '',
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const NotificationScreen(),
                        ),
                      );
                    },
                    child: const Icon(
                      Icons.notifications_rounded,
                      color: ApsColor.primaryColor,
                      size: 30,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              TextFormField(
                decoration: const InputDecoration(
                  hintText: 'Cari di sini',
                  hintStyle:
                      TextStyle(color: ApsColor.grey, letterSpacing: 0.4),
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
                        builder: (context) =>
                            const DetailSiswaViolationScreen()),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
