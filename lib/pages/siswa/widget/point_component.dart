import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../bloc/point/point_bloc.dart';
import 'point_card_student.dart';
import 'point_row_status.dart';
import 'point_row_subtitle.dart';
import 'point_row_title.dart';
import 'point_row_violations.dart';

class CheckPoinComponent extends StatefulWidget {
  const CheckPoinComponent({
    super.key,
    required this.hideTitle,
  });

  final bool hideTitle;

  @override
  State<CheckPoinComponent> createState() => _CheckPoinComponentState();
}

class _CheckPoinComponentState extends State<CheckPoinComponent> {
  @override
  void initState() {
    context.read<PointBloc>().add(const PointEvent.getPoint());
    log("Get Poin Api..");
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PointBloc, PointState>(
      builder: (context, state) {
        return state.maybeWhen(
          loading: () => const Padding(
            padding: EdgeInsets.symmetric(vertical: 50),
            child: Center(child: CircularProgressIndicator()),
          ),
          loaded: (data) {
            int lengthData = (data.point.violations.length);
            int height = 0;

            if (lengthData == 0 || lengthData == 1) {
              height = 120;
            } else if (lengthData == 2) {
              height = 160;
            } else if (lengthData >= 3) {
              height = 250;
            }

            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: ListView(
                children: [
                  widget.hideTitle
                      ? const SizedBox(height: 20)
                      : const RowTitle(),
                  CardStudentPoin(
                    studentName: data.point.name,
                    className: 'X MIPA 1',
                  ),
                  const Divider(thickness: 2, height: 35),
                  const RowSubTitle(
                    leftTitle: 'Data Pelanggaran :',
                    rightTitle: 'Poin :',
                  ),
                  SizedBox(
                    height: height.toDouble(),
                    child: ListView.builder(
                      itemCount: lengthData,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.only(bottom: 10),
                          child: RowViolations(
                            violationName: data
                                .point.violations[index].violationsTypesName,
                            point:
                                data.point.violations[index].point.toString(),
                            i: index + 1,
                          ),
                        );
                      },
                    ),
                  ),
                  RowSubTitle(
                    leftTitle: 'Total Poin :',
                    rightTitle: data.point.pointTotal.toString(),
                  ),
                  RowStatus(
                    leftTitle: 'Status :',
                    rightTitle: data.point.status,
                  ),
                ],
              ),
            );
          },
          error: (message) => Center(child: Text(message)),
          orElse: () => const Center(child: Text("No Data")),
        );
      },
    );
  }
}
