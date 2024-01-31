import 'package:flutter/material.dart';
import 'package:frontend_aps/common/widget/custom_alert_dialog.dart';
import 'package:frontend_aps/data/models/response/violation_response_models.dart';
import 'package:frontend_aps/pages/teacher/pages/t_detail_violation_screen.dart';
import 'package:frontend_aps/pages/teacher/pages/t_update_violation_screen.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import '../../../bloc/violation/violation_bloc.dart';
import '../../../provider/delete_violations_provider.dart';
import '../../../provider/store_violation_provider.dart';

class ListTileViolation extends StatefulWidget {
  const ListTileViolation({
    super.key,
    required this.violation,
    required this.i,
  });
  final String i;
  final Violation violation;

  @override
  State<ListTileViolation> createState() => _ListTileViolationState();
}

class _ListTileViolationState extends State<ListTileViolation> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final storeProv =
        Provider.of<StoreViolationProvider>(context, listen: false);
    final deleteProv =
        Provider.of<DeleteViolationProvider>(context, listen: false);
    return Container(
      margin: const EdgeInsets.only(bottom: 15),
      width: double.maxFinite,
      color: Colors.white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ListTile(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => DetailGuruViolationScreen(
                    violation: widget.violation,
                  ),
                ),
              );
            },
            leading: Padding(
              padding: const EdgeInsets.only(left: 10),
              child: Text(
                widget.i,
                style:
                    const TextStyle(fontSize: 15, fontWeight: FontWeight.w600),
              ),
            ),
            title: Text(
              widget.violation.studentName!,
              style: const TextStyle(fontSize: 15, fontWeight: FontWeight.w600),
              overflow: TextOverflow.fade,
              maxLines: 2,
            ),
            subtitle: Text(
              DateFormat("dd MMM yyyy").format(widget.violation.createdAt!),
              style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
            ),
            trailing: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 15, vertical: 3),
                  decoration: ShapeDecoration(
                    color: widget.violation.isValidate == 1
                        ? const Color(0xFFEBF6EB)
                        : const Color(0xFFF7E1E1),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  child: Text(
                    widget.violation.isValidate == 1
                        ? 'Validate'
                        : 'Unvalidate',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: widget.violation.isValidate == 1
                          ? const Color(0xFF31AA26)
                          : const Color.fromARGB(255, 205, 28, 28),
                      fontSize: 13,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                widget.violation.isValidate == 1
                    ? const SizedBox()
                    : SizedBox(
                        width: 80,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            // update
                            GestureDetector(
                              onTap: () {
                                storeProv
                                    .setStudentId(widget.violation.studentId);
                                storeProv.setOfficerIdUpdate(
                                    widget.violation.officerId);
                                storeProv.setViolationTypesId(
                                    widget.violation.violationsTypesId);
                                storeProv.setStudentController(
                                    widget.violation.studentName!);
                                storeProv.setOfficerControllerUpdate(
                                    widget.violation.officerName!);
                                storeProv.setViolationTypesController(
                                    widget.violation.violationName!);
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => UpdateViolationScreen(
                                      id: widget.violation.id!,
                                      catatan: widget.violation.catatan!,
                                    ),
                                  ),
                                );
                              },
                              child: const Icon(Icons.edit_outlined),
                            ),
                            // delete
                            GestureDetector(
                              onTap: () {
                                customAlertDialog(
                                  context,
                                  'Hapus data pelanggaran',
                                  'Apakah anda yakin untuk menghapus data pelanggaran tersebut?',
                                  'Data telah Berhasil di hapus.',
                                  true,
                                  () {
                                    deleteProv
                                        .deleteViolation(widget.violation.id!);
                                    Navigator.of(context).pop();
                                    setState(() {
                                      context.read<ViolationBloc>().add(
                                          const ViolationEvent.getViolation());
                                    });
                                  },
                                );
                              },
                              child: const Icon(Icons.delete_outline),
                            ),
                          ],
                        ),
                      ),
              ],
            ),
          ),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Divider(thickness: 1.5, height: 10),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 10, right: 20, left: 20),
            child: Text(
              widget.violation.violationName!,
              style: const TextStyle(fontSize: 15),
              overflow: TextOverflow.fade,
              maxLines: 2,
            ),
          )
        ],
      ),
    );
  }
}
