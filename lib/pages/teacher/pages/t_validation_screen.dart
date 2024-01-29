import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:frontend_aps/common/widget/custom_app_bar.dart';
import 'package:frontend_aps/pages/teacher/widget/list_tile_validation.dart';
import '../../../bloc/violation/violation_bloc.dart';
import '../widget/loading/load_violation.dart';

class ValidationScreen extends StatefulWidget {
  const ValidationScreen({super.key});

  @override
  State<ValidationScreen> createState() => _ValidationScreenState();
}

class _ValidationScreenState extends State<ValidationScreen> {
  int counter = 1;
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
      body: ListView(
        children: [
          const SizedBox(height: 20),
          BlocBuilder<ViolationBloc, ViolationState>(
            builder: (context, state) {
              return state.maybeWhen(
                loading: () => const LoadingViolation(hideTitlev: false),
                loaded: (data) {
                  return SizedBox(
                    height: 600,
                    child: ListView.builder(
                      itemCount: data.length,
                      itemBuilder: (context, index) {
                        if (data[index].isValidate == 0) {
                          int currentCounter = counter++;
                          return ListTileValidation(
                            violation: data[index],
                            i: currentCounter,
                          );
                        } else {
                          return const SizedBox();
                        }
                      },
                    ),
                  );
                },
                error: (message) => const LoadingViolation(hideTitlev: false),
                orElse: () => const Center(child: Text("No Data")),
              );
            },
          ),
        ],
      ),
    );
  }
}
