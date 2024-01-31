import 'package:flutter/material.dart';
import 'package:frontend_aps/common/widget/btn_primary.dart';
import 'package:frontend_aps/common/widget/btn_secondary.dart';
import 'package:frontend_aps/pages/student/widget/detail_card_student.dart';
import 'package:frontend_aps/pages/student/widget/detail_row_status.dart';
import 'package:frontend_aps/pages/student/widget/detail_row_subtitle.dart';
import 'package:provider/provider.dart';
import '../../../bloc/violation/violation_bloc.dart';
import '../../../common/widget/custom_alert_dialog.dart';
import '../../../common/widget/custom_app_bar.dart';
import '../../../data/models/response/violation_response_models.dart';
import '../../../provider/delete_violations_provider.dart';

class DetailGuruViolationScreen extends StatefulWidget {
  const DetailGuruViolationScreen({
    super.key,
    required this.violation,
  });
  final Violation violation;

  @override
  State<DetailGuruViolationScreen> createState() =>
      _DetailGuruViolationScreenState();
}

class _DetailGuruViolationScreenState extends State<DetailGuruViolationScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(title: 'Detail Pelanggaran'),
      backgroundColor: Colors.grey.shade100,
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: ListView(
          children: [
            CardStudentPoin(
              studentName: widget.violation.studentName!,
              className: 'X MIPA 1',
            ),
            const Divider(thickness: 1.5),
            RowSubTitle(
              leftTitle: 'Point :',
              rightTitle: widget.violation.point!.toString(),
            ),
            RowSubTitle(
              leftTitle: 'Tipe Pelanggaran :',
              rightTitle: widget.violation.type!,
            ),
            ColumnSubtitle(
              topTitle: 'Jenis Pelanggaran : ',
              bottomTitle: widget.violation.violationName!,
            ),
            ColumnSubtitle(
              topTitle: 'Petugas Pelanggaran : ',
              bottomTitle: widget.violation.officerName!,
            ),
            ColumnSubtitle(
              topTitle: 'Catatan : ',
              bottomTitle: widget.violation.catatan == null ||
                      widget.violation.catatan == ''
                  ? '-'
                  : widget.violation.catatan!,
            ),
            const SizedBox(height: 100),
            widget.violation.isValidate == 0
                ? PrimaryButton(
                    name: 'Validasi sekarang!',
                    onPress: () {
                      customAlertDialog(
                        context,
                        'Validasi pelanggaran',
                        'Apakah anda yakin untuk melakukan validasi data pelanggaran tersebut?',
                        'Data telah Berhasil divalidasi.',
                        true,
                        () {
                          Provider.of<DeleteViolationProvider>(context,
                                  listen: false)
                              .validateViolation(widget.violation.id!, '1');
                          Navigator.of(context).pop();
                          Navigator.of(context).pop();
                          setState(() {
                            context
                                .read<ViolationBloc>()
                                .add(const ViolationEvent.getViolation());
                          });
                        },
                      );
                    },
                  )
                : SecondaryButton(
                    name: 'Sudah tervalidasi.',
                    onPress: () {},
                  ),
          ],
        ),
      ),
    );
  }
}
