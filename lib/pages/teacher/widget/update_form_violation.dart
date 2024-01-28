import 'package:flutter/material.dart';
import 'package:frontend_aps/common/constant/aps_color.dart';

class UpdateFormViolation extends StatelessWidget {
  const UpdateFormViolation({
    super.key,
    required this.controller,
  });
  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      autovalidateMode: AutovalidateMode.onUserInteraction,
      decoration: const InputDecoration(
        hintText: 'your.name@email.com',
        hintStyle: TextStyle(
          color: ApsColor.grey,
          letterSpacing: 0.2,
          fontSize: 14,
        ),
        prefixIcon: Padding(
          padding: EdgeInsets.only(left: 8, right: 8),
          child: Icon(Icons.mail_outline),
        ),
        border: OutlineInputBorder(
          borderSide: BorderSide(width: 0.5),
          borderRadius: BorderRadius.all(
            Radius.circular(8),
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(width: 0.5),
          borderRadius: BorderRadius.all(
            Radius.circular(8),
          ),
        ),
      ),
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Email tidak boleh kosong.';
        }
        return null;
      },
    );
  }
}
