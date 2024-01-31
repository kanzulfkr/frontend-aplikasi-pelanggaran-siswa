// ignore_for_file: avoid_print

import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:frontend_aps/data/models/request/violation_update_request_models.dart';
import 'package:frontend_aps/pages/teacher/g_main_screen.dart';
import 'package:provider/provider.dart';

import '../../../bloc/UpdateViolation/update_violation_bloc.dart';
import '../../../common/constant/aps_color.dart';
import '../../../common/widget/btn_primary.dart';
import '../../../common/widget/custom_alert_dialog.dart';
import '../../../provider/store_violation_provider.dart';
import '../../auth/widget/pop_up_message.dart';

class ButtonUpdate extends StatelessWidget {
  const ButtonUpdate({
    super.key,
    required this.id,
    required this.formKey,
    required this.catatanController,
  });

  final int id;
  final GlobalKey<FormState> formKey;
  final TextEditingController catatanController;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<UpdateViolationBloc, UpdateViolationState>(
      builder: (context, state) {
        return state.maybeWhen(
          loading: () => const Center(child: CircularProgressIndicator()),
          orElse: () {
            return PrimaryButton(
              name: 'Simpan Data',
              onPress: () {
                customAlertDialog(
                  context,
                  'Tambah Data',
                  'Apakah anda yakin untuk menambahkan data tersebut?',
                  'Data telah berhasil ditambahkan',
                  false,
                  () {
                    final updateProv = Provider.of<StoreViolationProvider>(
                        context,
                        listen: false);
                    if (formKey.currentState!.validate()) {
                      final storeModel = ViolationUpdateRequestModel(
                        id: id,
                        studentId: updateProv.getStudentId!,
                        violationsTypesId: updateProv.getViolationTypesId,
                        officerId: updateProv.getOfficerIdUpdate!,
                        catatan: catatanController.text,
                        isValidate: 0,
                      );
                      context.read<UpdateViolationBloc>().add(
                          UpdateViolationEvent.updateViolation(storeModel));
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
            log('success update data');
            if (context.mounted) {
              Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(
                  builder: (context) => const GuruMainScreen(),
                ),
                (Route<dynamic> route) => false,
              );
            }
            if (context.mounted) {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Center(
                    child: Text(
                      'Data pelanggaran telah berhasil diperbarui',
                    ),
                  ),
                  backgroundColor: ApsColor.primaryColor,
                  showCloseIcon: true,
                  closeIconColor: Colors.white,
                ),
              );
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
