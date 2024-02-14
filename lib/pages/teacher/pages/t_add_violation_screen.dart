import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:frontend_aps/pages/teacher/widget/button_store.dart';
import 'package:provider/provider.dart';
import '../../../common/widget/custom_app_bar.dart';
import '../../../provider/store_violation_provider.dart';
import '../widget/custom_text_field_store.dart';
import '../widget/text_title_form_field.dart';

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
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

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
    final storeProv =
        Provider.of<StoreViolationProvider>(context, listen: false);
    Future.microtask(() => storeProv.getSearchStudent());
    Future.microtask(() => storeProv.getSearchViolationTypes());
    log('Search student & violation types provider');
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final storeProv =
        Provider.of<StoreViolationProvider>(context, listen: false);
    return Scaffold(
      appBar: const CustomAppBar(title: 'Tambah Data Pelanggaran'),
      backgroundColor: Colors.grey.shade100,
      body: Hero(
        tag: 'hero',
        child: Form(
          key: _formKey,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: ListView(
              children: [
                const SizedBox(height: 10),
                const TitleFormField(title: 'Siswa'),
                CustomTextFieldStore(
                  controller: storeProv.studentController,
                  hintText: 'Pilih nama siswa',
                  icon: const Icon(Icons.person_2_outlined),
                  isStudentSearch: true,
                  readOnly: true,
                ),
                const TitleFormField(title: 'Jenis Pelanggaran'),
                CustomTextFieldStore(
                  controller: storeProv.violationTypesController,
                  hintText: 'Pilih jenis pelanggaran',
                  icon: const Icon(Icons.file_copy_outlined),
                  isStudentSearch: false,
                  readOnly: true,
                ),
                const TitleFormField(title: 'Petugas'),
                CustomTextFieldStore(
                  controller: storeProv.officerControllerStore,
                  hintText: 'Pilih nama petugas',
                  icon: const Icon(Icons.person_2_outlined),
                  isStudentSearch: false,
                  readOnly: true,
                ),
                const TitleFormField(title: 'Catatan'),
                CustomTextFieldStore(
                  controller: catatanController,
                  hintText: 'Tuliskan catatan',
                  icon: const Icon(Icons.note_alt_outlined),
                  isStudentSearch: false,
                  readOnly: false,
                ),
                const SizedBox(height: 20),
                ButtonStore(
                  formKey: _formKey,
                  studentController: storeProv.studentController,
                  officerController: officerController,
                  catatanController: catatanController,
                ),
                const SizedBox(height: 40),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
