import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:frontend_aps/common/widget/custom_app_bar.dart';
import 'package:frontend_aps/pages/student/pages/s_detail_violation_screen.dart';
import 'package:frontend_aps/pages/student/widget/loading/load_detail_violation.dart';
import '../../../bloc/point/point_bloc.dart';
import '../widget/detail_card_student.dart';
import '../widget/detail_row_status.dart';
import '../widget/detail_row_subtitle.dart';
import '../widget/list_violations.dart';

class SiswaViolationScreen extends StatefulWidget {
  const SiswaViolationScreen({super.key});

  @override
  State<SiswaViolationScreen> createState() => _SiswaViolationScreenState();
}

class _SiswaViolationScreenState extends State<SiswaViolationScreen> {
  @override
  void initState() {
    super.initState();
    context.read<PointBloc>().add(const PointEvent.getPoint());
    log("Get Poin Api..");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(title: 'Data Pelanggaran Siswa'),
      backgroundColor: Colors.grey.shade50,
      body: BlocBuilder<PointBloc, PointState>(
        builder: (context, state) {
          return state.maybeWhen(
            loading: () => const LoadingDetailStudentViolation(),
            loaded: (data) {
              var item = data.point;
              int lengthData = (data.point.violations.length);
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: ListView(
                  children: [
                    const SizedBox(height: 20),
                    CardStudentPoin(
                      studentName: item.name,
                      className: item.nisn,
                    ),
                    const Divider(thickness: 2, height: 35),
                    RowSubTitle(
                      leftTitle: 'Total Poin :',
                      rightTitle: item.pointTotal.toString(),
                    ),
                    ColumnSubtitle(
                      topTitle: 'Status :',
                      bottomTitle: item.status,
                    ),
                    const RowSubTitle(
                      leftTitle: 'Data Pelanggaran :',
                      rightTitle: 'Poin :',
                    ),
                    SizedBox(
                      height: 450,
                      child: lengthData == 0
                          ? const Center(
                              child: Text('Tidak Ada Rekam Pelanggaran.'))
                          : ListView.builder(
                              itemCount: lengthData,
                              itemBuilder: (context, index) {
                                var item = data.point.violations[index];
                                return InkWell(
                                  onTap: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) =>
                                            DetailSiswaViolationScreen(
                                                index: index),
                                      ),
                                    );
                                  },
                                  child: Padding(
                                    padding: const EdgeInsets.only(
                                        bottom: 5, top: 5),
                                    child: Column(
                                      children: [
                                        ListViolations(
                                            i: index + 1, violation: item),
                                        const Divider(thickness: 1),
                                      ],
                                    ),
                                  ),
                                );
                              },
                            ),
                    ),
                  ],
                ),
              );
            },
            error: (message) => const LoadingDetailStudentViolation(),
            orElse: () => const Center(child: Text("No Data")),
          );
        },
      ),
    );
  }
}
