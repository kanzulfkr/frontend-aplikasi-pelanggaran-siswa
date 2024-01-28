import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:frontend_aps/bloc/violation/violation_bloc.dart';
import 'package:frontend_aps/common/widget/custom_app_bar.dart';
import 'package:frontend_aps/pages/student/widget/point_row_title.dart';

import '../../../common/constant/aps_color.dart';
import '../widget/custom_list_tile.dart';
import '../widget/loading/load_violation.dart';

class ViolationScreen extends StatefulWidget {
  const ViolationScreen({
    super.key,
    required this.hideTitleV,
  });
  final bool hideTitleV;

  @override
  State<ViolationScreen> createState() => _ViolationScreenState();
}

class _ViolationScreenState extends State<ViolationScreen> {
  @override
  void initState() {
    super.initState();
    context.read<ViolationBloc>().add(const ViolationEvent.getViolation());
    log("Get Violation Api..");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 248, 246, 246),
      appBar: widget.hideTitleV
          ? null
          : const CustomAppBar(title: 'Data Pelanggaran Siswa'),
      body: ListView(
        children: [
          widget.hideTitleV
              ? const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  child: RowTitle(
                    rowTitle: 'Data Pelanggaran Siswa',
                  ),
                )
              : const SizedBox(height: 20),
          widget.hideTitleV ? const Divider(thickness: 1.5) : const SizedBox(),
          const SizedBox(height: 20),
          BlocBuilder<ViolationBloc, ViolationState>(
            builder: (context, state) {
              return state.maybeWhen(
                loading: () => LoadingViolation(hideTitlev: widget.hideTitleV),
                loaded: (data) {
                  return SizedBox(
                    height: 600,
                    child: ListView.builder(
                      itemCount: data.length,
                      itemBuilder: (context, index) {
                        return CustomListTile(
                          violation: data[index],
                          i: (index + 1).toString(),
                        );
                      },
                    ),
                  );
                },
                error: (message) =>
                    LoadingViolation(hideTitlev: widget.hideTitleV),
                orElse: () => const Center(child: Text("No Data")),
              );
            },
          )
        ],
      ),
    );
  }
}
