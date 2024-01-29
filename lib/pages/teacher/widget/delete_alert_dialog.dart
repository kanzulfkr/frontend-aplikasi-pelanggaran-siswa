import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:frontend_aps/common/constant/aps_color.dart';
import 'package:frontend_aps/provider/delete_violations_provider.dart';
import 'package:provider/provider.dart';
import '../../../bloc/violation/violation_bloc.dart';
import '../../../common/widget/btn_primary.dart';
import '../../../common/widget/btn_secondary.dart';

class DeleteViolationAlertDialog extends StatefulWidget {
  const DeleteViolationAlertDialog({super.key, required this.id});
  final int id;

  @override
  State<DeleteViolationAlertDialog> createState() =>
      _DeleteViolationAlertDialogState();
}

class _DeleteViolationAlertDialogState
    extends State<DeleteViolationAlertDialog> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.white,
      title: const Text('Hapus data pelanggaran'),
      titleTextStyle: const TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.w600,
        color: Colors.black,
      ),
      content: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const SizedBox(height: 20),
            const Text(
              'Apakah anda yakin untuk menghapus data pelanggaran tersebut?',
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w400,
                color: Colors.black,
              ),
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                  width: 120,
                  child: SecondaryButton(
                    name: 'Tidak',
                    onPress: () {
                      Navigator.of(context).pop();
                    },
                  ),
                ),
                SizedBox(
                  width: 120,
                  child: PrimaryButton(
                    name: 'Ya',
                    onPress: () {
                      Provider.of<DeleteViolationProvider>(context,
                              listen: false)
                          .deleteViolation(widget.id);
                      Navigator.of(context).pop();
                      // Navigator.of(context).pop();
                      setState(() {
                        context
                            .read<ViolationBloc>()
                            .add(const ViolationEvent.getViolation());
                        log("Get Violation Api..");
                      });
                      log("Delete Violation Api..");
                      if (context.mounted) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Center(
                              child: Text(
                                'Data telah berhasil di hapus.',
                              ),
                            ),
                            backgroundColor: ApsColor.primaryColor,
                            showCloseIcon: true,
                            closeIconColor: Colors.white,
                          ),
                        );
                      }
                    },
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}