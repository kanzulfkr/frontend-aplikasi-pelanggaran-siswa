import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:frontend_aps/common/widget/btn_primary.dart';
import 'package:frontend_aps/common/widget/custom_app_bar.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../bloc/getUser/get_user_bloc.dart';
import '../../../bloc/point/point_bloc.dart';
import '../../../common/constant/utils.dart';
import '../../../common/widget/btn_secondary.dart';
import '../../../common/widget/custom_alert_dialog.dart';
import '../../../provider/delete_violations_provider.dart';
import '../widget/detail_card_student.dart';
import '../widget/detail_row_status.dart';
import '../widget/detail_row_subtitle.dart';
import '../widget/loading/load_detail_violation.dart';

class DetailSiswaViolationScreen extends StatefulWidget {
  const DetailSiswaViolationScreen({
    super.key,
    required this.index,
  });
  final int index;

  @override
  State<DetailSiswaViolationScreen> createState() =>
      _DetailSiswaViolationScreenState();
}

class _DetailSiswaViolationScreenState
    extends State<DetailSiswaViolationScreen> {
  @override
  void initState() {
    super.initState();
  }

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
              var item = data.point.violations[widget.index];
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
                      bottomTitle: item.catatan == null ? '-' : item.catatan!,
                    ),
                    BlocBuilder<GetUserBloc, GetUserState>(
                      builder: (context, state) {
                        return state.maybeWhen(
                          loading: () =>
                              const Center(child: Text("User Not Found")),
                          loaded: (data) {
                            return data.data!.roles == '6'
                                ? ColumnSubtitle(
                                    topTitle: 'Konfirmasi Wali Murid : ',
                                    bottomTitle: item.isConfirm == 1
                                        ? 'Pelanggaran ini telah dikonfirmasi oleh Orang Tua anda.'
                                        : 'Pelanggaran ini belum dikonfirmasi oleh Orang Tua anda.',
                                  )
                                : Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      ColumnSubtitle(
                                        topTitle: 'Konfirmasi Wali Murid : ',
                                        bottomTitle: item.isConfirm == 1
                                            ? 'Pelanggaran ini telah anda konfirmasi.'
                                            : 'Pelanggaran ini belum anda konfirmasi, segera lakukan konfirmasi.',
                                      ),
                                      const SizedBox(height: 10),
                                      item.isConfirm == 1
                                          ? SecondaryButton(
                                              name: 'Sudah diKonfirmasi',
                                              onPress: () {},
                                            )
                                          : PrimaryButton(
                                              name: 'Konfirmasi sekarang!',
                                              onPress: () {
                                                return customAlertDialog(
                                                  context,
                                                  'Konfirmasi pelanggaran',
                                                  'Apakah anda yakin untuk melakukan konfirmasi pelanggaran tersebut?',
                                                  'Data telah berhasil dikonfirmasi.',
                                                  true,
                                                  () {
                                                    Provider.of<DeleteViolationProvider>(
                                                            context,
                                                            listen: false)
                                                        .confirmViolation(
                                                            item.id, '1');
                                                    Navigator.of(context).pop();
                                                    context
                                                        .read<PointBloc>()
                                                        .add(const PointEvent
                                                            .getPoint());
                                                  },
                                                );
                                              },
                                            ),
                                    ],
                                  );
                          },
                          orElse: () => const Center(child: Text("-")),
                        );
                      },
                    ),
                    const SizedBox(height: 50),
                    RichText(
                      text: TextSpan(
                        text:
                            'Apabila terdapat kesalahan, hubungi pihak tata tertib ',
                        style: DefaultTextStyle.of(context).style,
                        children: <TextSpan>[
                          TextSpan(
                            text: 'disini !',
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              color: ApsColor.primaryColor,
                              decoration: TextDecoration.underline,
                            ),
                            recognizer: TapGestureRecognizer()
                              ..onTap = () async {
                                var phoneNumber = item.officerPhone;
                                var url = 'https://wa.me/$phoneNumber';
                                if (await canLaunch(url)) {
                                  await launch(url);
                                } else {
                                  throw 'Could not launch $url';
                                }
                              },
                          ),
                        ],
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
