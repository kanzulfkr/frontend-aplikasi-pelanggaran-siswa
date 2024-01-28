import 'package:flutter/material.dart';
import 'package:frontend_aps/pages/student/widget/detail_card_student.dart';
import 'package:frontend_aps/pages/student/widget/detail_row_status.dart';
import 'package:frontend_aps/pages/student/widget/detail_row_subtitle.dart';
import '../../../common/widget/custom_app_bar.dart';
import '../../../data/models/response/violation_response_models.dart';

class DetailGuruViolationScreen extends StatelessWidget {
  const DetailGuruViolationScreen({
    super.key,
    required this.violation,
  });
  final Violation violation;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(title: 'Detail Pelanggaran'),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: ListView(
          children: [
            CardStudentPoin(
              studentName: violation.studentName!,
              className: 'X MIPA 1',
            ),
            const Divider(thickness: 1.5),
            RowSubTitle(
              leftTitle: 'Point :',
              rightTitle: violation.point!.toString(),
            ),
            RowSubTitle(
              leftTitle: 'Tipe Pelanggaran :',
              rightTitle: violation.type!,
            ),
            ColumnSubtitle(
              topTitle: 'Jenis Pelanggaran : ',
              bottomTitle: violation.violationName!,
            ),
            ColumnSubtitle(
              topTitle: 'Petugas Pelanggaran : ',
              bottomTitle: violation.officerName!,
            ),
            ColumnSubtitle(
              topTitle: 'Catatan : ',
              bottomTitle: violation.catatan! == '' ? '-' : violation.catatan!,
            ),
          ],
        ),
      ),
    );
  }
}
