import 'package:flutter/material.dart';
import 'package:frontend_aps/data/models/response/violation_response_models.dart';
import 'package:frontend_aps/pages/teacher/pages/t_detail_violation_screen.dart';
import 'package:intl/intl.dart';

import 'validate_alert_dialog.dart';

class ListTileValidation extends StatelessWidget {
  const ListTileValidation({
    super.key,
    required this.violation,
    required this.i,
  });
  final int i;
  final Violation violation;
  @override
  Widget build(BuildContext context) {
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
                    violation: violation,
                  ),
                ),
              );
            },
            leading: Padding(
              padding: const EdgeInsets.only(left: 10),
              child: Text(
                i.toString(),
                style:
                    const TextStyle(fontSize: 15, fontWeight: FontWeight.w600),
              ),
            ),
            title: Text(
              violation.studentName!,
              style: const TextStyle(fontSize: 15, fontWeight: FontWeight.w600),
              overflow: TextOverflow.fade,
              maxLines: 2,
            ),
            subtitle: Text(
              DateFormat("dd MMM yyyy").format(violation.createdAt!),
              style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
            ),
            trailing: InkWell(
              onTap: () {
                showDialog(
                  context: context,
                  builder: (context) {
                    return ValidateViolationAlertDialog(
                      id: violation.id!,
                      isDetail: false,
                    );
                  },
                );
              },
              child: Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 15, vertical: 7),
                decoration: ShapeDecoration(
                  color: const Color(0xFFF7E1E1),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                child: const Text(
                  'Validasi !',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Color.fromARGB(255, 211, 9, 9),
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ),
          ),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Divider(thickness: 1.5, height: 5),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 10, right: 20, left: 20),
            child: Text(
              violation.violationName!,
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
