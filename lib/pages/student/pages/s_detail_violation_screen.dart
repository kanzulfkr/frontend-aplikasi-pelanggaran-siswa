import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:frontend_aps/common/widget/custom_app_bar.dart';

import '../../../bloc/point/point_bloc.dart';
import '../widget/detail_card_student.dart';
import '../widget/detail_row_status.dart';
import '../widget/detail_row_subtitle.dart';
import '../widget/loading/load_detail_violation.dart';

class DetailSiswaViolationScreen extends StatelessWidget {
  const DetailSiswaViolationScreen({
    super.key,
    required this.index,
  });
  final int index;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(title: 'Detail Pelanggaran Siswa'),
      backgroundColor: Colors.grey.shade50,
      body: BlocBuilder<PointBloc, PointState>(
        builder: (context, state) {
          return state.maybeWhen(
            loading: () => const LoadingDetailStudentViolation(),
            loaded: (data) {
              var item = data.point.violations[index];
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: ListView(
                  children: [
                    const SizedBox(height: 20),
                    CardStudentPoin(
                      studentName: item.studentName,
                      className: data.point.nisn,
                    ),
                    const Divider(thickness: 2, height: 35),
                    RowSubTitle(
                      leftTitle: 'Poin :',
                      rightTitle: item.point.toString(),
                    ),
                    RowSubTitle(
                      leftTitle: 'Tipe Pelanggaran :',
                      rightTitle: item.type,
                    ),
                    ColumnSubtitle(
                      topTitle: 'Jenis Pelanggaran :',
                      bottomTitle: item.violationsTypesName,
                    ),
                    ColumnSubtitle(
                      topTitle: 'Petugas Pelanggaran :',
                      bottomTitle: item.officerName,
                    ),
                    ColumnSubtitle(
                      topTitle: 'Catatan :',
                      bottomTitle: item.catatan == '' ? '-' : item.catatan!,
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
