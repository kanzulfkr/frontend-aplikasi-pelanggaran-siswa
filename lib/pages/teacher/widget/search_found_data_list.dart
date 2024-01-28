import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../bloc/search/student_provider.dart';

class FoundDataList extends StatelessWidget {
  const FoundDataList({
    super.key,
    required this.foundStudents,
    required this.isStudentSearch,
    required this.foundViolationTypes,
  });
  final List<dynamic> foundStudents;
  final List<dynamic> foundViolationTypes;
  final bool isStudentSearch;

  @override
  Widget build(BuildContext context) {
    final searchProv = Provider.of<SearchProvider>(context, listen: false);
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
                  ? 'Berhasil ditemukan ${foundStudents.length} nama siswa.'
                  : 'Berhasil ditemukan ${foundViolationTypes.length} jenis pelanggaran.',
              style: const TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w600,
                color: Colors.black54,
              ),
            ),
          ),
          Container(
            margin: const EdgeInsets.only(top: 20),
            height: isStudentSearch
                ? (58 * foundStudents.length.toDouble())
                : (150 * foundViolationTypes.length.toDouble()),
            child: ListView.builder(
              itemCount: isStudentSearch
                  ? foundStudents.length
                  : foundViolationTypes.length,
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: () {
                    if (isStudentSearch) {
                      searchProv
                          .setStudentId(foundStudents[index]['student_id']);
                      searchProv
                          .setStudentController(foundStudents[index]['name']);
                    } else {
                      searchProv.setViolationTypesId(
                          foundViolationTypes[index]['id']);
                      searchProv.setViolationTypesController(
                          foundViolationTypes[index]['name']);
                    }
                    Navigator.pop(context);
                  },
                  child: Container(
                    width: double.maxFinite,
                    margin: const EdgeInsets.fromLTRB(3, 0, 3, 1),
                    decoration: BoxDecoration(
                      borderRadius: foundStudents.length == 1 ||
                              foundViolationTypes.length == 1
                          ? const BorderRadius.all(
                              Radius.circular(15),
                            )
                          : index == 0
                              ? const BorderRadius.vertical(
                                  top: Radius.circular(15),
                                )
                              : index == foundStudents.length - 1 ||
                                      index == foundViolationTypes.length - 1
                                  ? const BorderRadius.vertical(
                                      bottom: Radius.circular(15),
                                    )
                                  : const BorderRadius.vertical(),
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.3),
                          spreadRadius: 1,
                          blurRadius: 2,
                          offset: const Offset(0, 2),
                        ),
                      ],
                    ),
                    child: ListTile(
                      title: Text(
                        isStudentSearch
                            ? foundStudents[index]['name']
                            : foundViolationTypes[index]['name'],
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
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
