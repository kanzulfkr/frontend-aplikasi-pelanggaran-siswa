import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:frontend_aps/common/widget/custom_app_bar.dart';
import 'package:frontend_aps/pages/teacher/widget/list_tile_validation.dart';
import 'package:frontend_aps/pages/teacher/widget/not_found_data.dart';
import '../../../bloc/violation/violation_bloc.dart';
import '../widget/loading/load_violation.dart';

class ValidationScreen extends StatefulWidget {
  const ValidationScreen({super.key});

  @override
  State<ValidationScreen> createState() => _ValidationScreenState();
}

class _ValidationScreenState extends State<ValidationScreen> {
  @override
  void initState() {
    super.initState();
    context.read<ViolationBloc>().add(const ViolationEvent.getViolation());
    log("Get Violation no validate Api..");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(title: 'Validasi Pelanggaran'),
      backgroundColor: Colors.grey.shade100,
      body: BlocBuilder<ViolationBloc, ViolationState>(
        builder: (context, state) {
          return state.maybeWhen(
            loading: () => const LoadingTeacherViolation(hideTitlev: false),
            loaded: (data) {
              int counterr = 1;
              bool hasUnvalidatedData =
                  data.any((item) => item.isValidate == 0);
              return hasUnvalidatedData
                  ? ListView(
                      children: [
                        const SizedBox(height: 20),
                        SizedBox(
                          height: 600,
                          child: ListView.builder(
                            itemCount: data.length,
                            itemBuilder: (context, index) {
                              if (data[index].isValidate == 0) {
                                int currentCount = counterr++;
                                return ListTileValidation(
                                  violation: data[index],
                                  i: currentCount,
                                );
                              } else {
                                return const SizedBox();
                              }
                            },
                          ),
                        )
                      ],
                    )
                  : const NotFoundData(
                      title: 'Tidak ada data yang ditemukan,',
                      subTitle: 'semua data telah divalidasi',
                    );
            },
            error: (message) =>
                const LoadingTeacherViolation(hideTitlev: false),
            orElse: () => const Center(child: Text("No Data")),
          );
        },
      ),
    );
  }
}
