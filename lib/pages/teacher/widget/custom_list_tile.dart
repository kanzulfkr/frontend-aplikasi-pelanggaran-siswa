import 'package:flutter/material.dart';
import 'package:frontend_aps/data/models/response/violation_response_models.dart';
import 'package:frontend_aps/pages/teacher/pages/t_detail_violation_screen.dart';
import 'package:frontend_aps/pages/teacher/pages/t_update_violation_screen.dart';
import 'package:frontend_aps/pages/teacher/widget/delete_alert_dialog.dart';

class CustomListTile extends StatelessWidget {
  const CustomListTile({
    super.key,
    required this.violation,
    required this.i,
  });
  final String i;
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
                i,
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
            subtitle: const Text(
              'X MIPA 1',
              style: TextStyle(fontSize: 15),
            ),
            trailing: Column(
              children: [
                Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 15, vertical: 3),
                  decoration: ShapeDecoration(
                    color: violation.isValidate == 1
                        ? const Color(0xFFEBF6EB)
                        : const Color(0xFFF7E1E1),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  child: Text(
                    violation.isValidate == 1 ? 'Validate' : 'Unvalidate',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: violation.isValidate == 1
                          ? const Color(0xFF31AA26)
                          : const Color(0xFFEB5757),
                      fontSize: 13,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                violation.isValidate == 1
                    ? const SizedBox()
                    : SizedBox(
                        width: 70,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            GestureDetector(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) =>
                                        const UpdateViolationScreen(),
                                  ),
                                );
                              },
                              child: const Icon(Icons.edit_outlined),
                            ),
                            GestureDetector(
                              onTap: () {
                                showDialog(
                                  context: context,
                                  builder: (context) {
                                    return const DeleteViolationAlertDialog();
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
