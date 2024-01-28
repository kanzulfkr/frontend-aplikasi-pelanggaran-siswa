import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:frontend_aps/common/widget/btn_primary.dart';
import 'package:provider/provider.dart';
import '../../../bloc/search/student_provider.dart';
import '../../../common/widget/custom_app_bar.dart';
import '../widget/custom_text_form_field.dart';
import '../widget/title_form_field.dart';

class AddViolationScreen extends StatefulWidget {
  const AddViolationScreen({super.key});

  @override
  State<AddViolationScreen> createState() => _AddViolationScreenState();
}

class _AddViolationScreenState extends State<AddViolationScreen> {
  TextEditingController studentController = TextEditingController();
  TextEditingController violationController = TextEditingController();
  TextEditingController officerController = TextEditingController();
  TextEditingController catatanController = TextEditingController();

  @override
  void dispose() {
    studentController;
    violationController;
    officerController;
    catatanController;
    super.dispose();
  }

  @override
  void initState() {
    final searchProvider = Provider.of<SearchProvider>(context, listen: false);
    Future.microtask(() => searchProvider.getSearchStudent());
    Future.microtask(() => searchProvider.getSearchViolationTypes());
    log('Search student & violation types provider');
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final searchProv = Provider.of<SearchProvider>(context, listen: false);
    return Scaffold(
      appBar: const CustomAppBar(title: 'Tambah Data Pelanggaran'),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: ListView(
          children: [
            const SizedBox(height: 10),
            const TitleFormField(title: 'Siswa'),
            CustomTextFormField(
              controller: searchProv.studentController,
              hintText: 'Pilih nama siswa',
              icon: const Icon(Icons.person_2_outlined),
              isStudentSearch: true,
              readOnly: true,
              onTap: true,
            ),
            const TitleFormField(title: 'Jenis Pelanggaran'),
            CustomTextFormField(
              controller: searchProv.violationTypesController,
              hintText: 'Pilih jenis pelanggaran',
              icon: const Icon(Icons.file_copy_outlined),
              isStudentSearch: false,
              readOnly: true,
              onTap: true,
            ),
            const TitleFormField(title: 'Petugas'),
            CustomTextFormField(
              controller: officerController,
              hintText: 'Pilih nama petugas',
              icon: const Icon(Icons.person_2_outlined),
              isStudentSearch: false,
              readOnly: false,
              onTap: false,
            ),
            const TitleFormField(title: 'Catatan'),
            CustomTextFormField(
              controller: catatanController,
              hintText: 'Tuliskan catatan',
              icon: const Icon(Icons.note_alt_outlined),
              isStudentSearch: false,
              readOnly: false,
              onTap: false,
            ),
            const SizedBox(height: 70),
            PrimaryButton(name: 'Tambah Data', onPress: () {})
          ],
        ),
      ),
    );
  }
}
