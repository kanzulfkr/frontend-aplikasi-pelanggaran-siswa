import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:frontend_aps/common/constant/aps_color.dart';
import 'package:frontend_aps/provider/delete_violations_provider.dart';
import 'package:provider/provider.dart';
import '../../../bloc/violation/violation_bloc.dart';
import '../../../common/widget/btn_primary.dart';
import '../../../common/widget/btn_secondary.dart';

class ValidateViolationAlertDialog extends StatefulWidget {
  const ValidateViolationAlertDialog({
    super.key,
    required this.id,
    required this.isDetail,
  });
  final int id;
  final bool isDetail;

  @override
  State<ValidateViolationAlertDialog> createState() =>
      _ValidateViolationAlertDialogState();
}

class _ValidateViolationAlertDialogState
    extends State<ValidateViolationAlertDialog> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.white,
      title: const Text('Validasi pelanggaran'),
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
              'Apakah anda yakin untuk melakukan validasi pelanggaran tersebut?',
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
                          .validateViolation(widget.id, '1');
                      Navigator.of(context).pop();
                      widget.isDetail ? Navigator.of(context).pop() : null;
                      setState(() {
                        context
                            .read<ViolationBloc>()
                            .add(const ViolationEvent.getViolation());
                        log("Refresh Data Violation Api..");
                      });
                      log("Validate Violation Api..");
                      if (context.mounted) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Center(
                              child: Text(
                                'Data telah berhasil di validasi.',
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
