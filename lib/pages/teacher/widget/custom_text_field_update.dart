import 'package:flutter/material.dart';
import 'package:frontend_aps/pages/teacher/pages/t_search_screen.dart';

class CustomTextFieldUpdate extends StatelessWidget {
  const CustomTextFieldUpdate({
    super.key,
    required this.controller,
    required this.hintText,
    required this.icon,
    required this.isSearch,
    required this.readOnly,
  });

  final TextEditingController controller;
  final String hintText;
  final Icon icon;
  final bool isSearch;
  final bool readOnly;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      readOnly: readOnly,
      minLines:
          hintText.contains('jenis') || hintText.contains('catatan') ? 1 : 1,
      maxLines:
          hintText.contains('jenis') || hintText.contains('catatan') ? 3 : 1,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      decoration: InputDecoration(
          hintText: hintText,
          hintStyle: const TextStyle(
            letterSpacing: 0.3,
            fontSize: 15,
          ),
          prefixIcon: icon, // ),
          border: const OutlineInputBorder(
            borderSide: BorderSide(width: 0.5),
            borderRadius: BorderRadius.all(
              Radius.circular(8),
            ),
          ),
          focusedBorder: readOnly
              ? const OutlineInputBorder(
                  borderSide: BorderSide(width: 0.5),
                  borderRadius: BorderRadius.all(
                    Radius.circular(8),
                  ),
                )
              : null),
      validator: (value) {
        if (value == null || value.isEmpty) {
          if (hintText.contains('siswa')) {
            return 'Nama siswa tidak boleh kosong.';
          } else if (hintText.contains('jenis')) {
            return 'Jenis Pelanggaran tidak boleh kosong.';
          } else if (hintText.contains('petugas')) {
            return 'Nama Petugas tidak boleh kosong.';
          } else if (hintText.contains('catatan')) {
            return 'Catatan tidak boleh kosong.';
          }
        }
        return null;
      },
      onTap: () {
        isSearch
            ? Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const AddSearchScreen(
                    isStudentSearch: false,
                  ),
                ),
              )
            : null;
      },
    );
  }
}
