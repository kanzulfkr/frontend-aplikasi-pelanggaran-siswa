import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:frontend_aps/common/constant/aps_color.dart';
import 'package:frontend_aps/common/widget/custom_alert_dialog.dart';
import 'package:frontend_aps/pages/teacher/g_main_screen.dart';
import 'package:provider/provider.dart';
import '../../../bloc/storeViolation/store_violation_bloc.dart';
import '../../../common/widget/btn_primary.dart';
import '../../../data/models/request/violation_request_models.dart';
import '../../../provider/store_violation_provider.dart';
import '../../auth/widget/pop_up_message.dart';

class ButtonStore extends StatelessWidget {
  const ButtonStore({
    Key? key,
    required this.formKey,
    required this.studentController,
    required this.officerController,
    required this.catatanController,
  }) : super(key: key);
  final GlobalKey<FormState> formKey;
  final TextEditingController studentController;
  final TextEditingController officerController;
  final TextEditingController catatanController;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<StoreViolationBloc, StoreViolationState>(
      builder: (context, state) {
        return state.maybeWhen(
          loading: () => const Center(child: CircularProgressIndicator()),
          orElse: () {
            return PrimaryButton(
              name: 'Tambah Data',
              onPress: () {
                customAlertDialog(
                  context,
                  'Tambah Data',
                  'Apakah anda yakin untuk menambahkan data tersebut?',
                  'Data telah berhasil ditambahkan',
                  false,
                  () {
                    final storeProv = Provider.of<StoreViolationProvider>(
                        context,
                        listen: false);
                    if (formKey.currentState!.validate()) {
                      final storeModel = ViolationRequestModel(
                        studentId: storeProv.getStudentId!,
                        violationsTypesId: storeProv.getViolationTypesId,
                        officerId: storeProv.getOfficerIdStore!,
                        catatan: catatanController.text,
                        isValidate: 0,
                      );
                      context
                          .read<StoreViolationBloc>()
                          .add(StoreViolationEvent.storeViolation(storeModel));
                    }
                  },
                );
              },
            );
          },
        );
      },
      listener: (context, state) {
        state.maybeWhen(
          loaded: (success) async {
            log('success store data');
            if (context.mounted) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Center(
                    child: Text(
                      'Data pelanggaran ${studentController.text} telah berhasil ditambahkan',
                    ),
                  ),
                  backgroundColor: ApsColor.primaryColor,
                  showCloseIcon: true,
                  closeIconColor: Colors.white,
                ),
              );
              if (context.mounted) {
                Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const GuruMainScreen(),
                  ),
                  (Route<dynamic> route) => false,
                );
              }
            }
          },
          error: (error) async {
            await showDialog(
              context: context,
              builder: (context) => PopUpMessage(
                message: error,
                backgroundColor: Colors.red,
              ),
            );
          },
          orElse: () {},
        );
      },
    );
  }
}
