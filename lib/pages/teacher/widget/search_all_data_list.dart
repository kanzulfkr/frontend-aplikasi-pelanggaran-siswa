import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../provider/store_violation_provider.dart';

class AllDataList extends StatelessWidget {
  const AllDataList({
    super.key,
    required this.allStudents,
    required this.allViolationTypes,
    required this.isStudentSearch,
  });
  final List<dynamic> allStudents;
  final List<dynamic> allViolationTypes;
  final bool isStudentSearch;

  @override
  Widget build(BuildContext context) {
    final storeProv =
        Provider.of<StoreViolationProvider>(context, listen: false);

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 20, top: 20),
            child: Text(
              isStudentSearch
                  ? 'Terdapat ${allStudents.length} data nama siswa.'
                  : 'Terdapat ${allViolationTypes.length} data jenis pelanggaran.',
              style: const TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w600,
                color: Colors.black54,
              ),
            ),
          ),
          Container(
            margin: const EdgeInsets.only(top: 20),
            padding: const EdgeInsets.only(top: 8),
            height: isStudentSearch ? 520 : 550,
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.all(
                Radius.circular(20),
              ),
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.3),
                  spreadRadius: 1,
                  blurRadius: 2,
                  offset: const Offset(0, 2.4),
                ),
              ],
            ),
            child: ListView.builder(
              itemCount: isStudentSearch
                  ? allStudents.length
                  : allViolationTypes.length,
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: () {
                    if (isStudentSearch) {
                      storeProv.setStudentId(allStudents[index]['student_id']);
                      storeProv
                          .setStudentController(allStudents[index]['name']);
                    } else {
                      storeProv
                          .setViolationTypesId(allViolationTypes[index]['id']);
                      storeProv.setViolationTypesController(
                          allViolationTypes[index]['name']);
                    }
                    Navigator.pop(context);
                  },
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 20, vertical: 8),
                        child: Text(
                          isStudentSearch
                              ? allStudents[index]['name']
                              : allViolationTypes[index]['name'],
                          style: const TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                      const Divider(thickness: 1)
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
