import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:frontend_aps/bloc/violation/violation_bloc.dart';
import 'package:frontend_aps/common/widget/custom_app_bar.dart';
import 'package:frontend_aps/pages/student/widget/point_row_title.dart';
import 'package:liquid_pull_to_refresh/liquid_pull_to_refresh.dart';
import 'package:provider/provider.dart';
import '../../../bloc/getUser/get_user_bloc.dart';
import '../../../common/constant/aps_color.dart';
import '../../../provider/store_violation_provider.dart';
import '../widget/list_tile_violation.dart';
import '../widget/loading/load_violation.dart';
import '../widget/not_found_data.dart';
import 't_add_violation_screen.dart';

class GuruViolationScreen extends StatefulWidget {
  const GuruViolationScreen({
    super.key,
    required this.hideTitleV,
  });
  final bool hideTitleV;

  @override
  State<GuruViolationScreen> createState() => _GuruViolationScreenState();
}

class _GuruViolationScreenState extends State<GuruViolationScreen> {
  @override
  void initState() {
    super.initState();
    context.read<ViolationBloc>().add(const ViolationEvent.getViolation());
    log("Get Violation Api..");
  }

  Future<void> _handleRefresh() async {
    await Future.delayed(const Duration(seconds: 2));
    if (context.mounted) {
      context.read<GetUserBloc>().add(const GetUserEvent.getProfile());
      log("Get User Api..");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade50,
      appBar: widget.hideTitleV
          ? null
          : const CustomAppBar(title: 'Data Pelanggaran Siswa'),
      body: LiquidPullToRefresh(
        height: 70,
        onRefresh: _handleRefresh,
        color: ApsColor.primaryColor,
        animSpeedFactor: 4,
        springAnimationDurationInMilliseconds: 800,
        showChildOpacityTransition: false,
        child: ListView(
          children: [
            widget.hideTitleV
                ? const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    child: RowTitle(
                      rowTitle: 'Data Pelanggaran Siswa',
                    ),
                  )
                : const SizedBox(height: 20),
            widget.hideTitleV
                ? const Divider(thickness: 1.5)
                : const SizedBox(),
            const SizedBox(height: 20),
            BlocBuilder<ViolationBloc, ViolationState>(
              builder: (context, state) {
                return state.maybeWhen(
                  loading: () =>
                      LoadingTeacherViolation(hideTitlev: widget.hideTitleV),
                  loaded: (data) {
                    return SizedBox(
                      height: 600,
                      child: ListView.builder(
                        itemCount: data.length,
                        itemBuilder: (context, index) {
                          return data.isEmpty
                              ? const NotFoundData(
                                  title: 'Tidak ada data yang ditemukan,',
                                  subTitle: 's',
                                )
                              : ListTileViolation(
                                  violation: data[index],
                                  i: (index + 1).toString(),
                                );
                        },
                      ),
                    );
                  },
                  error: (message) =>
                      LoadingTeacherViolation(hideTitlev: widget.hideTitleV),
                  orElse: () => const Center(child: Text("No Data")),
                );
              },
            ),
          ],
        ),
      ),
      floatingActionButton: BlocBuilder<GetUserBloc, GetUserState>(
        builder: (context, state) {
          return state.maybeWhen(
            loading: null,
            loaded: (data) {
              return FloatingActionButton(
                tooltip: 'Add Violation',
                child: const Icon(Icons.add),
                onPressed: () {
                  final storeProv = Provider.of<StoreViolationProvider>(context,
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
    );
  }
}
