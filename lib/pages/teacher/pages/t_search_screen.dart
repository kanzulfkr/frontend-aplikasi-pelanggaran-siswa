import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../widget/search_all_data_list.dart';
import '../../../common/constant/aps_color.dart';
import '../widget/search_found_data_list.dart';
import '../../../bloc/search/student_provider.dart';
import '../widget/search_not_found_student_list.dart';

class AddSearchScreen extends StatefulWidget {
  const AddSearchScreen({
    super.key,
    required this.isStudentSearch,
  });
  final bool isStudentSearch;

  @override
  State<AddSearchScreen> createState() => _AddSearchScreenState();
}

class _AddSearchScreenState extends State<AddSearchScreen> {
  final TextEditingController _searchController = TextEditingController();
  bool isTextFieldActive = false;

  List<dynamic> allStudents = [];
  List<dynamic> foundStudents = [];
  List<dynamic> allViolationTypes = [];
  List<dynamic> foundViolationTypes = [];

  @override
  void initState() {
    final searchProvider = Provider.of<SearchProvider>(context, listen: false);
    allStudents = searchProvider.allStudent;
    allViolationTypes = searchProvider.allViolationTypes;
    super.initState();
  }

  // Future.microtask(() => searchProvider.getSearchStudent());
  // getData();
  // getData() async {
  //   final resStudent = await http.get(
  //     Uri.parse('${Variables.baseUrl}/api/student'),
  //   );
  //   final Map<String, dynamic> jsonStudents = json.decode(resStudent.body);
  //   allStudents = jsonStudents['student'];
  //   final resVioType = await http.get(
  //     Uri.parse('${Variables.baseUrl}/api/violations-types'),
  //   );
  //   final Map<String, dynamic> jsonVioType = json.decode(resVioType.body);
  //   allViolationTypes = jsonVioType['violation-types'];
  // if (allStudents.isNotEmpty && allViolationTypes.isNotEmpty) {
  //   log('students & teacher available !');
  // }
  // setState(() {});
  // }
  void _studentsFilter(String enteredKeyword) {
    List<dynamic> results = [];
    if (enteredKeyword.isEmpty) {
      results = allStudents;
    } else {
      results = allStudents
          .where((studentName) => studentName["name"]
              .toLowerCase()
              .contains(enteredKeyword.toLowerCase()))
          .toList();
    }
    setState(() {
      foundStudents = results;
    });
  }

  void _violationTypesFilter(String enteredKeyword) {
    List<dynamic> results = [];
    if (enteredKeyword.isEmpty) {
      results = allViolationTypes;
    } else {
      results = allViolationTypes
          .where((violationTypes) => violationTypes["name"]
              .toLowerCase()
              .contains(enteredKeyword.toLowerCase()))
          .toList();
    }
    setState(() {
      foundViolationTypes = results;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      appBar: AppBar(
        title: const Text(
          'Pencarian',
          style: TextStyle(
            color: ApsColor.white,
            fontWeight: FontWeight.w700,
            fontSize: 18,
          ),
        ),
        iconTheme: const IconThemeData(
          color: ApsColor.white,
        ),
        centerTitle: true,
        backgroundColor: ApsColor.primaryColor,
        bottom: PreferredSize(
          preferredSize: const Size(double.maxFinite, 78),
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
            color: ApsColor.primaryColor,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const SizedBox(),
                TextFormField(
                  controller: _searchController,
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.white,
                    contentPadding:
                        const EdgeInsets.only(right: 16, top: 10, bottom: 10),
                    hintText: widget.isStudentSearch
                        ? 'Ketuk untuk cari siswa'
                        : 'Ketuk untuk cari jenis pelanggaran',
                    hintStyle: const TextStyle(
                      fontSize: 14,
                      color: Colors.black87,
                    ),
                    prefix: const SizedBox(width: 12),
                    prefixIcon: const Icon(
                      Icons.search,
                      color: Color.fromRGBO(150, 152, 156, 1),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: const BorderSide(
                          width: 1, color: Color.fromRGBO(210, 215, 224, 1)),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: const BorderSide(
                          width: 1, color: Color.fromRGBO(210, 215, 224, 1)),
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  // onTap: () {
                  //   setState(() {
                  //     // students = searchProvider.students;
                  //     // isTextFieldActive = true;
                  //   });
                  // },
                  onChanged: (value) {
                    widget.isStudentSearch
                        ? _studentsFilter(value)
                        : _violationTypesFilter(value);
                    setState(() {
                      isTextFieldActive = true;
                    });
                  },
                ),
              ],
            ),
          ),
        ),
      ),
      resizeToAvoidBottomInset: false,
      body: ListView(
        children: [
          isTextFieldActive
              ? foundStudents.isNotEmpty || foundViolationTypes.isNotEmpty
                  ? FoundDataList(
                      foundStudents: foundStudents,
                      isStudentSearch: widget.isStudentSearch,
                      foundViolationTypes: foundViolationTypes,
                    )
                  : NotFoundDataList(value: _searchController.text)
              : AllDataList(
                  allStudents: allStudents,
                  allViolationTypes: allViolationTypes,
                  isStudentSearch: widget.isStudentSearch,
                ),
        ],
      ),
    );
  }
}
