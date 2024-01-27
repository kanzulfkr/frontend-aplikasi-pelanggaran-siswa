import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:frontend_aps/pages/student/widget/loading/load_detail_violation%20.dart';
import '../../../bloc/point/point_bloc.dart';
import '../../../common/constant/aps_color.dart';
import '../widget/detail_card_student.dart';
import '../widget/detail_row_status.dart';
import '../widget/detail_row_subtitle.dart';
import '../widget/detail_row_violations.dart';

class DetailViolationScreen extends StatefulWidget {
  const DetailViolationScreen({super.key});

  @override
  State<DetailViolationScreen> createState() => _DetailViolationScreenState();
}

class _DetailViolationScreenState extends State<DetailViolationScreen> {
  @override
  void initState() {
    super.initState();
    context.read<PointBloc>().add(const PointEvent.getPoint());
    log("Get Poin Api..");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Detail Pelanggaran Siswa',
          style: TextStyle(
            color: ApsColor.white,
            fontWeight: FontWeight.w700,
            fontSize: 18,
          ),
        ),
        iconTheme: const IconThemeData(
          color: ApsColor.white,
        ),
        centerTitle: true,
        backgroundColor: ApsColor.primaryColor,
      ),
      body: BlocBuilder<PointBloc, PointState>(
        builder: (context, state) {
          return state.maybeWhen(
            loading: () => const LoadingDetailViolation(),
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
                      className: 'X MIPA 1',
                    ),
                    const Divider(thickness: 2, height: 35),
                    RowSubTitle(
                      leftTitle: 'Total Poin :',
                      rightTitle: item.pointTotal.toString(),
                    ),
                    RowStatus(
                      leftTitle: 'Status :',
                      rightTitle: item.status,
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
                                var itemNested = data.point.violations[index];
                                return Padding(
                                  padding:
                                      const EdgeInsets.only(bottom: 5, top: 5),
                                  child: Column(
                                    children: [
                                      RowViolations(
                                        i: index + 1,
                                        violationName:
                                            itemNested.violationsTypesName,
                                        violationDate: itemNested.createdAt,
                                        catatan: itemNested.catatan ?? '-',
                                        officer: itemNested.officerName,
                                        point: itemNested.point,
                                        type: itemNested.type,
                                      ),
                                      const Divider(thickness: 1)
                                    ],
                                  ),
                                );
                              },
                            ),
                    ),
                  ],
                ),
              );
            },
            error: (message) => const LoadingDetailViolation(),
            orElse: () => const Center(child: Text("No Data")),
          );
        },
      ),
    );
  }
}
