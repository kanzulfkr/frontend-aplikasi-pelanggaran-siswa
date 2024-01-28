import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:frontend_aps/common/widget/custom_app_bar.dart';
import 'package:frontend_aps/pages/student/widget/detail_card_student.dart';
import 'package:frontend_aps/pages/student/widget/detail_row_status.dart';
import 'package:frontend_aps/pages/student/widget/detail_row_subtitle.dart';
import '../../../bloc/point/point_bloc.dart';
import '../widget/loading/load_check_point.dart';
import '../widget/point_progress_indicator.dart';
import '../widget/point_row_title.dart';

class CheckPointScreen extends StatefulWidget {
  const CheckPointScreen({
    super.key,
    required this.hideTitle,
  });
  final bool hideTitle;

  @override
  State<CheckPointScreen> createState() => _CheckPointScreenState();
}

class _CheckPointScreenState extends State<CheckPointScreen> {
  @override
  void initState() {
    super.initState();
    context.read<PointBloc>().add(const PointEvent.getPoint());
    log("Get Poin Api..");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: widget.hideTitle
          ? null
          : const CustomAppBar(title: 'Akumulasi Poin Siswa'),
      body: BlocBuilder<PointBloc, PointState>(
        builder: (context, state) {
          return state.maybeWhen(
            loading: () => LoadingCheckPoint(hideTitle: widget.hideTitle),
            loaded: (data) {
              var item = data.point;
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: ListView(
                  children: [
                    widget.hideTitle
                        ? const RowTitle(
                            rowTitle: 'Akumulasi Poin Siswa',
                          )
                        : const SizedBox(height: 20),
                    CardStudentPoin(
                        className: 'XI MIPA 2', studentName: item.name),
                    const Padding(
                      padding: EdgeInsets.symmetric(vertical: 5),
                      child: Divider(thickness: 1.5),
                    ),
                    RowSubTitle(
                        leftTitle: 'Total Poin :',
                        rightTitle: item.pointTotal.toString()),
                    RowSubTitle(
                        leftTitle: 'Total Pelanggaran :',
                        rightTitle: item.violationTotal.toString()),
                    ColumnSubtitle(
                        topTitle: 'Status', bottomTitle: item.status),
                    const Padding(
                      padding: EdgeInsets.only(top: 5, bottom: 15),
                      child: Divider(thickness: 1.5),
                    ),
                    ProgressPointIndicator(item: item)
                  ],
                ),
              );
            },
            error: (message) => LoadingCheckPoint(hideTitle: widget.hideTitle),
            orElse: () => const Center(child: Text("No Data")),
          );
        },
      ),
    );
  }
}
