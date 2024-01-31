import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:frontend_aps/bloc/getUser/get_user_bloc.dart';
import 'package:frontend_aps/common/constant/aps_color.dart';
import 'package:frontend_aps/pages/notification/notification_screen.dart';
import 'package:frontend_aps/pages/teacher/pages/t_add_violation_screen.dart';
import 'package:liquid_pull_to_refresh/liquid_pull_to_refresh.dart';
import 'package:provider/provider.dart';
import '../../../common/widget/dashboard_card_menu.dart';
import '../../../provider/store_violation_provider.dart';
import '../../main_screen/check_role.dart';
import 't_validation_screen.dart';
import 't_violation_screen.dart';

class GuruDashboardScreen extends StatefulWidget {
  const GuruDashboardScreen({super.key});

  @override
  State<GuruDashboardScreen> createState() => _GuruDashboardScreenState();
}

class _GuruDashboardScreenState extends State<GuruDashboardScreen> {
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
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.grey.shade50,
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
                    child: const Icon(Icons.notifications_rounded,
                        color: ApsColor.primaryColor, size: 30),
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
              const SizedBox(height: 20),
              CardMenu(
                image: 'jadwal',
                firstTitle: 'Validasi',
                secondTitle: 'Pelanggaran',
                color: ApsColor.dashboard2,
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
              BlocBuilder<GetUserBloc, GetUserState>(
                builder: (context, state) {
                  return state.maybeWhen(
                    loading: null,
                    loaded: (data) {
                      return CardMenu(
                        image: 'matkul',
                        firstTitle: 'Tambah',
                        secondTitle: 'Pelanggaran',
                        color: ApsColor.dashboard1,
                        onTap: () {
                          final storeProv = Provider.of<StoreViolationProvider>(
                              context,
                              listen: false);
                          storeProv.setStudentId(null);
                          storeProv.setViolationTypesId(null);
                          storeProv.setStudentController('');
                          storeProv.setViolationTypesController('');

                          storeProv.setOfficerIdStore(data.data!.teacherId);
                          storeProv.setOfficerControllerStore(data.data!.name!);
                          setState(() {});
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const AddViolationScreen(),
                            ),
                          );
                        },
                      );
                    },
                    orElse: () => const SizedBox(),
                    error: null,
                  );
                },
              ),
              const SizedBox(height: 20),
              CardMenu(
                image: 'khs',
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
      ),
    );
  }
}
