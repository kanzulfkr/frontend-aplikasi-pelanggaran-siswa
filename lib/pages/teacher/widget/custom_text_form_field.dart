import 'package:flutter/material.dart';
import 'package:frontend_aps/pages/teacher/pages/t_search_screen.dart';

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField({
    super.key,
    required this.controller,
    required this.hintText,
    required this.icon,
    required this.isStudentSearch,
    required this.readOnly,
    required this.onTap,
  });

  final TextEditingController controller;
  final String hintText;
  final Icon icon;
  final bool isStudentSearch;
  final bool readOnly;
  final bool onTap;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      readOnly: readOnly,
      maxLines: hintText == 'Tuliskan catatan' ? 3 : 1,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: const TextStyle(
          color: Colors.black54,
          letterSpacing: 0.3,
          fontSize: 15,
        ),
        prefixIcon: Padding(
          padding: const EdgeInsets.only(left: 8, right: 8),
          child: icon,
        ),
        border: const OutlineInputBorder(
          borderSide: BorderSide(width: 0.5),
          borderRadius: BorderRadius.all(
            Radius.circular(8),
          ),
        ),
      ),
      onTap: () {
        onTap
            ? Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => AddSearchScreen(
                    isStudentSearch: isStudentSearch,
                  ),
                ),
              )
            : null;
      },
    );
  }
}
 // TextFormField(
            //   controller: officerController,
            //   readOnly: true,
            //   autovalidateMode: AutovalidateMode.onUserInteraction,
            //   decoration: const InputDecoration(
            //     hintText: 'John Doe',
            //     hintStyle: TextStyle(
            //       color: Colors.black54,
            //       letterSpacing: 0.3,
            //       fontSize: 15,
            //     ),
            //     prefixIcon: Padding(
            //       padding: EdgeInsets.only(left: 8, right: 8),
            //       child: Icon(Icons.person),
            //     ),
            //     border: OutlineInputBorder(
            //       borderSide: BorderSide(width: 0.5),
            //       borderRadius: BorderRadius.all(
            //         Radius.circular(8),
            //       ),
            //     ),
            //   ),
            //   onTap: () {},
            // ),
             // TextFormField(
            //   controller: searchProv.violationTypesController,
            //   readOnly: true,
            //   autovalidateMode: AutovalidateMode.onUserInteraction,
            //   decoration: const InputDecoration(
            //     hintText: 'Pilih jenis pelanggaran',
            //     hintStyle: TextStyle(
            //       color: Colors.black54,
            //       letterSpacing: 0.3,
            //       fontSize: 15,
            //     ),
            //     prefixIcon: Padding(
            //       padding: EdgeInsets.only(left: 8, right: 8),
            //       child: Icon(Icons.file_present_outlined),
            //     ),
            //     border: OutlineInputBorder(
            //       borderSide: BorderSide(width: 0.5),
            //       borderRadius: BorderRadius.all(
            //         Radius.circular(8),
            //       ),
            //     ),
            //   ),
            //   onTap: () {
            //     Navigator.push(
            //       context,
            //       MaterialPageRoute(
            //         builder: (context) => const AddSearchScreen(
            //           isStudentSearch: false,
            //         ),
            //       ),
            //     );
            //   },
            // ),