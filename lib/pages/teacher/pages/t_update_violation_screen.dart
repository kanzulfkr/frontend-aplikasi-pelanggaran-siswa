import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../common/widget/custom_app_bar.dart';
import '../../../provider/store_violation_provider.dart';
import '../widget/custom_text_form_field.dart';
import '../widget/title_form_field.dart';

class UpdateViolationScreen extends StatefulWidget {
  const UpdateViolationScreen({super.key});

  @override
  State<UpdateViolationScreen> createState() => _UpdateViolationScreenState();
}

class _UpdateViolationScreenState extends State<UpdateViolationScreen> {
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
      appBar: const CustomAppBar(title: 'Edit Data Pelanggaran'),
      body: Form(
        key: _formKey,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: ListView(
            children: [
              const SizedBox(height: 10),
              const TitleFormField(title: 'Siswa'),
              CustomTextFormField(
                controller: storeProv.studentController,
                hintText: 'Pilih nama siswa',
                icon: const Icon(Icons.person_2_outlined),
                isStudentSearch: true,
                readOnly: true,
              ),
              const TitleFormField(title: 'Jenis Pelanggaran'),
              CustomTextFormField(
                controller: storeProv.violationTypesController,
                hintText: 'Pilih jenis pelanggaran',
                icon: const Icon(Icons.file_copy_outlined),
                isStudentSearch: false,
                readOnly: true,
              ),
              const TitleFormField(title: 'Petugas'),
              CustomTextFormField(
                controller: storeProv.officerController,
                hintText: 'Pilih nama petugas',
                icon: const Icon(Icons.person_2_outlined),
                isStudentSearch: false,
                readOnly: true,
              ),
              const TitleFormField(title: 'Catatan'),
              CustomTextFormField(
                controller: catatanController,
                hintText: 'Tuliskan catatan',
                icon: const Icon(Icons.note_alt_outlined),
                isStudentSearch: false,
                readOnly: false,
              ),
              const SizedBox(height: 20),
              const SizedBox(height: 40),
            ],
          ),
        ),
      ),
    );
  }
}
