import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:frontend_aps/pages/teacher/widget/button_update.dart';
import 'package:frontend_aps/pages/teacher/widget/custom_text_field_update.dart';
import 'package:provider/provider.dart';
import '../../../common/widget/custom_app_bar.dart';
import '../../../provider/store_violation_provider.dart';
import '../widget/text_title_form_field.dart';

class UpdateViolationScreen extends StatefulWidget {
  const UpdateViolationScreen({
    super.key,
    required this.id,
    required this.catatan,
  });
  final int id;
  final String catatan;

  @override
  State<UpdateViolationScreen> createState() => _UpdateViolationScreenState();
}

class _UpdateViolationScreenState extends State<UpdateViolationScreen> {
  TextEditingController catatanController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    // final storeProv =
    //     Provider.of<StoreViolationProvider>(context, listen: false);
    // storeProv.studentController;
    // storeProv.officerControllerStore;
    // storeProv.violationTypesController;
    catatanController;
    super.dispose();
  }

  @override
  void initState() {
    catatanController.text = widget.catatan;
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
      backgroundColor: Colors.grey.shade100,
      body: Form(
        key: _formKey,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: ListView(
            children: [
              const SizedBox(height: 10),
              const TitleFormField(title: 'Siswa'),
              CustomTextFieldUpdate(
                controller: storeProv.studentController,
                hintText: 'Pilih nama siswa',
                icon: const Icon(Icons.person_2_outlined),
                isSearch: false,
                readOnly: true,
              ),
              const TitleFormField(title: 'Jenis Pelanggaran'),
              CustomTextFieldUpdate(
                controller: storeProv.violationTypesController,
                hintText: 'Pilih jenis pelanggaran',
                icon: const Icon(Icons.file_copy_outlined),
                isSearch: true,
                readOnly: true,
              ),
              const TitleFormField(title: 'Petugas'),
              CustomTextFieldUpdate(
                controller: storeProv.officerControllerUpdate,
                hintText: 'Pilih nama petugas',
                icon: const Icon(Icons.person_2_outlined),
                isSearch: false,
                readOnly: true,
              ),
              const TitleFormField(title: 'Catatan'),
              CustomTextFieldUpdate(
                controller: catatanController,
                hintText: 'Tuliskan catatan',
                icon: const Icon(Icons.note_alt_outlined),
                isSearch: false,
                readOnly: false,
              ),
              const SizedBox(height: 20),
              // PrimaryButton(
              //     name: 'Simpan perubahan.',
              //     onPress: () {
              //       customAlertDialog(
              //         context,
              //         'Hapus data pelanggaran',
              //         'Apakah anda yakin untuk menghapus data pelanggaran tersebut?',
              //         'Data telah Berhasil di hapus.',
              //         () {
              //           print(widget.id);
              //           print(storeProv.getStudentId);
              //           print(storeProv.getOfficerIdUpdate);
              //           print(storeProv.getViolationTypesId);
              //           print(storeProv.studentController.text);
              //           print(storeProv.officerControllerStore.text);
              //           print(storeProv.violationTypesController.text);
              //           print(widget.catatan);
              //           // Provider.of<DeleteViolationProvider>(
              //           //         context,
              //           //         listen: false)
              //           //     .deleteViolation(
              //           //         widget.violation.id!);
              //           // log("Delete Violation Api..");
              //           // Navigator.of(context).pop();
              //           // setState(() {
              //           //   context.read<ViolationBloc>().add(
              //           //       const ViolationEvent
              //           //           .getViolation());
              //           // });
              //           // if (context.mounted) {
              //           //   ScaffoldMessenger.of(context)
              //           //       .showSnackBar(
              //           //     const SnackBar(
              //           //       content: Center(
              //           //         child: Text(
              //           //           'Data telah berhasil di hapus.',
              //           //         ),
              //           //       ),
              //           //       backgroundColor:
              //           //           ApsColor.primaryColor,
              //           //       showCloseIcon: true,
              //           //       closeIconColor: Colors.white,
              //           //     ),
              //           //   );
              //           // }
              //         },
              //       );
              //     },
              // ),
              ButtonUpdate(
                id: widget.id,
                formKey: _formKey,
                catatanController: catatanController,
              ),

              const SizedBox(height: 40),
            ],
          ),
        ),
      ),
    );
  }
}
